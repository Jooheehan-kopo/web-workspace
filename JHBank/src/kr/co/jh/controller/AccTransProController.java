package kr.co.jh.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.jh.dao.BankDAO;
import kr.co.jh.vo.TransVO;

public class AccTransProController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		List<TransVO> list = new ArrayList<TransVO>();
		
		String m_bank_code = request.getParameter("m_bank_code");
		String m_acc_no = request.getParameter("acc_no");
		String t_bank_code = request.getParameter("t_bank_code");
		int trans_money = Integer.parseInt(request.getParameter("trans_money"));
		String t_acc_no = request.getParameter("send_acc_no");
		
		String acc_pw = request.getParameter("acc_pw");
		//나중애 ~
		
		
		TransVO tv = new TransVO();
		tv.setBank_code(m_bank_code);
		tv.setAcc_no(m_acc_no);
		tv.setT_bank_code(t_bank_code);
		tv.setSend_acc_no(t_acc_no);
		tv.setTrans_money(trans_money);
		System.out.println(tv.toString());
		
		
		
		BankDAO dao = new BankDAO();
		boolean bool = dao.transfer(tv);
		
		String msg ="";
		String url = "";
		if(bool) {
			msg = "이체 성공!";
		}
	
		
		
		return "/accsearch.do";
	}

}