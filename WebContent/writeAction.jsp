<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.BoardDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="board" class="board.Board" scope="page" />
<jsp:setProperty name="board" property="boardTitle" />
<jsp:setProperty name="board" property="boardContent" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP게시판</title>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
		if(userID == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 해주세요.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		} else {
			if(board.getBoardTitle() == null || board.getBoardContent() == null ) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 되지 않는 내용이 있습니다.')");
				script.println("history.back()");
				script.println("</script>");
			} else {
				BoardDAO boardDAO = new BoardDAO();
				int result = boardDAO.write(board.getBoardTitle(), userID, board.getBoardContent());
				if(result == -1){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글쓰기 실패')");
					script.println("history.back()");
					script.println("</script>");
				} else {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href='board.jsp'");
					script.println("</script>");
				}
			}	
		}
	%>	
</body>
</html>