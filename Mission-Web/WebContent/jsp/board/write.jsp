<%@page import="kr.ac.kopo.board.vo.BoardFileVO"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="kr.ac.kopo.util.KopoFileNamePolicy"%>
<%@page import="kr.ac.kopo.board.vo.BoardVO"%>
<%@page import="kr.ac.kopo.board.dao.BoardDAO"%>
<%@page import="kr.ac.kopo.util.JDBCClose"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.ac.kopo.util.ConnectionFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%-- 작업순서.
    1. 파라미어(제목, 작성자, 내용 추출)
    2. 추출된 데이터를 db t_board에 삽입
    3. 목록페이지 이동 --%>
<%
request.setCharacterEncoding("utf-8");

String saveDirectory = "C:/Users/HP/web-workspace/Mission-Web/WebContent/upload";
/* //C:\Users\HP\eclipse-work\wtpwebapps\Mission-Web/upload//  디플로이할때 여기로 지정해줘야함. */
// C:\\라고 쓰면 윈도우방식.
MultipartRequest multiRequest = new MultipartRequest(request, saveDirectory, 1024 * 1024 * 3, "utf-8",
		new KopoFileNamePolicy());

//1.게시글 저장(t_boar)
String title = multiRequest.getParameter("title");
String writer = multiRequest.getParameter("writer");
String content = multiRequest.getParameter("content");

BoardDAO dao = new BoardDAO();
//게시물 번호 추출
int boardNo= dao.selectNo();

BoardVO board = new BoardVO();
board.setTitle(title);
board.setWriter(writer);
board.setContent(content);
board.setNo(boardNo);

dao.insert(board);

//2.첨부파일저장 (t_board_file)
Enumeration files = multiRequest.getFileNames();
while(files.hasMoreElements()){
	String fileName = (String)files.nextElement();
	File f = multiRequest.getFile(fileName);
	if(f != null){
		
		String fileOriName = multiRequest.getOriginalFileName(fileName);
		String fileSaveName = multiRequest.getFilesystemName(fileName);
		int fileSize = (int)f.length();  //파일은 long형임, 형변환해준것..
		
		BoardFileVO fileVO = new BoardFileVO();
		fileVO.setFileOriName(fileOriName);
		fileVO.setFileSaveName(fileSaveName);
		fileVO.setFileSize(fileSize);
		fileVO.setBoardNo(boardNo);
		
		dao.insertFile(fileVO);
		
		//System.out.println(fileOriName + ": " + fileSaveName);
	}//파일이 첨부되었을때만 정보를 봐야함.
	
	
}

/* multiRequest.getOriginalFileName("attachfile1");
multiRequest.getFilesystemName("attachfile1");
 */
/*
request.getParameter형태로 뽑아올수없기에, (multipart-formdata 라서) 주석처리.

String title = request.getParameter("title");
String writer = request.getParameter("writer");  //인풋으로 받지 않지만, 세션에 있음. 가져올 수 있음..
String content = request.getParameter("content");

BoardVO board = new BoardVO();
board.setTitle(title);
board.setWriter(writer);
board.setContent(content);

BoardDAO dao = new BoardDAO();
dao.insert(board);
*/
%>

<script>
	alert('새글 등록이 완료되었습니다')
	location.href = "list2(el).jsp"
</script>