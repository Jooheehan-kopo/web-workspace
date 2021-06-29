<%@page import="kr.ac.kopo.login.dao.LoginVO"%>
<%@page import="kr.ac.kopo.login.dao.LoginDAO"%>
<%@page import="kr.ac.kopo.member.MemberVO"%>
<%@page import="kr.ac.kopo.util.JDBCClose"%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.ac.kopo.util.ConnectionFactory"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 작업순서
    1. login.jsp 파일에서 날라오는 파라미터 추출(id,password)
    2. 추출된 ID, PASSWORD 에 맞는 회원의 존재여부 판단(DB, t_member)
    - 만일 로그인 성공시 세션에 회원정보를 등록.
    3. 존재여부에 따른 페이지를 이동(로그인을 성공 : index.jsp 로 / 로그인 실패시 : login.jsp)
    --%>
 <%
 //1.인코딩, 파라미터 추출
 response.setCharacterEncoding("utf-8");
  
 String id = request.getParameter("id");
 String password = request.getParameter("password");
 //System.out.print(cid); 찍어보기.
 
 //2 디비 접속하고 쿼리만들고 하지 않고, 이 작업을 하는 것을 dao 클래스로 뺄꺼임. (비즈니스 로직으로) 만들어줌.
 
 LoginVO loginVO = new LoginVO();
 loginVO.setId(id);
 loginVO.setPassword(password);  //여기서 값을 가져온것임. loginDAO
 
 //3 db 로그인 수행
 LoginDAO dao = new LoginDAO();
 	//dao.login(loginVO); //이에 맞춰서 성공했다면 로그인객체 넘겨, 아니면 널을 넘기던지 해ㅣ.
 LoginVO userVO = dao.login(loginVO);
 
 	
 	
 	/* 4 
 	로그인 실패: userVO null
 	로그인 성공: userVO null 아니면.
 	
 	*/
 	//5 
 	String msg =null;
 	String url = null;
 	
 	if(userVO ==null){
 		msg ="아이디 또는 패스워드를 잘못 입력하셨습니다.";
 		url = "/Mission-Web/jsp/login/login.jsp";
 	}else{
 		msg =userVO.getName() + "님 환영합니다";
 		url= "/Mission-Web/index.jsp";
 		
 		
 		//6 세션등록
 		session.setAttribute("userVO", userVO);
 	}

 	
 	//6 아래의 alert 창을 띄우기위해 공유영역에 값을 저장.
 	pageContext.setAttribute("msg",msg);
 	pageContext.setAttribute("url",url);
 	
 	
/*  //2.디비 연결, --> DAO로 이동.
 Connection conn = new ConnectionFactory().getConnection();
 StringBuilder sql = new StringBuilder();
 sql.append("select id, password  from members");
 sql.append("  where id=? , password=?  ");
 
 PreparedStatement pstmt = conn.prepareStatement(sql.toString());
 pstmt.setString(1,id);
 pstmt.setString(2,password);
 
 
 
 String id = rs.getString("id"); 
 String pwd = rs.getString("password"); 

 ResultSet rs = pstmt.executeQuery();
 rs.next();
 
 JDBCClose.close(conn,pstmt); 
 
 //. 세션 등록
 MemberVO member = new MemberVO();
 member.setId(id);
 member.setPassword(pwd);
 
 session.setAttribute("id", id);
 session.setAttribute("password", pwd );
 
 */
 
 
 %>
 <script >
alert('${msg}')
location.href="${url}"
</script>
 
<!--  <script>
 //6 ("" 붙여야함. 변환될때, 없으면 변수인줄 앎)
 alert('${msg}');
 </script> -->
<%--  <jsp:forward page = "${url}"/>   쓰면안됨--%>
 
 <%-- 
 <c:if test="${param.id }" eq cid>
 	  <jsp:forward page ="/index.jsp"/>
 </c:if> --%>