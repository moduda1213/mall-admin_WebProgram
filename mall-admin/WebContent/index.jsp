<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
</head>
<body>
	<%
		int log = 0; // 권한을 얻었는지 판단하기 위한 count
		if(request.getParameter("log")!=null){
			log = Integer.parseInt(request.getParameter("log"));
		}
		System.out.println(log);
	%>
	<div>
		<jsp:include page ="/inc/menu.jsp?log=<%=log %>"></jsp:include>
	</div>
	<h1>관리자 메인 페이지</h1>
	<div>
	<%
		if(log == 1){
	%>
		<a href="/mall-admin/index.jsp?log=0">log out</a>
	<%
		}else{
	%>	
		<a href="/mall-admin/login/login.jsp?">sign in</a>
	<%
		}
	%>
	</div>
</body>
</html>