<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	if(session.getAttribute("loginAdminId") !=null){
		System.out.println("이미 로그인이 되어있는 상태입니다.");
		response.sendRedirect("/mall-admin/index.jsp");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<title>login</title>
</head>
<body>
<div class="container">

	<div class="jumbotron">
	  <h1>관리자 로그인</h1>
	</div>
	
	<div class="form-group">
		<form method="post" action="/mall-admin/login/loginAction.jsp"><!-- 절대 주소 -->
			<label for="usr">관리자ID:</label>
			<input type ="text" class="form-control" id="usr" name = "adminId" style="width:200px;" value="admin@naver.com">
				
			<label for="pwd">관리자PW:</label>
			<input type ="password" class="form-control" id="pwd" name = "adminPw" style="width:200px;" value="1234">
			<div>&nbsp;</div>
			<button type = "submit" class="btn btn-primary">로그인</button>
		</form>
	</div>
</div>
</body>
</html>