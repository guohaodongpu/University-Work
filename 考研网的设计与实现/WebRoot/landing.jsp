<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="utf-8"%>
<%@ page contentType="text/html;charset=utf-8"%>
<html>
<head><title>登陆</title></head>
<body>

<%!   
  public static final String DBDRIVER="com.mysql.jdbc.Driver";
  
  public static final String DBURL="jdbc:mysql://localhost:3306/ghd";
  public static final String DBUSER="root";
  public static final String DBPASS="123456";

  
%>


<% 	
		boolean flag=false;
		String user=request.getParameter("user");	
		String usename=request.getParameter("usename");	 
		String password=request.getParameter("password");	
		/*String user=request.getParameter("user").toString();*/


		if("stu".equals(user)){
	
	
		Connection conn=null;
  		PreparedStatement pstmt=null;
 	 	ResultSet sc=null;
		String susename=usename;
   		String spassword=password;
		String sql = "SELECT susename from stu where susename=? and spassword=?";

try {
   Class.forName(DBDRIVER);
   conn = DriverManager.getConnection(DBURL,DBUSER,DBPASS);
   pstmt = conn.prepareStatement(sql);
   pstmt.setString(1,susename);
   pstmt.setString(2,spassword);
   sc = pstmt.executeQuery();
   if(sc.next()) {
    out.println(sc.getString("susename"));
     flag = true;

   } 
   sc.close();
   pstmt.close();
   conn.close();
}catch (Exception e) {
   out.println(e);
}

 if(flag){
 	response.sendRedirect("student.jsp");
 
 }   
 else  {
 	response.sendRedirect("langing_f.html");
 } 
    
    }
    
    else if("admin".equals(user)){
    Connection conn=null;
  	PreparedStatement pstmt=null;
 	ResultSet sc=null;
    String ausename=usename;
   	String apassword=password;
	String sql = "SELECT ausename from admin where ausename=? and apassword=?";

try {
   Class.forName(DBDRIVER);
   conn = DriverManager.getConnection(DBURL,DBUSER,DBPASS);
   pstmt = conn.prepareStatement(sql);
   pstmt.setString(1,ausename);
   pstmt.setString(2,apassword);
   sc = pstmt.executeQuery();
   if(sc.next()) {
    out.println(sc.getString("ausename"));
     flag = true;
 
   } 
   sc.close();
   pstmt.close();
   conn.close();
}catch (Exception e) {
   out.println(e);
}

 if(flag){
 	response.sendRedirect("admin_one.html");
 
 }   
 else  {
 	response.sendRedirect("langing_f.html");
 } 
    

    }
 
 

   %>

</body>
</html>