#include <windows.h>
#include <stdio.h>
#include <process.h>   //多线程相关的时候就需要#include <process.h>提供了两个对多线程进行支持的函数，即线程的创建和终结没有对线程挂起和恢复进行操作的函数。 
#include <time.h>
#include <conio.h> 

unsigned _stdcall simulator(void *); //定义函数 
unsigned _stdcall inspector(void *);//unsigned是指函数的返回值类型是无符号整数 _stdcall是说明函数参数是从右向左通过堆栈传递的
LPVOID BASE_PTR; //线程函数库指针 
int Actnum=0;  //全局变量 


//主函数，主要是用于启动用于模拟虚存活动和进行监控的两个线程；
int main(int argc, char* argv[])
{
	unsigned  ThreadID[2]; //定义数组 
	_beginthreadex(NULL,0,simulator,NULL,0,&ThreadID[0]);   //用来创建新程序的C runtime函数。所创建的线程执行指定的可执行模块。
	_beginthreadex(NULL,0,inspector,NULL,0,&ThreadID[1]);
 //第1个参数：安全属性，NULL为默认安全属性
 //第2个参数：指定线程堆栈的大小。如果为0，则线程堆栈大小和创建它的线程的相同。一般用0
 //第3个参数：指定线程函数的地址，也就是线程调用执行的函数地址(用函数名称即可，函数名称就表示地址)
 //第4个参数：传递给线程的参数的指针，可以通过传入对象的指针，在线程函数中再转化为对应类的指针
 //第5个参数：线程初始状态，0:立即运行；CREATE_SUSPEND：suspended（悬挂）
 //第6个参数：用于记录线程ID的地址
    getchar(); //输入回车即可终止程序；
	return 0;
	
} 

//模拟一系列的虚存活动，作为一个独立的线程运行；
unsigned _stdcall simulator(void *)
{
 	DWORD OldProtect; //创建一个进程 ，一般用于返回值不会有负数的情况。 
 	int randnum;

 	printf("现在模拟器程序已经启动。\n");
 	//产生一个随机数种子；
 	srand( (unsigned)time( NULL ) );

 	//在一个死循环中，用随机数控制，不断进行虚存操作活动；
	while(1)
 	{
   		Sleep(500);//控制整个模拟和监控的速度；
   		while (Actnum!=0)
   		{
    		Sleep(500);//等待，直到监控线程捕捉到上一个模拟动作后再继续下一个动作；
   		}
   		randnum=7&rand();
   		switch(randnum)//注意各个动作中的虚存指针均使用BASE_PTR;它在过程中由虚存分配
				 		//函数动态调整,如果某动作不成功，则将不会被监控线程监控到；
   		{
     		case 0:
      			if (BASE_PTR=VirtualAlloc(NULL,1024*32,MEM_RESERVE|MEM_COMMIT,
							  PAGE_READWRITE))
	   			{
					Actnum=1;//虚存的保留与提交;
	   			}
	  		break;
     		case 1:
      			if (VirtualFree(BASE_PTR,1024*32,MEM_DECOMMIT))
      		 	{
	    			Actnum=2;//虚存的除配;
	   			}
	  		break;
     		case 2:
      			if (VirtualFree(BASE_PTR,0,MEM_RELEASE))
	   			{
	    			Actnum=3;//虚存的除配并释放虚存空间;
	   			}
	  		break;
     		case 3:
      			if (VirtualProtect(BASE_PTR,1024*32,PAGE_READONLY,&OldProtect))//改变虚拟内存的保护方式。
       			{
	    			Actnum=4;
	   			}
	  		break;
     		case 4:
      			if (VirtualLock(BASE_PTR,1024*12))
       			{
	    			Actnum=5;//锁定虚拟内存页;
	   			}
	  		break;
     		case 5:
      			if (BASE_PTR=VirtualAlloc(NULL,1024*32,MEM_RESERVE,PAGE_READWRITE)) 
				  //保留（或）提交某一范围的虚拟地址。当在一个进程保留一段虚拟地址时，并没有物理内存页被提交。而且，保留一个地址范围将来会有可用的物理内存来提交给这些地址。要使用保留的地址，内存首先必须被提交给该地址，当内存被提交时，内存物理页被分配。
	   			{
	    			Actnum=6;//虚存的保留;
	   			}
	  		break;
     		default:
	  		break;
   		}//end of 'switch'
 	}//end of 'while'
   return 0;
}


