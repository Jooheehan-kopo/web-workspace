package kr.co.jh.vo;

public class TransVO {

	private String send_acc_no;  //받는계좌
	private String trans_date;	 //이체일
	private String trans_no;	 //거래번호 ----> 삭제????
	private int trans_money;	 //거래금액
	private int acc_money;		 //계좌잔액
	private String acc_no;		 //내계좌
	private String bank_code;	 //받는이 은행코드
	private String trans_code;	 //거래코드
	private String trans_info;
	
	
	private String t_bank_code;
	
	
	public TransVO() {
		
	}



	public TransVO(String send_acc_no, String trans_date, String trans_no, int trans_money, int acc_money,
			String acc_no, String bank_code, String trans_code,String trans_info, String t_bank_code) {
		super();
		this.send_acc_no = send_acc_no;
		this.trans_date = trans_date;
		this.trans_no = trans_no;
		this.trans_money = trans_money;
		this.acc_money = acc_money;
		this.acc_no = acc_no;
		this.bank_code = bank_code;
		this.trans_code = trans_code;
		this.trans_info = trans_info;
		this.t_bank_code=t_bank_code;
	}



	public String getT_bank_code() {
		return t_bank_code;
	}



	public void setT_bank_code(String t_bank_code) {
		this.t_bank_code = t_bank_code;
	}



	public TransVO( String acc_no,String trans_info,int trans_money, String send_acc_no,  int acc_money, String trans_date) {
		super();
		this.send_acc_no = send_acc_no;
		this.trans_info = trans_info;
		this.trans_money = trans_money;
		this.trans_date = trans_date;
		this.acc_money = acc_money;
		this.acc_no = acc_no;
	}



	public String getSend_acc_no() {
		return send_acc_no;
	}



	public void setSend_acc_no(String send_acc_no) {
		this.send_acc_no = send_acc_no;
	}



	public String getTrans_date() {
		return trans_date;
	}



	public void setTrans_date(String trans_date) {
		this.trans_date = trans_date;
	}



	public String getTrans_no() {
		return trans_no;
	}



	public void setTrans_no(String trans_no) {
		this.trans_no = trans_no;
	}



	public int getTrans_money() {
		return trans_money;
	}



	public void setTrans_money(int trans_money) {
		this.trans_money = trans_money;
	}



	public int getAcc_money() {
		return acc_money;
	}



	public void setAcc_money(int acc_money) {
		this.acc_money = acc_money;
	}



	public String getAcc_no() {
		return acc_no;
	}



	public void setAcc_no(String acc_no) {
		this.acc_no = acc_no;
	}



	public String getBank_code() {
		return bank_code;
	}



	public void setBank_code(String bank_code) {
		this.bank_code = bank_code;
	}



	public String getTrans_code() {
		return trans_code;
	}



	public void setTrans_code(String trans_code) {
		this.trans_code = trans_code;
	}

	

	public String getTrans_info() {
		return trans_info;
	}



	public void setTrans_info(String trans_info) {
		this.trans_info = trans_info;
	}



	@Override
	public String toString() {
		return "TransVO [send_acc_no=" + send_acc_no + ", trans_date=" + trans_date + ", trans_no=" + trans_no
				+ ", trans_money=" + trans_money + ", acc_money=" + acc_money + ", acc_no=" + acc_no + ", bank_code="
				+ bank_code + ", trans_code=" + trans_code + ", trans_info=" + trans_info + ", t_bank_code="
				+ t_bank_code + "]";
	}





	
	
	
	
	
	
	
	
}
