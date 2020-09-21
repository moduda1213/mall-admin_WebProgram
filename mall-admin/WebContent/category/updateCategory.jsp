<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UpdateCategory</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container">
	<div>
		<jsp:include page ="/inc/menu.jsp"></jsp:include>
	</div>
	
	<% //수정할 행 가져오기 위해 값을 요청
		int cateId = Integer.parseInt(request.getParameter("categoryId")); // 수정할 아이디
		String cateName = request.getParameter("categoryName"); // 수정할 이름
	%>
	
	<h1>카테고리 수정</h1>
	<div class="form-group">
		<form method = "post" action = "/mall-admin/category/updateCategoryAction.jsp">
			<label for="usr">category_id:</label>
			<div><input type = "text" class="form-control" id="usr" name = "categoryId" value=<%=cateId %> readonly = "readonly" style="width:150px;"></div>
			<label for="usr">category_name:</label>
			<div><input type = "text" class="form-control" id="usr" name = "categoryName" value =<%=cateName %> style="width:150px;"></div>
			<div>&nbsp;</div>
			<div><button type = "submit" class= "btn btn-primary">정보 수정하기</button></div>
		</form> 
	</div>
</div>
</body>
</html>