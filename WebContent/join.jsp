<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="icon" href="images/favicon.png" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
<link rel="stylesheet" href="css/custom.css">
<style>
	.navbar {
		margin-bottom : 2px;
	}
</style>
<title>JSP게시판</title>
</head>
<body>
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
	        <li class=""><a href="main.jsp">메인</a></li>
			<li><a href="board.jsp">게시판</a></li>
	      </ul>
	      <ul class="nav navbar-nav navbar-right">
			<li class="dropdown">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
					로그인<span class="caret"></span>
				</a>
				<ul class="dropdown-menu">
					<li><a href="login.jsp">로그인</a></li>
					<li class="active"><a href="join.jsp">회원가입</a></li>
				</ul>
			</li>
		</ul>
	    </div><!-- /.navbar-collapse -->
	  </div><!-- /.container-fluid -->
	</nav>
	
	<div class="container">
		<div id="signupbox" style="margin-top:50px" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
            <div class="panel panel-info">
                <div class="panel-heading">
                    <div class="panel-title">회원가입</div>
                </div>  
                <div class="panel-body" >
                    <form  method="post" action="joinAction.jsp" id="signupform" class="form-horizontal" role="form">
                        
                        <div class="form-group">
                            <label for="id" class="col-md-3 control-label">아이디</label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" name="userID" placeholder="아이디를 입력해주세요.">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="password" class="col-md-3 control-label">패스워드</label>
                            <div class="col-md-9">
                                <input type="password" class="form-control" name="userPassword" placeholder="패스워드를 입력해주세요.">
                            </div>
                        </div>
                            
                        <div class="form-group">
                            <label for="username" class="col-md-3 control-label">성명</label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" name="userName" placeholder="성명을 입력해주세요.">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="email" class="col-md-3 control-label">이메일</label>
                            <div class="col-md-9">
                                <input type="email" class="form-control" name="userEmail" placeholder="이메일을 입력해주세요.">
                            </div>
                        </div>
                        <div class="form-group" style="text-align:center;">
                            <div class="btn-group" data-toggle="buttons">
							<label class="btn btn-primary active">
								<input type="radio" name="userGender" autocomplete="off" value="남자" checked>
								남자
							</label>
							<label class="btn btn-primary">
								<input type="radio" name="userGender" autocomplete="off" value="여자" checked>
								여자
							</label>
						</div>
                        </div>
                        <div class="form-group">
                            <!-- Button -->                                        
                            <div class="col-md-offset-0 col-md-12">
                                <input type="submit" class="btn btn-primary form-control" value="회원가입">  
                            </div>
                        </div>
                    </form>
                 </div>
            </div>
         </div>
	</div>
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha384-nvAa0+6Qg9clwYCGGPpDQLVpLNn0fRaROjHqs13t4Ggj3Ez50XnGQqc/r8MhnRDZ" crossorigin="anonymous"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script>
</body>
</html>