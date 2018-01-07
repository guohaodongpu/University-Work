package org.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.jdbc.Driver;
/*
 * hh.todd@qq.com
 * 
 *配置jdbc，连接到MySQL数据库
 * 
 *要将jdbc的驱动导入到工程中
 * 
 * */

public class DbConnection{
	static{
		try{
			Class.forName("com.mysql.jdbc.Driver"); 
			//保证相应的Driver类已经被加载到jvm中
		}
		catch (ClassNotFoundException e) {
			// TODO: handle exception
			System.out.print("Error loading Mysql Driver!");  
			e.printStackTrace();
		}
		/*try {
			com.mysql.jdbc.Driver driver=new com.mysql.jdbc.Driver();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
	}
	public static Connection getConnection(){
		Connection con=null;
		System.out.print("access getConnection()"); 
		String url="jdbc:mysql://127.0.0.1:3306/new_schema";
		//连接到MySQL中名叫new_schema的数据库；
		String user="root";
		//登陆到MySQL的用户名；
		String password="1111";
		//登陆到MySQL的密码；
		try{
			con=DriverManager.getConnection(url, user, password);
			//Attempts to establish a connection to the given database URL
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return con;
	}
	
	//定义closeConnection（）方法
	public static void closeConnection(ResultSet rs,PreparedStatement ps,Connection con){
		if(rs!=null){
			try{
				System.out.print("rs.close();!");  
				rs.close();
			}catch (SQLException e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		if(ps!=null){
			try{
				System.out.print("ps.close()!"); 
				ps.close(); 
			}catch (SQLException e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		if(con!=null){
			try{
				System.out.print("con.close();!");  
				con.close();
			}catch (SQLException e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
	}
}
