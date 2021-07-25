package kr.co.jh.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import kr.co.jh.vo.MemberVO;
import kr.co.jh.util.ConnectionFactory;

public class MemberDAO {
	
	public int joinnew (MemberVO member) {
		
		int result = -1;
		StringBuilder sql = new StringBuilder();
		//insert into user_info(user_id, user_pw, user_name, user_res_no, user_cid,user_phone,user_email,addr1,addr2,addr3,post)
        //values('angki95','amymeme!','한주희','9503282000000',trim(to_char(to_number(9503282000000),'xxxxxxxxxxxx')),'01029950328','angki_95@naver.com','경기도 고양시 일산동구','애니골길','000동000호',?);
		sql.append("insert into user_info ");
		sql.append("(user_id, user_pw, user_name, user_res_no, user_cid, user_phone,user_email,addr1,addr2,addr3,post) ");
		sql.append("values(?,?,?,?,trim(to_char(to_number(?),'xxxxxxxxxxxx')),?,?,?,?,?,?)");
		
		try(
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		){

			int loc = 1;
			pstmt.setString(loc++, member.getUser_id());
			pstmt.setString(loc++, member.getUser_pw());
			pstmt.setString(loc++, member.getUser_name() );
			pstmt.setString(loc++, member.getUser_res_no());
			pstmt.setString(loc++, member.getUser_res_no());
			pstmt.setString(loc++, member.getUser_phone());
			pstmt.setString(loc++, member.getUser_email());
			pstmt.setString(loc++, member.getAddr1());
			pstmt.setString(loc++, member.getAddr2());
			pstmt.setString(loc++, member.getAddr3());
			pstmt.setString(loc++, member.getPost());
			
			
			result = pstmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
}
