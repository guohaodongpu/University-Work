package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import util.DBAccess;
import util.PageListData;
import bean.FileInfo;

public class FileDAO {
	DBAccess db = new DBAccess();

	public boolean isExsitSameFileName(String filename,
			HttpServletRequest request) {
		boolean flag = false;
		PreparedStatement ps = null;
		ResultSet rs = null;
		Connection connection = db.getConnection();
		String sql = "select * from file where filename=?";
		try {
			ps = connection.prepareStatement(sql);
			ps.setString(1, filename);
			rs = ps.executeQuery();
			if (rs.next()) {
				FileInfo fileInfo = new FileInfo();
				fileInfo.setFileId(rs.getString("fileid"));
				fileInfo.setFileInfo(rs.getString("fileinfo"));
				fileInfo.setFileIp(rs.getString("fileip"));
				fileInfo.setFileName(rs.getString("filename"));
				fileInfo.setFileSavename(rs.getString("filesavename"));
				fileInfo.setFileSize((rs.getString("filesize")));
				fileInfo.setFileTag(rs.getString("filetag"));
				fileInfo.setFileTimes(Integer.parseInt(rs
						.getString("filetimes")));
				fileInfo.setFileType(rs.getString("filetype"));
				fileInfo.setFileUptime(rs.getString("fileuptime"));
				java.io.File f = new java.io.File(request.getSession()
						.getServletContext().getRealPath("/")
						+ fileInfo.getFileSavename());
				if (f.isFile())
					flag = true;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				connection.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return flag;
	}

	public boolean saveFile(FileInfo fileInfo) {
		boolean flag = false;
		PreparedStatement ps = null;
		Connection connection = db.getConnection();
		String sql = "insert into file(fileId,fileSavename,fileName,fileType,fileSize,fileInfo,fileUptime,fileIp,fileTimes,fileTag) "
				+ "values(?,?,?,?,?,?,?,?,?,?)";
		try {
			ps = connection.prepareStatement(sql);
			ps.setString(1, fileInfo.getFileId());
			ps.setString(2, fileInfo.getFileSavename());
			ps.setString(3, fileInfo.getFileName());
			ps.setString(4, fileInfo.getFileType());
			ps.setString(5, String.valueOf(fileInfo.getFileSize()));
			String fileString = fileInfo.getFileInfo();
			// fileString.replaceAll("\n", "").replaceAll("@", "");
			ps.setString(6, fileString);
			ps.setString(7, fileInfo.getFileUptime());
			ps.setString(8, fileInfo.getFileIp());
			ps.setString(9, String.valueOf(fileInfo.getFileTimes()));
			ps.setString(10, fileInfo.getFileTag());
			int i = ps.executeUpdate();
			if (i == 1)
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				ps.close();
				connection.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return flag;
	}

	public PageListData queryFile(int currentPage, int pageSize) {
		boolean flag = false;
		PageListData pageListData = null;
		PreparedStatement ps = null;
		PreparedStatement ps1 = null;
		PreparedStatement ps2 = null;
		ResultSet rs = null;
		ResultSet rs2 = null;
		int totalcount = 0;
		List list = new ArrayList<FileInfo>();
		Connection connection = db.getConnection();
		String sql1 = "select * from file order by fileuptime desc";
		String sql2 = "delete from file where filesavename=?";
		String sql3 = "select count(*)from file";
		try {
			ps = connection.prepareStatement(sql1);
			rs = ps.executeQuery();
			if ((currentPage - 1) * pageSize != 0)
				rs.absolute((currentPage - 1) * pageSize);
			int i = 0;
			while (rs.next() && i++ < pageSize) {
				FileInfo fileInfo = new FileInfo();
				fileInfo.setFileId(rs.getString("fileid"));
				fileInfo.setFileInfo(formatString(rs.getString("fileinfo"), 15));
				fileInfo.setFileIp(rs.getString("fileip"));
				String filename = rs.getString("filename");
				fileInfo.setFileName(filename);
				fileInfo.setFileSavename(rs.getString("filesavename"));
				fileInfo.setFileSize(rs.getString("filesize"));
				fileInfo.setFileTag(rs.getString("filetag"));
				fileInfo.setFileTimes(Integer.parseInt(rs
						.getString("filetimes")));
				fileInfo.setFileType(rs.getString("filetype"));
				fileInfo.setFileUptime(rs.getString("fileuptime"));
				// java.io.File f = new java.io.File(request.getSession()
				// .getServletContext().getRealPath("/")
				// + fileInfo.getFileSavename());
				// if (f.isFile())
				list.add(fileInfo);
				// else {
				// ps1 = connection.prepareStatement(sql2);
				// ps1.setString(1, fileInfo.getFileSavename());
				// ps1.executeUpdate();
				// ps1.close();
				// }
			}
			rs.close();
			ps.close();
			ps2 = connection.prepareStatement(sql3);
			rs2 = ps2.executeQuery();
			while (rs2.next()) {
				totalcount = rs2.getInt(1);
			}
			pageListData = new PageListData(totalcount, pageSize, currentPage,
					list);
			rs2.close();
			ps2.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pageListData;
	}

	public FileInfo findFileByName(String filesavename) {
		PreparedStatement ps = null;
		ResultSet rs = null;
		Connection connection = db.getConnection();
		FileInfo fileInfo = null;
		String sql = "select * from file where filesavename=?";
		try {
			ps = connection.prepareStatement(sql);
			ps.setString(1, filesavename);
			rs = ps.executeQuery();
			if (rs.next()) {
				fileInfo = new FileInfo();
				fileInfo.setFileId(rs.getString("fileid"));
				fileInfo.setFileInfo(formatString(rs.getString("fileinfo"), 15));
				fileInfo.setFileIp(rs.getString("fileip"));
				fileInfo.setFileName(rs.getString("filename"));
				fileInfo.setFileSavename(rs.getString("filesavename"));
				fileInfo.setFileSize((rs.getString("filesize")));
				fileInfo.setFileTag(rs.getString("filetag"));
				fileInfo.setFileTimes(Integer.parseInt(rs
						.getString("filetimes")));
				fileInfo.setFileType(rs.getString("filetype"));
				fileInfo.setFileUptime(rs.getString("fileuptime"));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				ps.close();
				connection.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return fileInfo;
	}

	public FileInfo findFileById(String fileid) {
		PreparedStatement ps = null;
		ResultSet rs = null;
		Connection connection = db.getConnection();
		FileInfo fileInfo = null;
		String sql = "select * from file where fileid=?";
		try {
			ps = connection.prepareStatement(sql);
			ps.setString(1, fileid);
			rs = ps.executeQuery();
			if (rs.next()) {
				fileInfo = new FileInfo();
				fileInfo.setFileId(rs.getString("fileid"));
				fileInfo.setFileInfo(formatString(rs.getString("fileinfo"), 15));
				fileInfo.setFileIp(rs.getString("fileip"));
				fileInfo.setFileName(rs.getString("filename"));
				fileInfo.setFileSavename(rs.getString("filesavename"));
				fileInfo.setFileSize((rs.getString("filesize")));
				fileInfo.setFileTag(rs.getString("filetag"));
				fileInfo.setFileTimes(Integer.parseInt(rs
						.getString("filetimes")));
				fileInfo.setFileType(rs.getString("filetype"));
				fileInfo.setFileUptime(rs.getString("fileuptime"));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				ps.close();
				connection.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return fileInfo;
	}

	public boolean deleteFile(String fileid) {
		boolean flag = false;
		PreparedStatement ps = null;
		Connection connection = db.getConnection();
		String sql = "delete from file where fileid=?";
		try {
			ps = connection.prepareStatement(sql);
			ps.setString(1, fileid);
			int i = ps.executeUpdate();
			if (i == 1)
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				ps.close();
				connection.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return flag;
	}

	public void addTimes(Long times, String fileid) {
		PreparedStatement ps = null;
		Connection connection = db.getConnection();
		String sql = "update file set filetimes=? where fileid=?";
		try {
			ps = connection.prepareStatement(sql);
			ps.setString(1, String.valueOf(times + 1));
			ps.setString(2, fileid);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				ps.close();
				connection.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	public String formatString(String str, int len) {
		str = (str == null || str.trim().equals("")) ? "" : str;
		int forEach = str.length() / len;
		int yushu = str.length() % len;
		StringBuffer buffer = new StringBuffer();
		int i = 0;
		if (yushu != 0) {
			for (; i < forEach; i++) {
				buffer.append(str.substring(i * len, (i + 1) * len)).append(
						"<br/>");
			}
			buffer.append(str.substring(i * len));
		} else {
			for (; i < forEach; i++) {
				if (i < forEach - 1) {
					buffer.append(str.substring(i * len, (i + 1) * len))
							.append("<br/>");
				} else {
					buffer.append(str.substring(i * len)).append("<br/>");
				}
			}
		}
		return buffer.toString();
	}

	public static String formatFileSize(Double size) {
		String result = "";
		int flag = (int) (size / 1024);
		int remain = (int) (size % 1024);
		if (flag < 1)
			result = new java.text.DecimalFormat("#.00").format(size) + " KB";
		else if (flag == 1)
			result = "1 M";
		else {
			if (remain == 0)
				result = flag + " M";
			else
				result = new java.text.DecimalFormat("#.00")
						.format(size / 1024) + " M";

		}
		return result;
	}
}
