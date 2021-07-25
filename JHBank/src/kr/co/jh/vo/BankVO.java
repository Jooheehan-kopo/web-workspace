package kr.co.jh.vo;

public class BankVO {
	
	private String acc_no;
	private String acc_pw;
	private String acc_name;
	private String acc_date;
	private String bank_code;
	private String bank_name;
	private String user_id;
	private String acc_money;
	
	
	public BankVO() {
		
	}
	


	public BankVO(String user_id) {
		super();
		this.user_id = user_id;
	}


	
	
	public BankVO(String acc_no, String acc_pw, String acc_name, String acc_date, String bank_code, String bank_name,
			String user_id,String acc_money) {
		super();
		this.acc_no = acc_no;
		this.acc_pw = acc_pw;
		this.acc_name = acc_name;
		this.acc_date = acc_date;
		this.bank_code = bank_code;
		this.bank_name = bank_name;
		this.user_id = user_id;
		this.acc_money=acc_money;
	}
	
	


	public BankVO(String acc_no, String acc_name, String acc_date, String bank_name,String acc_money) {
		super();
		this.acc_no = acc_no;
		this.acc_name = acc_name;
		this.acc_date = acc_date;
		this.bank_name = bank_name;
		this.acc_money=acc_money;

	}


	public String getAcc_no() {
		return acc_no;
	}


	public void setAcc_no(String acc_no) {
		this.acc_no = acc_no;
	}


	public String getAcc_pw() {
		return acc_pw;
	}


	public void setAcc_pw(String acc_pw) {
		this.acc_pw = acc_pw;
	}


	public String getAcc_name() {
		return acc_name;
	}


	public void setAcc_name(String acc_name) {
		this.acc_name = acc_name;
	}


	public String getAcc_date() {
		return acc_date;
	}


	public void setAcc_date(String acc_date) {
		this.acc_date = acc_date;
	}


	public String getBank_code() {
		return bank_code;
	}


	public void setBank_code(String bank_code) {
		this.bank_code = bank_code;
	}


	public String getBank_name() {
		return bank_name;
	}


	public void setBank_name(String bank_name) {
		this.bank_name = bank_name;
	}


	public String getUser_id() {
		return user_id;
	}


	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	
	

	public String getAcc_money() {
		return acc_money;
	}



	public void setAcc_money(String acc_money) {
		this.acc_money = acc_money;
	}



	@Override
	public String toString() {
		return "BankVO [acc_no=" + acc_no + ", acc_pw=" + acc_pw + ", acc_name=" + acc_name + ", acc_date=" + acc_date
				+ ", bank_code=" + bank_code + ", bank_name=" + bank_name + ", user_id=" + user_id + ", acc_money="
				+ acc_money + "]";
	}



	
	
	
	
	
	
	
}
