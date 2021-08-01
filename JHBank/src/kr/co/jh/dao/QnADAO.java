package kr.co.jh.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.co.jh.util.ConnectionFactory;
import kr.co.jh.vo.QnAVO;

public class QnADAO {
	
	public List<QnAVO> list() {
		
		/**
		 * 전체 글 목록 조회
		 * **/
		List<QnAVO> list= new ArrayList<>();
		StringBuilder sql = new StringBuilder();
		sql.append("  SELECT Q_NO,USER_ID, Q_TITLE, Q_CONTENT, TO_CHAR(Q_DATE,'YYYY/MM/DD') AS Q_DATE,  ");		
		sql.append("  Q_VIEWCNT, COMMENT_NO FROM QNA  ");
		
		try( Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
				) {
			
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next()) {
				int q_no = rs.getInt("q_no");
				String user_id = rs.getString("user_id");
				String q_title = rs.getString("q_title");
				//String q_content = rs.getString("q_content");
				String q_date = rs.getString("q_date");
				int q_viewCnt = rs.getInt("q_viewcnt");
				int comment_no = rs.getInt("comment_no");
				
				System.out.println("q_no:" + q_no);
				
				QnAVO qna = new QnAVO();
				qna.setQ_no(q_no);
				qna.setQ_title(q_title);
				qna.setUser_id(user_id);
				qna.setcomment_no(comment_no);
				qna.setQ_date(q_date);
				qna.setQ_viewCnt(q_viewCnt);
				
				list.add(qna);
				
			}
			
		}catch(Exception e){
			e.printStackTrace();
			
		}
		
		return list;
		
	}
	
	/**게시글 번호 상세게시판
	 * **/
	public QnAVO selectByNo(int q_no) {
	
		StringBuilder sql = new StringBuilder();
		
		
		sql.append("  SELECT Q_NO,USER_ID, Q_TITLE, Q_CONTENT,  ");
		sql.append("  TO_CHAR(Q_DATE,'YYYY/MM/DD') AS Q_DATE, Q_VIEWCNT, COMMENT_NO  ");
		sql.append("    FROM QNA where q_no=?  ");
		
		QnAVO vo =null;
		
		try(
			Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
								
				){
			pstmt.setInt(1, q_no);
			ResultSet rs = pstmt.executeQuery();
			
			rs.next();
			int no = rs.getInt("q_no");
			String user_id = rs.getString("user_id");
			String q_title = rs.getString("q_title");
			String q_content = rs.getString("q_content");
			int q_viewCnt = rs.getInt("q_viewcnt");
			String q_date = rs.getString("q_date");
			int comment_no = rs.getInt("comment_no");
			
			vo = new QnAVO(no,q_title,user_id,q_date,q_viewCnt,q_content, comment_no);
			System.out.println("vo"+vo);
		}catch(Exception e ) {
			e.printStackTrace();
		}
	
		return vo;
	}
	
	public int writeQ(QnAVO vo) {

		int result= -1;
		
		StringBuilder sql = new StringBuilder();
		sql.append("  insert into qna(q_no, q_title, user_id, q_content)  ");
		sql.append(" values(seq_qna.nextval, ?, ? , ? )") ;
		
		try(
				Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
				
				
				){
			
			int loc=1;
			pstmt.setString(loc++, vo.getQ_title());
			pstmt.setString(loc++, vo.getUser_id());
			pstmt.setString(loc++, vo.getQ_content());
			
			result =pstmt.executeUpdate();
			
			
		}catch(Exception e ) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
