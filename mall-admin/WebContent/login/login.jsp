<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
</head>
<body>
	<h1>관리자 로그인</h1>
	<form method="post" action="/mall-admin/login/loginAction.jsp"><!-- 절대 주소 -->
		<table border = "1">
			<tr>
				<td>관리자ID</td>
				<td><input type ="text" name = "adminId"></td>
			</tr>
			<tr>
				<td>관리자PW</td>
				<td><input type ="password" name = "adminPw"></td>
			</tr>
		</table>
		<button type = "submit">로그인</button>
	</form>
</body>
</html>