package kr.co.jh.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.jh.dao.BankDAO;
import kr.co.jh.vo.BankVO;

public class AccNewController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		
		
		String acc_pw = request.getParameter("acc_pw");
		String acc_name = request.getParameter("acc_name");
		String user_id= request.getParameter("user_id");
		String bank_code = request.getParameter("bank_code");
		
		
		
		System.out.println(acc_pw);
		System.out.println(acc_name);
		System.out.println(user_id);
		System.out.println(bank_code);
		
		BankVO bank = new BankVO();
		bank.setAcc_pw(acc_pw);
		bank.setUser_id(user_id);
		bank.setAcc_name(acc_name);
		bank.setBank_code(bank_code);
		
		BankDAO dao = new BankDAO();
		dao.resisterAcc(bank);
		
		return "/account/AccNew.jsp";
	}

}
