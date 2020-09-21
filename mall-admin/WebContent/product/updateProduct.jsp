<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "vo.*" %>
<%@ page import = "dao.*" %>
<%@ page import = "java.util.*" %>
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
	
	<h1>목록 수정</h1>
	<%
		/*
		1. 수정할 리스트의 정보를 받아오고
		2. 테이블로 만든다.
		3. 내용 수정 -> 단, categoryId, productId 는 수정 불가 readonly
		4. action으로 보낸다
		*/
		
		request.setCharacterEncoding("utf-8");
		
		//리스트 정보 받기
		int productId = Integer.parseInt(request.getParameter("productId"));
		int categoryId = Integer.parseInt(request.getParameter("categoryId"));
		String productName = request.getParameter("productName");
		String productPrice = request.getParameter("productPrice");
		String productContent = request.getParameter("productContent");
		String productSoldout = request.getParameter("productSoldout");
		
		CategoryDao categoryDao = new CategoryDao(); // 카테고리 목록을 가져오기 -> 카테고리 select/option 기능 사용하기 위해
		ArrayList<Category> categoryList = categoryDao.selectCategoryList(); 
	%>
	<!-- 테이블 만들기 -->
	<form method = "post" action ="/mall-admin/product/updateProductAction.jsp">
		<table class="table table-bordered table-responsive-md">
			<tr>
				<td>product_id</td> <!-- 변경 x -->
				<td><input type ="text" name ="productId" value="<%=productId %>" readonly="readonly"></td>
			<tr>
			<tr>
				<td class="table-secondary">category_id</td>
				<td class="table-secondary">
					<select name = "categoryId">
						
						<%
							for(Category c : categoryList){
								 // 수정할 카테고리 아이디와 같다면 없애거나 선택되어야 한다
								 if(c.CategoryId==categoryId){
						%>
									<option value=<%=c.CategoryId %> selected="selected"><%=c.CategoryName %></option>
						<%
								}else{
						%>
								<option value=<%=c.CategoryId %>><%=c.CategoryName %></option>
						<%
								}
							}
						%>
					</select>
				</td>
			<tr>
			<tr>
				<td>product_name</td>
				<td><input type= "text" name = "productName" value=<%=productName %>></td>
			<tr>
			<tr>
				<td class="table-secondary">product_price</td>
				<td class="table-secondary"><input type= "text" name = "productPrice" value=<%=productPrice %>></td>
			<tr>
			<tr>
				<td>product_content</td>
				<td><textarea rows="5" cols="80" name ="productContent"></textarea></td>
			<tr>
			<tr>
				<td class="table-secondary">product_soldout</td>
				<td class="table-secondary">
					<%
						if(productSoldout.equals("N")){
					%>
							<input type="radio" name = "productSoldout" value="N" checked="checked">품절아님
							<input type="radio" name = "productSoldout" value="Y">품절
					<%
						}else{
					%>
							<input type="radio" name = "productSoldout" value="N">품절아님
							<input type="radio" name = "productSoldout" value="Y" checked="checked">품절
					<%
						}
					%>
				</td>
			<tr>
		</table>
		<button type="submit" class="btn btn-primary">수정하기</button>
	</form>
</div>
</body>
</html>