package kr.co.jh.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import kr.co.jh.util.ConnectionFactory;
import kr.co.jh.vo.MemberVO;



public class LoginDAO {

	/**
	 * 사용자가 입력한 ID, PASSWORD로 로그인 여부 판단
	 * @return 해당 LoginVO 
	 * @param loginVO  로그인시 입력한 id, password를 포함
	 */
	public MemberVO login(MemberVO memberVO) {
		
		MemberVO userVO = null;
		
		/*
		 * StringBuilder는 AutoCloseable을 상속받지 않기 때문에 
		 * try with resource문에 작성할 수 없기 때문에 try~catch문 위에 작성하고 있는 것이다.
		 */
		StringBuilder sql = new StringBuilder();
		sql.append("select user_id, user_name ,user_cid "); // password는 사용할 일이 없기 때문에 받아오지 않는다.
		sql.append(" from user_info ");
		sql.append(" where user_id = ? and user_pw = ? ");
		
		try(
				Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		){
			pstmt.setString(1, memberVO.getUser_id());
			pstmt.setString(2, memberVO.getUser_pw());
		
			
			ResultSet rs = pstmt.executeQuery();
			
			//로그인에 성공했다면
			if(rs.next()) { 
				userVO = new MemberVO();
				userVO.setUser_id(rs.getString("user_id"));
				userVO.setUser_name(rs.getString("user_name"));
				userVO.setUser_cid(rs.getString("user_cid"));
			}
			// 로그인 실패했다면, userVO = null
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return userVO;
	}
}












