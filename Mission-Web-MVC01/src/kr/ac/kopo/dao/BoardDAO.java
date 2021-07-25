package kr.ac.kopo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.ac.kopo.util.ConnectionFactory;

public class BoardDAO {
	//전체게시글 가져오기
	/**
	    * 게시물 전체조회
	    * @return
	    * @throws SQLException
	    */
	   public List<BoardVO> selectAll() throws SQLException {
	      
	      List<BoardVO> list = new ArrayList<>();
	      StringBuilder sql = new StringBuilder();
	      sql.append("select no, title, writer, content, to_char(reg_date,'YYYY-MM-DD') as reg_date ");
	      sql.append(" from t_board ");
	      sql.append(" order by no desc ");
	      
	      try(
	            Connection conn = new ConnectionFactory().getConnection();
	            PreparedStatement pstmt = conn.prepareStatement(sql.toString());
	      ){
	         ResultSet rs = pstmt.executeQuery();
	         while(rs.next()) {
	            BoardVO board = new BoardVO();
	            
	            int no = rs.getInt("no");
	            String title = rs.getNString("title");
	            String writer = rs.getNString("writer");
	            String content = rs.getString("content");
	            String regDate = rs.getString("reg_date");
	            
	            board.setNo(no);
	            board.setTitle(title);
	            board.setWriter(writer);
	            board.setContent(content);
	            board.setRegDate(regDate);
	            
	            list.add(board);
	            
	         }
	      }catch (Exception e) {
	         e.printStackTrace();
	      }
	      return list;
	   }
		public BoardVO selectByNo(int boardNo) {

			StringBuilder sql = new StringBuilder();
			sql.append("select no, title, writer, content, view_cnt ");
			sql.append("   , to_char(reg_date, 'yyyy-mm-dd')as reg_date ");
			sql.append("  from t_board ");
			sql.append(" where no =?  ");
			
			BoardVO board1 = null;
			try (Connection conn = new ConnectionFactory().getConnection();
					PreparedStatement pstmt = conn.prepareStatement(sql.toString());

			) {

				pstmt.setInt(1, boardNo);

				ResultSet rs = pstmt.executeQuery();

				rs.next();  //if(rs.next()){ board.setNo  .. 이런식도 가능.
				int no = rs.getInt("no");
				String title = rs.getString("title");
				String writer = rs.getString("writer");
				String content = rs.getString("content");
				int viewCnt = rs.getInt("view_cnt");
				String regDate = rs.getString("reg_date");

				board1 = new BoardVO(no, title, writer, content, viewCnt, regDate);

			} catch (

			Exception e) {
				e.printStackTrace();
			}
			return board1;

		}
}
