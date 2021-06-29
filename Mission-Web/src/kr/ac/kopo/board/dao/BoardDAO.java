package kr.ac.kopo.board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.ac.kopo.board.vo.BoardVO;
import kr.ac.kopo.util.ConnectionFactory;

public class BoardDAO {

	public void insert(BoardVO board) {

		StringBuilder sql = new StringBuilder();
		sql.append("insert into t_board(no, title, writer, content) ");
		sql.append(" values(seq_t_board_no.nextval,?,?,?) ");

		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {

			pstmt.setString(1, board.getTitle());
			pstmt.setString(2, board.getWriter());
			pstmt.setString(3, board.getContent());

			pstmt.getUpdateCount();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public List<BoardVO> selectAll() {

		List<BoardVO> list = new ArrayList<>();

		StringBuilder sql = new StringBuilder();
		sql.append("select no,title, writer, to_char(reg_date, 'yyyy-mm-dd')as reg_date");
		sql.append("  from t_board ");
		sql.append("order by no desc");

		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {

			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				int no = rs.getInt("no");
				String title = rs.getString("title");
				String writer = rs.getString("writer");
				String regDate = rs.getString("reg_date");

				BoardVO board = new BoardVO();
				board.setNo(no);
				board.setTitle(title);
				board.setWriter(writer);
				board.setRegDate(regDate);

				list.add(board);
			}

		} catch (Exception e) {
			e.printStackTrace();

		}
		return list;
	}

	public BoardVO detail(int boardNo) {

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

			rs.next();
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
	
	
	public void update(BoardVO board) {
		StringBuilder sql = new StringBuilder();
		sql.append("update t_board  ");
		sql.append("set title = ? , content= ? , reg_date=sysdate  "); 
		sql.append("  where no = ?  ");	
		
		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {

			pstmt.setString(1, board.getTitle());
			pstmt.setString(2, board.getContent());
			pstmt.setInt(3, board.getNo());

			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	

}
