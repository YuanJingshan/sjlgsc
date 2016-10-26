package cn.jingshan.stlgsc.common;

import java.util.UUID;

/**
 * <p>ClassName: IDGenerate</p>
 * <p>Description: ID生成</p>
 * <p>Company: www.shuiguoyizhan.com</p>
 * @author  yjs
 * @date    2016-4-17
 * @vession 1.0.0
 */
public class IDGenerate {
	/**
	 * <p>MethodName: generateManagerID</p>
	 * <p>Description: 管理员ID生成</p>
	 * <p>Company: www.shuiguoyizhan.com</p>
	 * <p>Parameter: </P>
	 * <p>Return Type: String</P>
	 * @author  yjs
	 * @date    2016-4-17
	 * @vession 1.0.0
	 */
	public static String generateManagerID() {
		return "M-" + generateShortUuid();
	}
	
	/**
	 * <p>MethodName: generateUserID</p>
	 * <p>Description: 用户ID生成</p>
	 * <p>Company: www.shuiguoyizhan.com</p>
	 * <p>Parameter: </P>
	 * <p>Return Type: String</P>
	 * @author  yjs
	 * @date    2016-4-17
	 * @vession 1.0.0
	 */
	public static String generateUserID() {
		return "U-" + generateShortUuid();
	}
	
	public static String generateFruitsID() {
		return "F-" + generateShortUuid();
	}
	
	// 所有字母
	public static String[] chars = new String[] { "a", "b", "c", "d", "e", "f",  
        "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s",  
        "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5",  
        "6", "7", "8", "9", "A", "B", "C", "D", "E", "F", "G", "H", "I",  
        "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V",  
        "W", "X", "Y", "Z" };  

	/**
	 * <p>MethodName: generateShortUuid</p>
	 * <p>Description: 8位UUID的变换</p>
	 * <p>Company: www.shuiguoyizhan.com</p>
	 * <p>Parameter: </P>
	 * <p>Return Type: String</P>
	 * @author  yjs
	 * @date    2016-4-17
	 * @vession 1.0.0
	 */
	public static String generateShortUuid() {  
		StringBuffer shortBuffer = new StringBuffer();  
		String uuid = UUID.randomUUID().toString().replace("-", "");  
		for (int i = 0; i < 8; i++) {  
		    String str = uuid.substring(i * 4, i * 4 + 4);  
		    int x = Integer.parseInt(str, 16);  
		    shortBuffer.append(chars[x % 0x3E]);  
		}  
		return shortBuffer.toString();  
	} 
	
	/**
	 * Description: 生成36位的uuid
	 * @param
	 * @return: String
	 */
	public static String generateUUID() {
		return UUID.randomUUID().toString();
	}
}
