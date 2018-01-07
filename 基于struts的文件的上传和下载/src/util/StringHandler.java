package util;
import java.text.SimpleDateFormat;
import java.util.Date;

public class StringHandler {
	public static String timeTostr(Date date){
		String strDate="";
		SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		strDate=format.format(date);		
		return strDate;
	}
	public static String getSerial(Date date,int index){
		long msel=date.getTime();
		SimpleDateFormat fm=new SimpleDateFormat("MMddyyyyHHmmssSS");
		msel+=index;					
		date.setTime(msel);				
		String serials=fm.format(date);
		return serials;
	}	
	public static String changehtml(String str){
		String change="";
		if(str!=null&&!str.equals("")){
			change=str.replace("&","&amp;");			
			change=change.replace(" ","&nbsp;");
			change=change.replace("<","&lt;");
			change=change.replace(">","&gt;");
			change=change.replace("\"","&quot;");
			change=change.replace("\r\n","<br>");
		}
		return change;
	}	
}
