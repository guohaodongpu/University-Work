package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import util.DBAccess;
import bean.User;

public class UserDAO {
	public User checkLogin(String username, String password) {
		String sql = "select * from user where username=? and password=?";
		PreparedStatement ps = null;
		ResultSet rs = null;
		Connection conn = null;
		User user=null;
		try {
			conn = DBAccess.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, username);
			ps.setString(2, password);
			rs = ps.executeQuery();
			if (rs.next()) {
				if (rs.getString("username").equals(username)
						&& rs.getString("password").equals(password)) {
					user=new User();
					user.setId(rs.getInt("id"));
					user.setUsername(rs.getString("username"));
					user.setPassword(rs.getString("password"));
				}
			}
			rs.close();
			ps.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return user;
	}

}