//通过一个全局的变量来监视另一模拟线程的模拟活动，并通过适当的信息
//查询函数，将存储的使用和活动情况打出报告；
unsigned _stdcall inspector(void *)
{
int  QuOut=0;	
char para1[3000];
MEMORYSTATUS Vmeminfo;
char tempstr[100];
MEMORY_BASIC_INFORMATION inspectorinfo1; //
int structsize = sizeof(MEMORY_BASIC_INFORMATION);

printf("现在监视器开始工作\n");
//在一个死循环中不断通过一个全局变量（监视器），来监控模拟线程是否
//有新的动作，如果有，通过的API函数将相应虚存处(通过共用BASE_PTR
//实现)的信息进行检查，从而验证该动作对存储使用的影响；
while(1)
{
 Sleep(1000); //使当前线程休眠。
 if(Actnum!=0)
 {
  //通过全局变量（监视器）Actnum,来获取上一个虚存动作的类型
  //并相应构造监控信息的头部；
  switch(Actnum)
  {
   case 1:
    memset (&inspectorinfo1, 0, structsize);//buffer：为指针或是数组,c：是赋给buffer的值,count：是buffer的长度.
    VirtualQuery((LPVOID)BASE_PTR,&inspectorinfo1,structsize); //查询一个进程的虚拟内存
    strcpy(para1,"目前执行动作：虚存的保留与提交\n");
    break;
   case 2:
    memset (&inspectorinfo1, 0, structsize);
    VirtualQuery((LPVOID)BASE_PTR,&inspectorinfo1,structsize);
    strcpy(para1,"目前执行动作：虚存的除配\n");
    break;
   case 3:
    memset (&inspectorinfo1, 0, structsize);
    VirtualQuery((LPVOID)BASE_PTR,&inspectorinfo1,structsize);
    strcpy(para1,"目前执行动作：虚存的除配并释放虚存空间\n");
    break;
   case 4:
    memset (&inspectorinfo1, 0, structsize);
    VirtualQuery((LPVOID)BASE_PTR,&inspectorinfo1,structsize);
    strcpy(para1,"目前执行动作：改变虚拟内存页的保护\n");
    break;
   case 5:
    memset (&inspectorinfo1, 0, structsize);
    VirtualQuery((LPVOID)BASE_PTR,&inspectorinfo1,structsize);
    strcpy(para1,"目前执行动作：锁定虚拟内存页\n");
    break;
   case 6:
    memset (&inspectorinfo1, 0, structsize);
    VirtualQuery((LPVOID)BASE_PTR,&inspectorinfo1,structsize);
    strcpy(para1,"目前执行动作：虚存的保留\n");
    break;
   default: 
    break;
  }

  //实时显示固定格式的相关材料；通过目前监控到的动作所发生
  //的虚存地址，监控该活动对相应存储空间的影响；
  sprintf(tempstr,"开始地址：0X%x\n",inspectorinfo1.BaseAddress);
  strcat(para1,tempstr); 
  sprintf(tempstr,"区块大小(目前指针处向前同一属性的块)：0X%x\n",
		inspectorinfo1.RegionSize);
  strcat(para1,tempstr);
  sprintf(tempstr,"目前状态：0X%x\n",inspectorinfo1.State);
  strcat(para1,tempstr);
  sprintf(tempstr,"分配时访问保护:0X%x\n",inspectorinfo1.AllocationProtect);
  strcat(para1,tempstr);
  sprintf(tempstr,"当前访问保护:0X%x\n",inspectorinfo1.Protect);
  strcat(para1,tempstr);
  strcat(para1,"(状态:10000代表未分配 ;1000代表提交 ;2000代表保留; )\n");
  strcat(para1,"(保护方式:0代表其它;1代表禁止访问;2代表只读;4代表读写;\n10代表可执");
  strcat(para1," 行;20代表可读和执行; 40代表可读写和执行;)\n*******************\n");

  //全局信息，报告目前系统和当前进程的存储使用总体情况；
  GlobalMemoryStatus(&Vmeminfo); //该函数用于获取程序存储空间的使用状况以及系统的使用概况。
  strcat(para1,"当前整体存储统计如下\n");
  sprintf(tempstr,"物理内存总数：%d(BYTES)\n",Vmeminfo.dwTotalPhys);
  strcat(para1,tempstr); //trcat是用来连接两个字符串
  sprintf(tempstr,"可用物理内存数：%d(BYTES)\n",Vmeminfo.dwAvailPhys);
  strcat(para1,tempstr);
  sprintf(tempstr,"页面文件总数：%d(BYTES)\n",Vmeminfo.dwTotalPageFile);
  strcat(para1,tempstr);
  sprintf(tempstr,"可用页面文件数：%d(BYTES)\n",Vmeminfo.dwAvailPageFile);
  strcat(para1,tempstr);
  sprintf(tempstr,"虚存空间总数：%d(BYTES)\n",Vmeminfo.dwTotalVirtual);
  strcat(para1,tempstr);
  sprintf(tempstr,"可用虚存空间数：%d(BYTES)\n",Vmeminfo.dwAvailVirtual);
  strcat(para1,tempstr);
  sprintf(tempstr,"物理存储使用负荷:%%%d\n\n\n\n",Vmeminfo.dwMemoryLoad);
  strcat(para1,tempstr);//trcat是用来连接两个字符串
  printf("%s",para1);//显示报告内容
  //(这里可以同时将报告内容记录进日志文件)；
  Actnum=0;//通知模拟线程可以进行下一个模拟动作；
  Sleep(500);//调节模拟和监控的总体速度；
  }//for if 
}//for while

return 0;
}

