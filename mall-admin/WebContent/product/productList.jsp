<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import= "java.util.ArrayList" %>
<%@ page import = "vo.*" %>
<%@ page import = "dao.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class ="container">

	<div><!-- 메뉴 -->
		<jsp:include page ="/inc/menu.jsp"></jsp:include>
	</div>
	
	<%	//상품 목록에 따라 리스트 출력하기
		request.setCharacterEncoding("utf-8");
	
		//paging 하기 위해 currentPage 전송 받기
		int currentPage = 1;
		if(request.getParameter("currentPage")!=null){
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int categoryId = -1; //상품목록 전체 보기(초기화)
		if(request.getParameter("categoryId") != null){
			categoryId = Integer.parseInt(request.getParameter("categoryId"));
		}
		Page paging = new Page();
		
		ProductDao productDao = new ProductDao();
		paging = productDao.pageProductList(currentPage);
		ArrayList<Product> productList = null;
		if(categoryId == -1){ // 기본, 전체보기 
			productList = productDao.pageSelectProductList(paging.beginRow,paging.rowPerPage);
		}else{ //보고 싶은 상품 목록을 눌렀을 때
			productList = productDao.selectProductListByCategory(categoryId,paging.beginRow,paging.rowPerPage);
		}
		
		CategoryDao categoryDao = new CategoryDao();
		ArrayList<Category> categoryList = categoryDao.selectCategoryList();
	%>
	
	<h1>상품 목록</h1>
	
	<ul class="list-group list-group-horizontal">
		<li class="list-group-item btn btn-outline-warning">
			<a href="/mall-admin/product/productList.jsp?categoryId=-1" class="text-dark">[전체보기]</a>
		</li>
		
		<%
			for(Category c : categoryList){
		%>
			<li class="list-group-item btn btn-outline-warning">
				<a href="/mall-admin/product/productList.jsp?categoryId=<%=c.CategoryId%>" class="text-dark">
				[<%=c.CategoryName %>]</a>
			</li>
		<%
			}
		%>
	</ul>
		

	
	
	
	<table class="table table-bordered table-hover table-responsive-md">
		<thead class="table-success">
			<tr>
				<th><a href="/mall-admin/product/productListOrderAction.jsp" class="text-dark">product_id</a></th>
				<th>category_id</th>
				<th>product_name</th>
				<th>product_price</th>
				<th>product_soldout</th>
			</tr>
		</thead>
		<tbody>
			<%
				for(Product p : productList){
					if(p.productSoldout.equals("Y")){
			%>
					<tr>
						<td>
							<a href ="/mall-admin/product/productOne.jsp?productId=<%=p.productId%>" class="text-dark">
								<%=p.productId %>
							</a>
						</td>
						<td><%=p.categoryId %></td>
						<td><%=p.productName %></td>
						<td><%=p.productPrice %></td>
						<td>품절</td>
					<tr>
			<%
					}else{
			%>
					<tr>
						<td>
							<a href ="/mall-admin/product/productOne.jsp?productId=<%=p.productId%>" class="text-dark">
								<%=p.productId %>
							</a>
						</td>
						<td><%=p.categoryId %></td>
						<td><%=p.productName %></td>
						<td><%=p.productPrice %></td>
						<td><%=p.productSoldout %></td>
					<tr>
			<%
					}
				}
			%>
		</tbody>
	</table>
	<div>
		<ul class="pagination"> <!-- 페이징 -->
			<%
				if(currentPage >1){
			%>
					<li class="page-item"><a class="page-link" href="/mall-admin/product/productList.jsp?currentPage=1">처음으로</a></li>
					<li class="page-item"><a class="page-link" href="/mall-admin/product/productList.jsp?currentPage=<%=currentPage-1%>">이전</a></li>
					<li class="page-item disabled"><a class="page-link" href="/mall-admin/product/productList.jsp?currentPage=<%=currentPage+1%>">다음</a></li>
					<li class="page-item disabled"><a class="page-link" href="/mall-admin/product/productList.jsp?currentPage=<%=paging.lastPage%>">마지막으로</a></li>
			<%
				}
			%>
			<%
				if(currentPage < paging.lastPage){
			%>
					<li class="page-item disabled"><a class="page-link" href="/mall-admin/product/productList.jsp?currentPage=1">처음으로</a></li>
					<li class="page-item disabled"><a class="page-link" href="/mall-admin/product/productList.jsp?currentPage=<%=currentPage-1%>">이전</a></li>
					<li class="page-item"><a class="page-link" href="/mall-admin/product/productList.jsp?currentPage=<%=currentPage+1%>">다음</a></li>
					<li class="page-item"><a class="page-link" href="/mall-admin/product/productList.jsp?currentPage=<%=paging.lastPage%>">마지막으로</a></li>
			<%
				}
			%>
		</ul>
	</div>
	
	<div>
			<a class="nav-link btn btn-outline-info" href= "/mall-admin/product/addProduct.jsp">상품 추가</a>
	</div>
</div>
</body>
</html>