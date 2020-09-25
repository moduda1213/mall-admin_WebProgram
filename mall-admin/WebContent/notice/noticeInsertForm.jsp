<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "vo.*" %>
<%@ page import = "dao.*" %>
<%
	if(session.getAttribute("loginAdminId") == null){
		response.sendRedirect("/mall-admin/login/login.jsp");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<title>공지 상세보기</title>
</head>
<body>
	<div class="container">
		<div>
			<jsp:include page = "/inc/menu.jsp"></jsp:include>
		</div>
		<h1>공지 추가하기</h1>
		<form method="post" action="<%=request.getContextPath()%>/notice/noticeListInsertAction.jsp">
			<table class="table table-bordered table-hover table-responsive-md">
				<tr>
					<th class="table-success">noticeTitle</th>
					<td>
						<input type="text" name = "noticeTitle">
				</tr>
				<tr>
					<th class="table-success">noticeContent</th>
					<td>
						<textarea name ="noticeContent" rows="5" cols="50"></textarea>
					</td>
				</tr>
			</table>
			<button type="submit">추가하기</button>
		</form>
	</div>
</body>
</html>