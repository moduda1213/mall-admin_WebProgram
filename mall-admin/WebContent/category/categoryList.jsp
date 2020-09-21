<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "dao.*" %>
<%@ page import = "vo.*" %>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "java.sql.*" %>
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
	
	<h1>categoryList</h1>
	
	<div>&nbsp;</div>
	
	<div>
		<a class="btn btn-dark text-light" href="/mall-admin/category/addCategory.jsp">상품 카테고리 추가</a>
	</div>
	
	<div>&nbsp;</div>
	<%
		int currentPage = 1; //Page의 currentPage로 변경
		if(request.getParameter("currentPage") != null){
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		CategoryDao categoryDao = new CategoryDao();
		//page에서 뽑은 beginRow, rowPerPage를 넣는다
		Page p = categoryDao.createPage(currentPage);
		
		
		ArrayList<Category> list = categoryDao.intSelectCategoryList(p.beginRow,p.rowPerPage); // 리스트 목록 불러오는 메서드
		
	%>
	<table class="table table-bordered table-responsive-sm table-striped">
		<thead>
			<tr>
				<th class="table-secondary">category_no</th>
				<th class="table-secondary">category_name</th>
			</tr>
		</thead>
		<tbody>
			<%
				for(Category c : list){
			%>
					<tr>
						<td style="height:10px; width:10px;"><%=c.CategoryId %></td>
						<td style="height:10px; width:10px;"><%=c.CategoryName %></td>
						<td style="height:10px; width:5px;" class="table-info"><a href="/mall-admin/category/updateCategory.jsp?categoryId=<%=c.CategoryId%>&categoryName=<%=c.CategoryName%>">수정</a></td>
						<td style="height:10px; width:5px;" class="table-danger"><a href="/mall-admin/category/deleteCategoryAction.jsp?categoryId=<%=c.CategoryId%>">삭제</a></td>
					</tr>
			<%
				}
			%>
		</tbody>
	</table>
	
	<!-- 
		페이지 리스트 불러올 개수
		currentPage = 1 ... 현재 페이지, rowPerPage =5 ...페이지당 목록 수, beginRow= (currentPage-1)*rowPerPage,,,시작할 리스트의 첫 행
		페이지 수
		totalList -> count(*)
		count(*)%rowPerPage != 0 일 땐 lastPage = count(*) / rowPerPage -1     **if문;;
				//			== 0 일 땐 lastPage = count(*) / rowPerPage
	 -->

	<ul class="pagination">
		<%
			if(currentPage>1){
		%>
			  <li class="page-item"><a class="page-link" href ="/mall-admin/category/categoryList.jsp?currentPage=1">처음으로</a></li>
			  <li class="page-item"><a class="page-link" href = "/mall-admin/category/categoryList.jsp?currentPage=<%=currentPage-1%>">이전</a></li>
			  <li class="page-item disabled"><a class="page-link" href="/mall-admin/category/categoryList.jsp?currentPage=<%=currentPage+1%>">다음</a></li>
			  <li class="page-item disabled"><a class="page-link" href="/mall-admin/category/categoryList.jsp?currentPage=<%=p.lastPage%>">마지막으로</a></li>
		<%
			}
		%>
	 	<%
			if(currentPage<p.lastPage){
		%>
			  <li class="page-item disabled"><a class="page-link" href ="/mall-admin/category/categoryList.jsp?currentPage=1">처음으로</a></li>
			  <li class="page-item disabled"><a class="page-link" href = "/mall-admin/category/categoryList.jsp?currentPage=<%=currentPage-1%>">이전</a></li>
			  <li class="page-item"><a class="page-link" href="/mall-admin/category/categoryList.jsp?currentPage=<%=currentPage+1%>">다음</a></li>
			  <li class="page-item"><a class="page-link" href="/mall-admin/category/categoryList.jsp?currentPage=<%=p.lastPage%>">마지막으로</a></li>
		<%
			}
		%>
	</ul>
</div>
</body>
</html>