package kr.ac.kopo.login.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import kr.ac.kopo.util.ConnectionFactory;

public class LoginDAO {
	
	//로그인을 했을때  로그인관련 정보가 보이게 하려고, 이걸 리턴하고 싶음. 세션에 몇개만 필요할것.
	//회원정보를 가지고 있기위해 맴버vo가 필요함. --> membervo로 만들어야함.
	
	/**
	 * 사용자가 입력한 id, password로 로그인 여부 판단
	 * @return 해당 LoginVO
	 * @param loginVO 로그인시 입력한 아이디, 비번 포함.
	 */
	
	/*
	 * public LoginVo login(String id, String password) {
	 * 
	 * }
	 */
	public LoginVO login(LoginVO loginVO) {
		
		//6 로그인 실패하면 널의 값을 가짐.
		LoginVO userVO = null; 
		
		//1 쿼리를 만드는 스크링뷸더는 오터 상속받지 않아서 위에서 만들어줘야함.
		StringBuilder sql = new StringBuilder();
		sql.append("select id, name, type ");
		sql.append("  from members  ");
		sql.append("  where id= ? and password= ?  ");
		
		try(
				//2 auto closeable..
				 Connection conn = new ConnectionFactory().getConnection();  //객체만들면 자동으로 클로즈
				//3 쿼리를 pstmt  로 넣어줘
				 PreparedStatement pstmt = conn.prepareStatement(sql.toString());
				
				){
			pstmt.setString(1, loginVO.getId());
			pstmt.setString(2, loginVO.getPassword());
			
			//4 쿼리 실행
			 ResultSet rs = pstmt.executeQuery();
			 
			 // 5 0아니면 1개 임. 확인.
			 if(rs.next()) {
				 //7
				 userVO= new LoginVO();
				 
				 //8 rs가 알고 있는 값에서 가져옴.
				 userVO.setId(rs.getString("id"));
				 userVO.setName(rs.getString("name"));
				 userVO.setType(rs.getString("type"));
			 }
			 
		}catch(Exception e) {
			e.printStackTrace();
		}
		//7.
		return userVO;
		
		//1.7버전의 try catch문...
	}
}
