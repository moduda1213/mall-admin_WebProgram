<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<ul>
		<li>
			<a href="/mall-admin/category/categoryList.jsp">상품카테고리 관리</a>
		</li>
	</ul>
	
	<h1>카테고리 입력</h1>
	<form method ="post" action="/mall-admin/category/addCategoryAction.jsp">
		<div>category_name</div>
		<div><input type ="text" name ="categoryName"></div>
		<div><button type ="submit">카테고리 추가</button></div>
	</form>
</body>
</html>