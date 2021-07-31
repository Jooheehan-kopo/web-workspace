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
		
		List<QnAVO> list= new ArrayList<>();
		StringBuilder sql = new StringBuilder();
		sql.append("  SELECT Q_NO,USER_ID, Q_TITLE, Q_CONTENT, TO_CHAR(Q_DATE,'YYYY/MM/DD') AS Q_DATE,  ");		
		sql.append("  Q_VIEWCNT, COMMENT_NO   FROM QNA  ");
		
		try( Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
				) {
			
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next()) {
				int q_no = rs.getInt("q_no");
				String user_id = rs.getString("user_id");
				String q_title = rs.getString("q_title");
				String q_date = rs.getString("q_date");
				int q_viewcnt = rs.getInt("q_viewcnt");
				int comment_cnt = rs.getInt("comment_cnt");
				
				QnAVO qna = new QnAVO();
				qna.setQ_no(q_no);
				qna.setQ_title(q_title);
				qna.setUser_id(user_id);
				qna.setCommnet_cnt(comment_cnt);
				qna.setQ_date(q_date);
				qna.setQ_viewCnt(q_viewcnt);
				
				list.add(qna);
				
			}
			
		}catch(Exception e){
			e.printStackTrace();
			
		}
		return list;
		
	}
}
