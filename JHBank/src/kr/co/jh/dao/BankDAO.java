package kr.co.jh.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.co.jh.util.ConnectionFactory;
import kr.co.jh.util.JDBCClose;
import kr.co.jh.vo.BankVO;
import kr.co.jh.vo.TransVO;

public class BankDAO {
	// 게시글 관리.

	public BankDAO() {

	}

	/**
	 * 전체계좌조회 서비스
	 * 
	 * @author joohee
	 */
	public List<BankVO> searchAll(String user_cid) throws Exception {
		List<BankVO> bank = new ArrayList<BankVO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = new ConnectionFactory().getConnection();
			StringBuilder sql = new StringBuilder();

			/*
			 * select A.acc_no, a.bank_name, b.acc_money, a.acc_date from (select
			 * s.acc_no,s.acc_name, s.acc_date, s.user_id, s.user_cid,bc.bank_name from
			 * (select b.acc_no,b.acc_name, b.acc_date, u.user_id,u.user_cid,b.bank_code
			 * from bank_info b, user_info u where b.user_id=u.user_id and
			 * u.user_cid='8a4a7bf7080') s, bank_code bc where s.bank_code = bc.bank_code)
			 * A,
			 * 
			 * (select s.acc_no,td.acc_money from(select acc_no, max(trans_no) as trans_no
			 * from trans_data group by acc_no) s, trans_data td where
			 * s.trans_no=td.trans_no) B
			 * 
			 * where A.acc_no = B.acc_no ;
			 */
			sql.append(" select A.acc_no, a.bank_name, b.acc_money, a.acc_date, a.acc_name ");
			sql.append("  from (select s.acc_no,s.acc_name, s.acc_date, s.user_id, s.user_cid,bc.bank_name  ");
			sql.append("  from (select b.acc_no,b.acc_name, b.acc_date, u.user_id,u.user_cid,b.bank_code ");
			sql.append("  from bank_info b, user_info u  ");
			sql.append("  where b.user_id=u.user_id ");
			sql.append("  and trim(u.user_cid) = trim(?) ) s, bank_code bc ");
			sql.append("  where s.bank_code = bc.bank_code) A, ");

			sql.append("  (select s.acc_no,td.acc_money  ");
			sql.append("   from(select acc_no,  max(trans_no) as trans_no ");
			sql.append("   from trans_data ");
			sql.append("   group by acc_no) s, trans_data td ");
			sql.append("   where s.trans_no=td.trans_no) B ");
			sql.append("   where A.acc_no = B.acc_no ");


			//하온
			sql.append(" union ");
			sql.append(" select S.ACCOUNT_NO, B.BNAME, S.BALANCE, s.reg_dt ,S.ALIAS from BANKCODE@haon_link B, ");
			sql.append(" (select a.bcode, a.ACCOUNT_NO, a.BALANCE, a.ALIAS, a.reg_dt ");
			sql.append(" from accounts@haon_link a, clients@haon_link c ");
			sql.append(" where a.account_id = c.id and trim(c.CID) = trim(?)) S ");
			sql.append("  WHERE B.CODE = S.bcode  ");
			

			
			//조이
			
			sql.append(" union ");
			sql.append(" select  account_number AS ACCOUNT_NO, '조이' AS BNAME,  account_balance AS BALANCE,  created_at ,account_alias AS ALIAS ");
		    sql.append(" from account@JOY_LINK ");
		    sql.append(" where member_id = (select member_id from member@JOY_LINK where trim(cid) = trim(?)) ");
		


			pstmt = conn.prepareStatement(sql.toString());

			pstmt.setString(1, user_cid);
			pstmt.setString(2, user_cid);
			pstmt.setString(3, user_cid);

		
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {

				String acc_no = rs.getString("acc_no");
				String bank_name = rs.getString("bank_name");
				String acc_money = rs.getString("acc_money");
				String acc_date = rs.getString("acc_date");
				String acc_name = rs.getString("acc_name");

				BankVO search = new BankVO(bank_name, acc_no, acc_name, acc_date, acc_money);
				bank.add(search);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCClose.close(conn, pstmt);
		}

		return bank;
	}

	/** 계좌개설 **/
	public void resisterAcc(BankVO newacc) throws Exception {

		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = new ConnectionFactory().getConnection();
			StringBuilder sql = new StringBuilder();

			sql.append("INSERT INTO BANK_INFO(acc_no,acc_pw,acc_name,bank_code,user_id) ");
			sql.append("  VALUES(111||round(dbms_random.value(100000000,999999999)),?,?,?,?) ");

			// 계좌번호 앞자리 고정 어떻게함?/ bank코드 값으로 이름 연결하기. (완료)
			// 앞자리: '123'||시퀀스 / 코드: ui에서 스위치로 설정.
			pstmt = conn.prepareStatement(sql.toString());

			pstmt.setString(1, newacc.getAcc_pw());
			pstmt.setString(2, newacc.getAcc_name());
			pstmt.setString(3, newacc.getBank_code());
			pstmt.setString(4, newacc.getUser_id());

			if (pstmt.executeUpdate() != 0) {
				resisterGetMoney(newacc);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCClose.close(conn, pstmt);
		}

	}

