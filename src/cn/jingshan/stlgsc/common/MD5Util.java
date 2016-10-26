/**
 * @file MD5Util.java
 * @author yuanjingshan
 * @date 2015-02-27
 */
package cn.jingshan.stlgsc.common;
import java.security.MessageDigest;

/**
 * @class MD5Util
 * @description md5操作类
 */
public class MD5Util {

	public MD5Util() {
		
	}

	/*** 
     * 描述：MD5加码 生成32位md5码 
     */  
    public static String string2MD5(String inStr){  
        MessageDigest md5 = null;  
        try{  
            md5 = MessageDigest.getInstance("MD5");  
        }catch (Exception e){  
        	e.printStackTrace();
        }    
        byte[] md5Bytes = md5.digest(inStr.getBytes());  
        StringBuffer hexValue = new StringBuffer();  
        for (int i = 0; i < md5Bytes.length; i++){  
            int val = ((int) md5Bytes[i]) & 0xff;  
            if (val < 16)  
                hexValue.append("0");  
            hexValue.append(Integer.toHexString(val));  
        }  
        return hexValue.toString();  
    }  
  
    /** 
     * 描述：加密解密算法 执行一次加密，两次解密 
     */   
    public static String convertMD5(String inStr){  
        char[] a = inStr.toCharArray();  
        for (int i = 0; i < a.length; i++){  
            a[i] = (char) (a[i] ^ 't');  
        }  
        return new String(a);  
    }  
}
