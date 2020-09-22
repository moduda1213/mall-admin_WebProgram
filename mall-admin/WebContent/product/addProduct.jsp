<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%@ page import ="java.util.*" %>
<%@ page import ="java.sql.*" %>
<%
	if(session.getAttribute("loginAdminId")==null){
		response.sendRedirect("/mall-admin/login/login.jsp");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>addProduct</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container">
	<div>
		<jsp:include page ="/inc/menu.jsp"></jsp:include>
	</div>
	
	<%
		CategoryDao categoryDao = new CategoryDao();
		ArrayList<Category> categoryList = categoryDao.selectCategoryList();
		
	%>
	
	<h1>상품 추가</h1>
	<form method ="post" action="/mall-admin/product/addProductAction.jsp">
		<table class="table table-bordered">
			<tr>
				<td>category_id</td>
				<td>
					<select name ="categoryId">
						<option value="">카테고리선택</option>
						<%
							for(Category c : categoryList){
						%>
								<option value="<%=c.CategoryId %>"><%=c.CategoryName %></option>
						<%
							}
						%>
					</select>
				</td>
			</tr>
			<tr>
				<td>product_name</td>
				<td>
					<input type="text" name = "productName">
				</td>
			</tr>
			<tr>
				<td>product_price</td>
				<td>
					<input type="text" name = "productPrice">
				</td>
			</tr>
			<tr>
				<td>product_content</td>
				<td>
					<textarea rows="5" cols="80" name ="productContent"></textarea>
				</td>
			</tr>
			<tr>
				<td>product_soldout</td>
				<td>
					<input type="radio" name = "productSoldout" value ="N" checked="checked">품절아님
					<input type="radio" name = "productSoldout" value ="Y">품절
				</td>
			</tr>
		</table>
		<button type="submit" class="btn btn-primary">추가하기</button>
	</form>
</div>
</body>
</html>