	// 계좌개설시 1000원 입금
	public void resisterGetMoney(BankVO newacc) throws Exception {

		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = new ConnectionFactory().getConnection();
			StringBuilder sql = new StringBuilder();

			sql.append(
					"  INSERT INTO TRANS_DATA( TRANS_NO, ACC_NO, trans_info, TRANS_MONEY, SEND_ACC_NO, BANK_CODE, ACC_MONEY, trans_date ) ");
			sql.append(
					"  VALUES ( SEQ_TRANS_NO.NEXTVAL, (select acc_no from (select * from bank_info where user_id = ? ORDER BY ACC_DATE desc) where ROWNUM = 1),  'G', 1000, 'B111', '111' , 1000, SYSDATE ) ");

			// 계좌번호 앞자리 고정 어떻게함?/ bank코드 값으로 이름 연결하기. (완료)
			// 앞자리: '123'||시퀀스 / 코드: ui에서 스위치로 설정.
			pstmt = conn.prepareStatement(sql.toString());

			pstmt.setString(1, newacc.getUser_id());

			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCClose.close(conn, pstmt);
		}

	}

	/** 생성계좌 보여주기 **/
	// 아직 구현 안함. - 계좌 개설하면 개설된 계좌 보여줌.(화면없음)
	public String getAccId(String acc) throws Exception {
		String accid = "";
		BankVO bank = new BankVO();
		Connection conn = null;
		PreparedStatement pstmt = null;
		conn = new ConnectionFactory().getConnection();

		StringBuilder sql = new StringBuilder();
		sql.append("  select bank_name, acc_no ");
		sql.append(" from(select b.acc_no,b.acc_date,b.acc_name,c.bank_name  ");
		sql.append("  from bank_info b,bank_code c  ");
		sql.append(" where b.bank_code = c.bank_code ");
		sql.append("  and user_id=?  ");

		pstmt = conn.prepareStatement(sql.toString());
		pstmt.setString(1, acc);

		ResultSet rs = pstmt.executeQuery();

		if (rs.next()) {
			accid = rs.getString("user_id");
		}
		return accid;

		// 여기할차례!!!
	}

	// 계좌이체-거래내역
	public List<TransVO> transList(TransVO tv) throws Exception {
		List<TransVO> tlist = new ArrayList<TransVO>();
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = new ConnectionFactory().getConnection();
			StringBuilder sql = new StringBuilder();

			sql.append(
					"  select trans_no, acc_no,decode(trans_info,'S','출금','입금') as trans_info, trans_money, send_acc_no, acc_money, trans_date  ");
			sql.append("  from trans_data  ");
			sql.append("where acc_no=?");

			pstmt = conn.prepareStatement(sql.toString());

			pstmt.setString(1, tv.getAcc_no());

			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {

				String acc_no = rs.getString("acc_no");
				String trans_info = rs.getString("trans_info");
				int trans_money = rs.getInt("trans_money");
				String send_acc_money = rs.getString("send_acc_money");
				int acc_money = rs.getInt("acc_money");
				String trans_date = rs.getString("trans_date");

				System.out.println("acc_no" + acc_no);
				System.out.println("trans_info" + trans_info);
				System.out.println("trans_money" + trans_money);
				System.out.println("send_acc_money" + send_acc_money);
				System.out.println("acc_money" + acc_money);
				System.out.println("trans_date" + trans_date);

				TransVO trans = new TransVO(acc_no, trans_info, trans_money, send_acc_money, acc_money, trans_date);
				tlist.add(trans);

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCClose.close(conn, pstmt);
		}

		return tlist;

	}
	
	
	
	
	public boolean transfer(TransVO transaction) {
	      boolean bool = false;

	      
	      StringBuilder sql = new StringBuilder();
	      sql.append("{call TRANS(?, ?, ?, ?, ?)} "); //stored procedure 실행 방법
	      
	      try(
	            Connection conn = new ConnectionFactory().getConnection();
	            CallableStatement cstmt = conn.prepareCall(sql.toString());
	      ) {
	    	  
	         int idx = 1;
	         
	         cstmt.setString(idx++, transaction.getBank_code());//보내는쪽 은행 코드
	         cstmt.setString(idx++, transaction.getAcc_no());//보내는쪽 계좌번호
	         cstmt.setString(idx++, transaction.getT_bank_code());//받는쪽은행
	         cstmt.setString(idx++, transaction.getSend_acc_no());//받는쪽 계좌
	         cstmt.setInt(idx++, transaction.getTrans_money()); //금액
	         
	       
	         
	         if(cstmt.executeUpdate() != 0) {
	        	 bool = true;
	         }
	         
	         
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      return bool;// result == 0 : 보내는쪽 은행 오류 / result == 1 : 받는 쪽 은행 오류 / result == 2 : 성공
	   }
}
