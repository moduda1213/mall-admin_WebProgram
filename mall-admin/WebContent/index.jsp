<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	if(session.getAttribute("loginAdminId")== null){
		response.sendRedirect("/mall-admin/login/login.jsp"); // 로그인 안되었다면 세션은 세션대로 인덱스 코드는 인덱스 대로 진행되고 있다
		return; //로그인이 안되었다면 끝낸다. 인덱스 코드가 진행되지 않게 하도록
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>index</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>

<div class="container">

	<div>
		<jsp:include page ="inc/menu.jsp"></jsp:include>
	</div>
	
	<div>
  		<h1>메인 페이지 <span class="badge badge-secondary">관리자</span></h1>
  		<p><%=session.getAttribute("loginAdminId") %> 님 반갑습니다</p>
	</div>
	
	<div>&nbsp;</div>
	<div>&nbsp;</div>
	
	<div>
		<img src="/mall-admin/image/tool.png" class="rounded-circle" alt="Cinque Terre" style="width:500px;">
	</div>
</div>
</body>
</html>