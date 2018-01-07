package action;

import java.io.InputStream;
import java.io.UnsupportedEncodingException;

import bean.FileInfo;

import com.opensymphony.xwork2.ActionSupport;

import dao.FileDAO;

import org.apache.struts2.ServletActionContext;

import util.OVLoadProperties;

public class DownloadAction extends ActionSupport {
	private static final long serialVersionUID = 6329383258366253255L;
	private String fileName;
	private String fileSavename;
    private String fileId; 
    private FileDAO dao=new FileDAO();
	public String execute() throws Exception {
		return SUCCESS;
	}
	/*
	 * @getDownloadFile 此方法对应的是struts.xml文件中的： <param
	 * name="inputName">downloadFile</param> 返回下载文件的流，可以参看struts2的源码
	 */
	public InputStream getDownloadFile() {
		FileInfo file=dao.findFileById(fileId);
		dao.addTimes(file.getFileTimes(),file.getFileId());
		return ServletActionContext.getServletContext().getResourceAsStream(
				"/"
						+ OVLoadProperties.getInstance()
								.getProperties("uploadFilePath").trim() + "/"
						+ fileSavename);
	}

	public String getFileSavename() {
		return fileSavename;
	}

	public void setFileSavename(String fileSavename)
			throws UnsupportedEncodingException {
		fileSavename = new String(fileSavename.getBytes("ISO-8859-1"), "gbk");
		this.fileSavename = fileSavename;
	}

	/*
	 * @getFileName 此方法对应的是struts.xml文件中的： <param
	 * name="contentDisposition">attachment;filename="${fileName}"</param>
	 * 这个属性设置的是下载工具下载文件时显示的文件名， 要想正确的显示中文文件名，我们需要对fileName再次编码
	 * 否则中文名文件将出现乱码，或无法下载的情况
	 */
	public String getFileName() throws UnsupportedEncodingException {

		fileName = new String(fileName.getBytes(), "ISO-8859-1");

		return fileName;
	}

	public void setFileName(String fileName)
			throws UnsupportedEncodingException {
		fileName = new String(fileName.getBytes("ISO-8859-1"), "gbk");
		this.fileName = fileName;
	}
	public void setFileId(String fileId) {
		this.fileId = fileId;
	}
	public String getFileId() {
		return fileId;
	}

}