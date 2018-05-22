
#include<stdio.h>
#include<windows.h> 
//郭浩东-1514011447-A05 
int MaoPao(int a[],int n);

int main()
{
 
    int array[9] = { 2, 1, 3, 6, 5, 4, 7, 9, 8 };
    int location;
    MaoPao(array,9);
 
    printf("最终排序结果为：");
    for(int i=0; i<9; i++)
    printf("%d  ", array[i]);
 
    printf("\n\n");
    system("pause");
    return 0;
}  

int MaoPao(int a[],int n)
{
    
    for(int i=0; i<n-1; i++)
    {
        for(int j=0; j<n-1-i; j++)
        {
            if(a[j] > a[j+1])
            {
                int temp = a[j];
                a[j] = a[j+1];
                a[j+1]=temp;
            }
        }
    }
}
