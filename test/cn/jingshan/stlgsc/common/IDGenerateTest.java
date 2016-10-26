package cn.jingshan.stlgsc.common;

import static org.junit.Assert.*;

import java.util.UUID;

import org.junit.Before;
import org.junit.Test;

/**
 * <p>ClassName: IDGenerateTest</p>
 * <p>Description: </p>
 * <p>Company: www.jingshan.com</p>
 * @author  yjs
 * @date    2016-10-6
 * @vession 1.0.0
 */
public class IDGenerateTest {

	/**
	 * Description:
	 * @param
	 * @return: void
	 */
	@Before
	public void setUp() throws Exception {
	}

	@Test
	public void test() {
		String str = UUID.randomUUID().toString();
		System.out.println(str + "\n length=" + str.length());
	}
	
}
