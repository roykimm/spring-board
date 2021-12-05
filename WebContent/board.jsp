<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.io.PrintWriter" %>
<%@ page import="board.BoardDAO" %>
<%@ page import="board.Board" %>
<%@ page import="board.Page" %>
<%@ page import="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="icon" href="images/favicon.png" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
<link rel="stylesheet" href="css/custom.css">
<title>JSP게시판</title>
<style type="text/css">
	a, a:hover {
		color: #000000;
		text-decoration: none;	
	}
	
	.navbar {
		margin-bottom : 2px;
	}
</style>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		int pageNumber = 1;
		if (request.getParameter("pageNumber") != null){
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
		
	%>
	<nav class="navbar navbar-default">
	  <div class="container-fluid">
	    <!-- Brand and toggle get grouped for better mobile display -->
	    <div class="navbar-header">
	      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
	        <span class="sr-only">Toggle navigation</span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	      </button>
	      <a class="navbar-brand" href="main.jsp">JSP 게시판</a>
	    </div>
	
	    <!-- Collect the nav links, forms, and other content for toggling -->
	    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	      <ul class="nav navbar-nav">
	        <li><a href="main.jsp">메인</a></li>
			<li class="active"><a href="board.jsp">게시판</a></li>
	      </ul>
	      <%
				if(userID == null) {
			%>
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
								로그인<span class="caret"></span>
							</a>
							<ul class="dropdown-menu">
								<li><a href="login.jsp">로그인</a></li>
								<li><a href="join.jsp">회원가입</a></li>
							</ul>
						</li>
					</ul>
			
			<%
				} else {
			%>
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
								회원관리<span class="caret"></span>
							</a>
							<ul class="dropdown-menu">
								<li><a href="logoutAction.jsp">로그아웃</a></li>
							</ul>
						</li>
					</ul>
			<%
				}
			%>
	    </div><!-- /.navbar-collapse -->
	  </div><!-- /.container-fluid -->
	</nav>
	
	<div class="container" style="margin-top:20px;">
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #eeeeee">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">번호</th>
						<th style="background-color: #eeeeee; text-align: center;">제목</th>
						<th style="background-color: #eeeeee; text-align: center;">작성자</th>
						<th style="background-color: #eeeeee; text-align: center;">작성일자</th>
					</tr>
				</thead>
				<tbody>
				<%
					BoardDAO boardDAO = new BoardDAO();
					ArrayList<Board> list = boardDAO.getList(pageNumber);
					for(int i=0; i< list.size(); i++) {
				%>
					<tr>
						<td><%= list.get(i).getBoardID() %></td>
						<td><a href="view.jsp?boardID=<%= list.get(i).getBoardID() %>"><%= list.get(i).getBoardTitle().replaceAll(" ","&nbsp;").replaceAll("<", "&lt;").replaceAll(">","&gt;") %></a></td>
						<td><%= list.get(i).getUserID() %></td>
						<td><%= list.get(i).getBoardDate().substring(0,11) + list.get(i).getBoardDate().substring(11,13) + "시 " + list.get(i).getBoardDate().substring(14,16) + "분" %></td>
					</tr>
				<%
					}
				%>
					
				</tbody>
			</table>
			
			<!--  
				if(pageNumber != 1) {
			
				<a href="board.jsp?pageNumber=<%=pageNumber-1 %>" class="btn btn-success btn-arrow-left">이전</a>
			
				} if (boardDAO.nextPage(pageNumber+ 1)) {
			
				<a href="board.jsp?pageNumber=<%=pageNumber +1 %>" class="btn btn-success btn-arrow-right">다음</a>
			
				}
			-->
			
			<%
				int totalRows =  boardDAO.getTotalRows();
				//(totalRows, pageNumber)
				Page pages = new Page(totalRows, pageNumber);
				
			%>
				<nav aria-label="Page navigation example">
				  <ul class="pagination justify-content-end">
			<%
				if(pages.getNowPage() >1) {
			%>
				<li class="page-item"><a class="page-link" href="board.jsp?pageNumber=1">맨처음</a></li>
				<li class="page-item"><a class="page-link" href="board.jsp?pageNumber=<%=pageNumber -1 %>">이전</a></li>
			<%
				} 
			
				for(int i=pages.getStartPage(); i <pages.getEndPage() + 1; i++){
			%>
				<%
					if(i == pageNumber) {						
				%>
						<li class="page-item active"><a class="page-link" href="board.jsp?pageNumber=<%=i%>"><%=i%></a></li>
				<% 
					} else {
				%>
						<li class="page-item"><a class="page-link" href="board.jsp?pageNumber=<%=i%>"><%=i%></a></li>
				<%
					}
				%>				
			<%
				}
				if(pages.getTotPage() > pages.getEndPage()){			
			%>
				<li class="page-item"><a class="page-link btn-arrow-right" href="board.jsp?pageNumber=<%=pageNumber +1 %>">다음</a></li>
				<li class="page-item"><a class="page-link" href="board.jsp?pageNumber=<%=pages.getTotPage() %>">맨뒤</a></li>
			<%
				}	
				
			%>
				</ul>
			</nav>
			<a href="write.jsp" class="btn btn-primary pull-right" style="margin-bottom: 10px;">글쓰기</a>
		</div>
	</div>
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha384-nvAa0+6Qg9clwYCGGPpDQLVpLNn0fRaROjHqs13t4Ggj3Ez50XnGQqc/r8MhnRDZ" crossorigin="anonymous"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script>
</body>
</html>