package cn.jingshan.stlgsc.log;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * <p>ClassName: Mylog</p>
 * <p>Description: 日志</p>
 * <p>Company: www.shuiguoyizhan.com</p>
 * @author  yjs
 * @date    2016-4-17
 * @vession 1.0.0
 */
public class Mylog {
	
	// 定义实例
	private static Mylog instance = null;
	
	private Mylog() {
	}
	
	public static Mylog getInstance() {
		if (instance == null) {
			instance = new Mylog();
		}
		return instance;
	}
	
	/**
	 * <p>MethodName: fatal</p>
	 * <p>Description: 致命错误</p>
	 * <p>Company: www.shuiguoyizhan.com</p>
	 * <p>Parameter: path, msg</P>
	 * <p>Return Type: void</P>
	 * @author  yjs
	 * @date    2016-4-17
	 * @vession 1.0.0
	 */
	public void fatal(String path, String msg) {
		writeLog(path, "fatal", msg);
	}

	/**
	 * <p>MethodName: error</p>
	 * <p>Description: 错误</p>
	 * <p>Company: www.shuiguoyizhan.com</p>
	 * <p>Parameter: path, msg</P>
	 * <p>Return Type: void</P>
	 * @author  yjs
	 * @date    2016-4-17
	 * @vession 1.0.0
	 */
	public void error(String path, String msg) {
		writeLog(path, "error",msg);
	}
	
	/**
	 * <p>MethodName: warn</p>
	 * <p>Description: 警告</p>
	 * <p>Company: www.shuiguoyizhan.com</p>
	 * <p>Parameter: path, msg</P>
	 * <p>Return Type: void</P>
	 * @author  yjs
	 * @date    2016-4-17
	 * @vession 1.0.0
	 */
	public void warn(String path, String msg) {
		writeLog(path, "warn",msg);
	}
	
	/**
	 * <p>MethodName: info</p>
	 * <p>Description: 信息</p>
	 * <p>Company: www.shuiguoyizhan.com</p>
	 * <p>Parameter: path, msg</P>
	 * <p>Return Type: void</P>
	 * @author  yjs
	 * @date    2016-4-17
	 * @vession 1.0.0
	 */
	public void info(String path, String msg) {
		writeLog(path, "info",msg);
	}
	
	/**
	 * <p>MethodName: debug</p>
	 * <p>Description: 调试</p>
	 * <p>Company: www.shuiguoyizhan.com</p>
	 * <p>Parameter: path, msg</P>
	 * <p>Return Type: void</P>
	 * @author  yjs
	 * @date    2016-4-17
	 * @vession 1.0.0
	 */
	public void debug(String path, String msg) {
		writeLog(path, "debug",msg);
	}
	
	/**
	 * <p>MethodName: writeLog</p>
	 * <p>Description: 写日志文件</p>
	 * <p>Company: www.shuiguoyizhan.com</p>
	 * <p>Parameter: logPath, msg</P>
	 * <p>Return Type: void</P>
	 * @author  yjs
	 * @date    2016-4-17
	 * @vession 1.0.0
	 */
	private void writeLog(String logPath, String type, String msg) {
		if (logPath == null || logPath.equals("")) {
			String os = System.getProperty("os.name");
			logPath = System.getProperty("user.dir"); // 获取项目路径
			if (os.contains("Windows")) {
				logPath = logPath + "\\log\\";
			} else {
				logPath = logPath + "/log/";
			}
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String logFilePath = logPath + "log_" + sdf.format(new Date()) + ".txt"; // 日志文件名
		File path = new File(logPath); // 配置路径
		File logfile = new File(logFilePath);
		
		try {
			if (!path.exists()) { // 路径不存在，创建文件夹
				path.mkdirs();
			}
			if (path.exists()) {
				if (!logfile.exists()) { // 当日日志文件不存在，创建日志文件
					logfile.createNewFile();
				}
				OutputStream out = new FileOutputStream(logfile, true);
				sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				String msgStr = "\r\n" + "Mylog " + type + ": " +  sdf.format(new Date()) + "--" + msg;
				out.write(msgStr.getBytes());
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
}
