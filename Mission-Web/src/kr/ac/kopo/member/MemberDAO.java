package kr.ac.kopo.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import kr.ac.kopo.util.ConnectionFactory;

public class MemberDAO {
	 
public MemberVO memInfo(String memId) {
		
		StringBuilder sql = new StringBuilder();
		sql.append(
				" select id , name , password , EMAIL_ID||email_domain , tel1||tel2||tel3 , post , basic_addr , detail_addr , type ");
		sql.append(" , to_char(reg_date, 'yyyy-mm-dd') as reg_date ");
		sql.append(" from members ");
		sql.append(" where id = ? ");
	
		MemberVO member =null;
		try(
				Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
				
				){
			
			pstmt.setString(1, memId);
			
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			
			String id = rs.getString("id");
			String name = rs.getString("name");
			String email = rs.getString("email_id||email_domain");
			String phone = rs.getString("tel1||tel2||tel3");
			String post = rs.getString("post");
			String addr1 = rs.getString("basic_addr");
			String addr2 = rs.getString("detail_addr");
			String type = rs.getString("type");
			String regDate = rs.getString("reg_date");
			
			member = new MemberVO();
			member.setId(id);
			member.setName(name);
			member.setEmail(email);
			member.setPhone(phone);
			member.setPost(post);
			member.setAddr1(addr1);
			member.setAddr2(addr2);
			member.setType(type);
			member.setRegDate(regDate);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return member;
		
	}
}
