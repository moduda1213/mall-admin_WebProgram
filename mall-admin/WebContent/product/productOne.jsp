<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "vo.*" %>
<%@ page import = "dao.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>ProductOne</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container">

	<div><!-- 메뉴 -->
		<jsp:include page ="/inc/menu.jsp"></jsp:include>
	</div>
	<h1>상품 상세보기</h1>
	
	<%
	
		int productId = Integer.parseInt(request.getParameter("productId"));
		System.out.println(productId +"<- productId");
		
		Product product = new ProductDao().selectProductOne(productId);
		System.out.println(product +"<- product");
	%>
	
	<table class="table table-bordered table-hover table-responsive-sm">
		<tr>
			<td>product_id</td>
			<td><%=product.productId %></td>
		</tr>
		<tr>
			<td>category_id</td>
			<td><%=product.categoryId%> </td>
		</tr>
		<tr>
			<td>product_name</td>
			<td><%=product.productName%></td>
		</tr>
		<tr>
			<td>product_price</td>
			<td><%=product.productPrice%></td>
		</tr>
		<tr>
			<td>product_content</td>
			<td><%=product.productContent%></td>
		</tr>
		<tr>
			<td>produc_soldout</td>
			<td>
				<%
					if(product.productSoldout.equals("Y")){
				%>
						<a href="/mall-admin/product/modifyProductSoldoutAction.jsp?productId=<%=product.productId%>&productSoldout=<%=product.productSoldout%>">[품절]</a>
				<%
					}else{
				%>
						<a href="/mall-admin/product/modifyProductSoldoutAction.jsp?productId=<%=product.productId%>&productSoldout=<%=product.productSoldout%>">[품절아님]</a>
				<%
					}
				%>
			</td>
		</tr>
		<tr>
			<td class="table-info"><a class="text-dark" href="/mall-admin/product/updateProduct.jsp?productId=<%=product.productId%>&categoryId=<%=product.categoryId%>
									&productName=<%=product.productName%>&productPrice=<%=product.productPrice%>&productSoldout=<%=product.productSoldout%>">[수정]</a></td>
			<td class="table-danger"><a class="text-dark" href="/mall-admin/product/deleteProductAction.jsp?productId=<%=product.productId%>">[삭제]</a></td>
		</tr>
	</table>
</div>
</body>
</html>