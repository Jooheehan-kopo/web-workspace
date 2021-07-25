package kr.co.jh.vo;

public class MemberVO {
	private String user_id;
	private String user_pw;
	private String user_name;
	private String user_res_no;
	private String user_cid;
	private String user_phone;
	private String user_email;
	private String addr1;
	private String addr2;
	private String addr3;
	private String join_date;
	private String type;
	private String post;

	public MemberVO() {
		
	}
	

	public MemberVO(String user_id, String user_pw, String user_name, String type) {
		super();
		this.user_id = user_id;
		this.user_pw = user_pw;
		this.user_name = user_name;
		this.type = type;
		
	}

	

	public MemberVO(String user_id, String user_pw, String user_name, String user_res_no, String user_cid,
			String user_phone, String user_email, String addr1, String addr2, String addr3, String join_date,
			String type,String post) {
		super();
		this.user_id = user_id;
		this.user_pw = user_pw;
		this.user_name = user_name;
		this.user_res_no = user_res_no;
		this.user_cid = user_cid;
		this.user_phone = user_phone;
		this.user_email = user_email;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.addr3 = addr3;
		this.join_date = join_date;
		this.type = type;
		this.post = post;
	}


	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_pw() {
		return user_pw;
	}

	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_res_no() {
		return user_res_no;
	}

	public void setUser_res_no(String user_res_no) {
		this.user_res_no = user_res_no;
	}

	public String getUser_cid() {
		return user_cid;
	}

	public void setUser_cid(String user_cid) {
		this.user_cid = user_cid;
	}

	public String getUser_phone() {
		return user_phone;
	}

	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getAddr2() {
		return addr2;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}

	public String getAddr3() {
		return addr3;
	}

	public void setAddr3(String addr3) {
		this.addr3 = addr3;
	}

	public String getJoin_date() {
		return join_date;
	}

	public void setJoin_date(String join_date) {
		this.join_date = join_date;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	

	public String getPost() {
		return post;
	}


	public void setPost(String post) {
		this.post = post;
	}


	@Override
	public String toString() {
		return "MemberVO [user_id=" + user_id + ", user_pw=" + user_pw + ", user_name=" + user_name + ", user_res_no="
				+ user_res_no + ", user_cid=" + user_cid + ", user_phone=" + user_phone + ", user_email=" + user_email
				+ ", addr1=" + addr1 + ", addr2=" + addr2 + ", addr3=" + addr3 + ", join_date=" + join_date + ", type="
				+ type + ", post=" + post + "]";
	}



	
	
}