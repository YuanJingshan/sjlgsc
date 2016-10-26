package cn.jingshan.stlgsc.common.page;

/**
 * <p>ClassName: PageParameter</p>
 * <p>Description: 页面参数</p>
 * <p>Company: www.shuiguoyizhan.com</p>
 * @author  yjs
 * @date    2016-4-17
 * @vession 1.0.0
 */
public class PageParameter {
	//页码
	private int page;
	//每页显示数
	private int length;
	//开始
	private int start;

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getLength() {
		return length;
	}

	public void setLength(int length) {
		this.length = length;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	@Override
	public String toString() {
		return "PageParameter [page=" + page + ", length=" + length
				+ ", start=" + start + "]";
	}

}
