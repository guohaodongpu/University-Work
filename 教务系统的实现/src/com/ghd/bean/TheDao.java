package com.ghd.bean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.jdbc.Statement;

public class TheDao {
	public static Connection getConnection(){
		// 数据库连接
		Connection conn = null;
		try {
			// 加载数据库驱动，注册到驱动管理器
			Class.forName("com.mysql.jdbc.Driver");
			// 数据库连接字符串
			String url = "jdbc:mysql://localhost:3306/ghd";
			// 数据库用户名
			String username = "root";
			// 数据库密码
			String password = "123456";
			// 创建Connection连接
			conn = DriverManager.getConnection(url,username,password);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		// 返回数据库连接
		return conn;		
}

	 public static void close(ResultSet rs,PreparedStatement psta,Connection con)throws Exception{
		
		        if(rs!=null){  
	                 //关闭结果集  
	                rs.close();  
	        }  
	        if(psta!=null){  
	                 //关闭操作句柄  
	                 psta.close();  
	        }  
	        if(con!=null){  
	                //关闭链接  
	                con.close();  
	        }  
	    }  
 
	  
}
