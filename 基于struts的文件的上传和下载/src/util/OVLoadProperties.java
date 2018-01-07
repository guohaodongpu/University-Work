package util;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

//单例模式实现读取xxx.properties文件的内容
public class OVLoadProperties {
	// 声明一个自己的实例
	private static OVLoadProperties instance = new OVLoadProperties();
	final static String fileName = "/upload.properties";
	// 返回该实例
	public static synchronized OVLoadProperties getInstance() {
		return instance;
	}

	// 获取key所对应的值
	public String getProperties(String key) {
		Properties p = new Properties();
		InputStream is = null;
		try {
			//xxx.properties文件放在src目录的下边
			is = OVLoadProperties.class.getResourceAsStream(fileName);
			if (is == null)
				is = new FileInputStream(fileName);
			p.load(is);
		} catch (Exception e) {
			System.out.println("加载文件出错啦!" + e.getMessage());
		} finally {
			if (is != null) {
				try {
					is.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					System.out.println(e.getMessage());
				}
			}
		}
		return p.getProperty(key);
	}
}