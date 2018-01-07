package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBAccess {
	public DBAccess(){
	}
	public static Connection getConnection(){
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			System.out.println("驱动程序未找到!");
			e.printStackTrace();
		}
		String url="jdbc:mysql://localhost:3306/file?characterEncoding=gbk";
		String user="root";
		String password="123";
		Connection conn=null;
		try {
			conn=DriverManager.getConnection(url, user, password);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("数据库链接有误，请检查链接串及其密码是否正确!");
			e.printStackTrace();
		}
		return conn;
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
        Connection connection=getConnection();
	}

}
