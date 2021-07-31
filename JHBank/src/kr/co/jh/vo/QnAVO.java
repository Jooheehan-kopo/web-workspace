package kr.co.jh.vo;

public class QnAVO {

	private int q_no; //글번호
	private String q_title;
	private String user_id;
	private String q_date;
	private int q_viewCnt;
	private String q_content;
	private int commnet_cnt;
	
	private String q_writer;
	
	public QnAVO() {
		super();
	}


	public QnAVO(int q_no, String q_title, String user_id, String q_writer, String q_date, int q_viewCnt,
			String q_content, int commnet_cnt) {
		super();
		this.q_no = q_no;
		this.q_title = q_title;
		this.user_id = user_id;
		this.q_writer = q_writer;
		this.q_date = q_date;
		this.q_viewCnt = q_viewCnt;
		this.q_content = q_content;
		this.commnet_cnt = commnet_cnt;
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


	public String getUser_id() {
		return user_id;
	}


	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}


	public String getQ_writer() {
		return q_writer;
	}


	public void setQ_writer(String q_writer) {
		this.q_writer = q_writer;
	}


	public String getQ_date() {
		return q_date;
	}


	public void setQ_date(String q_date) {
		this.q_date = q_date;
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


	public int getCommnet_cnt() {
		return commnet_cnt;
	}


	public void setCommnet_cnt(int commnet_cnt) {
		this.commnet_cnt = commnet_cnt;
	}


	@Override
	public String toString() {
		return "QnAVO [q_no=" + q_no + ", q_title=" + q_title + ", user_id=" + user_id + ", q_writer=" + q_writer
				+ ", q_date=" + q_date + ", q_viewCnt=" + q_viewCnt + ", q_content=" + q_content + ", commnet_cnt="
				+ commnet_cnt + "]";
	}
	
	
	
}