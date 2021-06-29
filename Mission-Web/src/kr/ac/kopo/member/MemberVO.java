package kr.ac.kopo.member;

public class MemberVO {

	
		private String id;
		private String password;
		private String name;
		private String email;
		private String phone;
		private String post;
		private String addr1;
		private String addr2;
		private String type;
		private String regDate;
	

		


		public MemberVO() {
			super();
		}

		
		
		public String getId() {
			return id;
		}



		public void setId(String id) {
			this.id = id;
		}



		public String getPassword() {
			return password;
		}

		public void setPassword(String password) {
			this.password = password;
		}

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public String getEmail() {
			return email;
		}


		public void setEmail(String email) {
			this.email = email;
		}


		public String getPhone() {
			return phone;
		}


		public void setPhone(String phone) {
			this.phone = phone;
		}


		public String getPost() {
			return post;
		}


		public void setPost(String post) {
			this.post = post;
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

		public String getType() {
			return type;
		}


		public void setType(String type) {
			this.type = type;
		}


		public String getRegDate() {
			return regDate;
		}


		public void setRegDate(String regDate) {
			this.regDate = regDate;
		}

		@Override
		public String toString() {
			return "MemberVO [id=" + id + ", password=" + password + ", name=" + name + ", email=" + email + ", phone="
					+ phone + ", post=" + post + ", addr1=" + addr1 + ", addr2=" + addr2 + ", type=" + type
					+ ", regDate=" + regDate + "]";
		}


		
}
