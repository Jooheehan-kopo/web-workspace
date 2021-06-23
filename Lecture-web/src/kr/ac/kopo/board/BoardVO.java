package kr.ac.kopo.board;

public class BoardVO {
	/*
	 * 자바빈즈 클래스 조건 5가지
	 * 1. package 포함
	 * 2. 클래스의 접근제한자 public
	 * 3. 맴버젼수 접근제한자 private
	 * 4. getter/setter
	 * 5. defalut생성자 선언
	 * */

	   private int no;
	   private String title;
	   private String writer;
	   private String regDate;
	   
	   public BoardVO() {
	   }
	   public int getNo() {
	      return no;
	   }
	   public void setNo(int no) {
	      this.no = no;
	   }
	   public String getTitle() {
	      return title;
	   }
	   public void setTitle(String title) {
	      this.title = title;
	   }
	   public String getWriter() {
	      return writer;
	   }
	   public void setWriter(String writer) {
	      this.writer = writer;
	   }
	   public String getRegDate() {
	      return regDate;
	   }
	   public void setRegDate(String regDate) {
	      this.regDate = regDate;
	   }
	   
		
}
