<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UpdateCategory</title>
</head>
<body>
	<ul>
		<li>
			<a href="/mall-admin/category/categoryList.jsp">상품카테고리 관리</a>
		</li>
	</ul>
	
	<% //수정할 행 가져오기 위해 값을 요청
		int cateId = Integer.parseInt(request.getParameter("categoryId")); // 수정할 아이디
		String cateName = request.getParameter("categoryName"); // 수정할 이름
	%>
	
	<h1>카테고리 수정</h1>
	<form method = "post" action = "/mall-admin/category/updateCategoryAction.jsp">
		<div>category_id</div>
		<div><input type = "text" name = "categoryId" value=<%=cateId %> readonly = "readonly"></div>
		<div>category_name</div>
		<div><input type = "text" name = "categoryName" value =<%=cateName %>></div>
		<div><button type = "submit">정보 수정하기</button></div>
	</form> 
</body>
</html>