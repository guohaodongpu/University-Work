package bean;

public class FileInfo implements java.io.Serializable {

	// Fields

	private String fileId;
	private String fileSavename;
	private String fileName;
	private String fileType;
	private String  fileSize;
	private String fileInfo;
	private String fileUptime;
	private String fileIp;
    private long  fileTimes;
    private String   fileTag;
	

	/** default constructor */
	public FileInfo() {
	}

	/** minimal constructor */
	public FileInfo(String fileId) {
		this.fileId = fileId;
	}

	/** full constructor */
	public FileInfo(String fileId, String fileSavename,
			String fileName, String fileType, String  fileSize,
			String fileInfo, String fileUptime, String fileIp,long fileTimes,String fileTag) {
		this.fileId = fileId;
		this.fileSavename = fileSavename;
		this.fileName = fileName;
		this.fileType = fileType;
		this.fileSize = fileSize;
		this.fileInfo = fileInfo;
		this.fileUptime = fileUptime;
		this.fileIp = fileIp;
		this.fileTimes=fileTimes;
		this.fileTag=fileTag;
	}

	// Property accessors

	public String getFileId() {
		return this.fileId;
	}

	public void setFileId(String fileId) {
		this.fileId = fileId;
	}

	public String getFileSavename() {
		return this.fileSavename;
	}

	public void setFileSavename(String fileSavename) {
		this.fileSavename = fileSavename;
	}

	public String getFileName() {
		return this.fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFileType() {
		return this.fileType;
	}

	public void setFileType(String fileType) {
		this.fileType = fileType;
	}

	public String  getFileSize() {
		return this.fileSize;
	}

	public void setFileSize(String  fileSize) {
		this.fileSize = fileSize;
	}

	public String getFileInfo() {
		return this.fileInfo;
	}

	public void setFileInfo(String fileInfo) {
		this.fileInfo = fileInfo;
	}

	public String getFileUptime() {
		return this.fileUptime;
	}

	public void setFileUptime(String fileUptime) {
		this.fileUptime = fileUptime;
	}

	public String getFileIp() {
		return this.fileIp;
	}

	public void setFileIp(String fileIp) {
		this.fileIp = fileIp;
	}

	public void setFileTimes(long fileTimes) {
		this.fileTimes = fileTimes;
	}

	public long getFileTimes() {
		return fileTimes;
	}

	public void setFileTag(String fileTag) {
		this.fileTag = fileTag;
	}

	public String getFileTag() {
		return fileTag;
	}

}
