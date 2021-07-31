package kr.co.jh.vo;

public class QnAVO {

	private int q_no; //글번호
	private String q_title;
	private String q_writer;
	private String q_regdate;
	private int q_viewCnt;
	private String q_content;
	
	public QnAVO() {
		super();
	}

	public QnAVO(int q_no, String q_title, String q_writer, String q_regdate, int q_viewCnt, String q_content) {
		super();
		this.q_no = q_no;
		this.q_title = q_title;
		this.q_writer = q_writer;
		this.q_regdate = q_regdate;
		this.q_viewCnt = q_viewCnt;
		this.q_content = q_content;
	}

	public int getQ_no() {
		return q_no;
	}

	public void setQ_no(int q_no) {
		this.q_no = q_no;
	}

	public String getQ_title() {
		return q_title;
	}

	public void setQ_title(String q_title) {
		this.q_title = q_title;
	}

	public String getQ_writer() {
		return q_writer;
	}

	public void setQ_writer(String q_writer) {
		this.q_writer = q_writer;
	}

	public String getQ_regdate() {
		return q_regdate;
	}

	public void setQ_regdate(String q_regdate) {
		this.q_regdate = q_regdate;
	}

	public int getQ_viewCnt() {
		return q_viewCnt;
	}

	public void setQ_viewCnt(int q_viewCnt) {
		this.q_viewCnt = q_viewCnt;
	}

	public String getQ_content() {
		return q_content;
	}

	public void setQ_content(String q_content) {
		this.q_content = q_content;
	}

	@Override
	public String toString() {
		return "QnAVO [q_no=" + q_no + ", q_title=" + q_title + ", q_writer=" + q_writer + ", q_regdate=" + q_regdate
				+ ", q_viewCnt=" + q_viewCnt + ", q_content=" + q_content + "]";
	}
	
	
	
	
	
}