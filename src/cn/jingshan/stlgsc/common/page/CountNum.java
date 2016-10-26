package cn.jingshan.stlgsc.common.page;

/**
 * <p>ClassName: CountNum</p>
 * <p>Description: 总数</p>
 * <p>Company: www.shuiguoyizhan.com</p>
 * @author  yjs
 * @date    2016-4-17
 * @vession 1.0.0
 */
public class CountNum {
	//总数
	private int total;
	
	public CountNum() {
		this.total = 0;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	@Override
	public String toString() {
		return "CountNum [total=" + total + "]";
	}
	
}
