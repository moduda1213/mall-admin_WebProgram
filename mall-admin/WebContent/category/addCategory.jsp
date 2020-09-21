<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container">
	
	<div>
		<jsp:include page ="/inc/menu.jsp"></jsp:include>
	</div>
	
	<h1>카테고리 입력</h1>
	
	<div class="form-group">
		<form method ="post" action="/mall-admin/category/addCategoryAction.jsp">
			<label for="usr">category_name :</label>
			<div><input type ="text" class="form-control" id="usr" name ="categoryName" style="width:150px;"></div>
			<div>&nbsp;</div>
			<div><button type ="submit" class="btn btn-primary">카테고리 추가</button></div>
		</form>
	</div>
</div>
</body>
</html>