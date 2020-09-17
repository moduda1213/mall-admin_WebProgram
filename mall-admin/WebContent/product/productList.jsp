<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import= "java.util.ArrayList" %>
<%@ page import = "vo.*" %>
<%@ page import = "dao.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div><!-- 메뉴 -->
		<jsp:include page ="/inc/menu.jsp"></jsp:include>
	</div>
	
	<%	//상품 목록에 따라 리스트 출력하기
		request.setCharacterEncoding("utf-8");
	
		int categoryId = -1; //상품목록 전체 보기(초기화)
		if(request.getParameter("categoryId") != null){
			categoryId = Integer.parseInt(request.getParameter("categoryId"));
		}
		
		ProductDao productDao = new ProductDao();
		
		ArrayList<Product> productList = null;
		if(categoryId == -1){ // 기본, 전체보기 
			productList = productDao.selectProductList();
		}else{ //보고 싶은 상품 목록을 눌렀을 때
			productList = productDao.selectProductListByCategory(categoryId);
		}
		
		CategoryDao categoryDao = new CategoryDao();
		ArrayList<Category> categoryList = categoryDao.selectCategoryList();
	%>
	
	<h1>상품 목록</h1>
	
	<div>
		<a href="/mall-admin/product/productList.jsp?categoryId=-1">[전체보기]</a>
		<%
			for(Category c : categoryList){
		%>
				<a href="/mall-admin/product/productList.jsp?categoryId=<%=c.CategoryId%>">
				[<%=c.CategoryName %>]</a>
		<%
			}
		%>
	</div>
	
	<div>
		<a href= "/mall-admin/product/addProduct.jsp">상품 추가</a>
	</div>
	
	<table border="1">
		<thead>
			<tr>
				<th>product_id</th>
				<th>category_id</th>
				<th>product_name</th>
				<th>product_price</th>
				<th>p.product_content<th>
				<th>product_soldout</th>
			</tr>
		</thead>
		<tbody>
			<%
				for(Product p : productList){
					if(p.productSoldout.equals("Y")){
			%>
					<tr>
						<td><%=p.productId %></td>
						<td><%=p.categoryId %></td>
						<td><%=p.productName %></td>
						<td><%=p.productPrice %></td>
						<td><%=p.productContent %><td>
						<td>품절</td>
						<td><a href="/mall-admin/product/updateProduct.jsp?productId=<%=p.productId%>&categoryId=<%=p.categoryId%>
									&productName=<%=p.productName%>&productPrice=<%=p.productPrice%>&productSoldout=<%=p.productSoldout%>">수정</a></td>
						<td><a href="/mall-admin/product/deleteProductAction.jsp?productId=<%=p.productId%>">삭제</a></td>
					<tr>
			<%
					}else{
			%>
					<tr>
						<td><%=p.productId %></td>
						<td><%=p.categoryId %></td>
						<td><%=p.productName %></td>
						<td><%=p.productPrice %></td>
						<td><%=p.productContent %><td>
						<td><%=p.productSoldout %></td>
						<td><a href="/mall-admin/product/updateProduct.jsp?productId=<%=p.productId%>&categoryId=<%=p.categoryId%>
									&productName=<%=p.productName%>&productPrice=<%=p.productPrice%>&productSoldout=<%=p.productSoldout%>">수정</a></td>
						<td><a href="/mall-admin/product/deleteProductAction.jsp?productId=<%=p.productId%>">삭제</a></td>
					<tr>
			<%
					}
				}
			%>
			
		</tbody>
	</table>
</body>
</html>