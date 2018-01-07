package action;

import java.io.File;
import java.util.Date;
import java.util.UUID;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import util.FileSize;
import util.OVLoadProperties;
import util.PageListData;
import util.StringHandler;
import bean.FileInfo;

import com.opensymphony.xwork2.ActionSupport;

import dao.FileDAO;

public class UploadAction extends ActionSupport
{
	private File[] upload;// 实际上传文件
	private String[] uploadContentType; // 文件的内容类型
	private String[] uploadFileName; // 上传文件名
    private FileDAO dao=new FileDAO();
    protected PageListData pageListData;//分页组件
    protected int currentPage=1;//当前页
	protected int pageSize=2;//每页显示的数目
	public String upload() throws Exception
	{
		try
		{
			String targetDirectory = ServletActionContext.getServletContext()
					.getRealPath("/"+ OVLoadProperties.getInstance().getProperties("uploadFilePath").trim());// 获得路径
			for (int i = 0; i < upload.length; i++)
			{
				String fileName = uploadFileName[i];// 上传的文件名
				String type = uploadContentType[i];// 文件类型
				String saveName = UUID.randomUUID().toString()+ getExt(fileName);// 保存的文件名称，使用UUID+后缀进行保存

				File target = new File(targetDirectory, saveName);
				FileUtils.copyFile(upload[i], target);// 上传至服务器的目录，一般都这样操作,// 在把路径写入数据库即可
                FileInfo file = new FileInfo();// 创建文件
                file.setFileIp(ServletActionContext.getRequest().getRemoteAddr());
                file.setFileName(fileName);
                file.setFileSize(FileSize.FormetFileSize(FileSize.getFileSizes(target)));
                file.setFileSavename(saveName);
                file.setFileType(type);
                file.setFileTimes(0);
				file.setFileUptime(StringHandler.timeTostr(new Date()));
				dao.saveFile(file);//将文件信息保存到数据库中
			}
		} catch (Exception e)
		{
			e.printStackTrace();
			addActionError(e.getMessage());

			return INPUT;
		}

		return SUCCESS;

	}
	//查询文件列表
	public String query() throws Exception{
		pageListData = dao.queryFile(currentPage, pageSize);
		return "query";
	}
	//删除文件
	public String delete() throws Exception{
		String fileId=ServletActionContext.getRequest().getParameter("fileId");
		FileInfo file=dao.findFileById(fileId);
		java.io.File f = new java.io.File(ServletActionContext.getServletContext()
				.getRealPath("/"+ OVLoadProperties.getInstance().getProperties("uploadFilePath").trim())+"/"+file.getFileSavename());
		if(!dao.deleteFile(fileId)){
		   System.out.println("删除数据库中的数据出错!");
		}
		if(!f.delete()) System.out.println("删除磁盘文件出错啦!");
		return "success";
	}
	public File[] getUpload()
	{
		return upload;
	}

	public void setUpload(File[] upload)
	{
		this.upload = upload;
	}

	public PageListData getPageListData() {
		return pageListData;
	}
	public void setPageListData(PageListData pageListData) {
		this.pageListData = pageListData;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public String[] getUploadContentType()
	{
		return uploadContentType;
	}

	public void setUploadContentType(String[] uploadContentType)
	{
		this.uploadContentType = uploadContentType;
	}

	public String[] getUploadFileName()
	{
		return uploadFileName;
	}

	public void setUploadFileName(String[] uploadFileName)
	{
		this.uploadFileName = uploadFileName;
	}

	public static String getExt(String fileName)
	{
		return fileName.substring(fileName.lastIndexOf("."));
	}

}
