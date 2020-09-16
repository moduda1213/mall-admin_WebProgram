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
</head>
<body>
	<div>
		<jsp:include page ="/inc/menu.jsp"></jsp:include>
	</div>
	
	<h1>categoryList</h1>
	<div>
		<a href="/mall-admin/category/addCategory.jsp">상품 카테고리 추가</a>
	</div>
	<%//테이블하나당 클래스 하나
		int currentPage = 1;
		if(request.getParameter("currentPage") != null){
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		//page => currentPage, beginRow, rowPerPage
		//Page page = new Page();
		int rowPerPage = 5;
		int beginRow = (currentPage - 1)*rowPerPage;
		
		String driver = "org.mariadb.jdbc.Driver";
		String dbaddr = "jdbc:mariadb://localhost:3306/mall";
		String dbid = "root";
		String dbpw = "java1004";
		String sql = "select count(*) from category";
		Class.forName(driver);
		Connection conn = DriverManager.getConnection(dbaddr,dbid,dbpw);
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		conn.close();
		
		int totalList = 0;
		int lastPage = 0;
		
		if(rs.next()) {
			totalList=rs.getInt("count(*)");
		}
		if(totalList % rowPerPage != 0){
			lastPage = (totalList / rowPerPage)+1; 
		}else{
			lastPage = (totalList / rowPerPage); 
		}
		
		CategoryDao categoryDao = new CategoryDao();
		
		//page에서 뽑은 beginRow, rowPerPage를 넣는다
		ArrayList<Category> list = categoryDao.selectCategoryList(beginRow,rowPerPage); // 리스트 목록 불러오는 메서드
	%>
	<table border ="1">
		<thead>
			<tr>
				<th>category_no</th>
				<th>category_name</th>
			</tr>
		</thead>
		<tbody>
			<%
				for(Category c : list){
			%>
					<tr>
						<td><%=c.CategoryId %></td>
						<td><%=c.CategoryName %></td>
						<td><a href="/mall-admin/category/updateCategory.jsp?categoryId=<%=c.CategoryId%>&categoryName=<%=c.CategoryName%>">수정</a></td>
						<td><a href="/mall-admin/category/deleteCategoryAction.jsp?categoryId=<%=c.CategoryId%>">삭제</a></td>
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
	<table border ="1">
		<tr>
		<%
			if(currentPage>1){
		%>
			<td><a href = "/mall-admin/category/categoryList.jsp?currentPage=1">처음으로</a></td> 
			<td><a href = "/mall-admin/category/categoryList.jsp?currentPage=<%=currentPage-1%>">이전</a></td>
		<%
			}
		%>
		<%
			if(currentPage<lastPage){
		%>
			<td><a href = "/mall-admin/category/categoryList.jsp?currentPage=<%=currentPage+1%>">다음</a></td>
			<td><a href = "/mall-admin/category/categoryList.jsp?currentPage=<%=lastPage%>">마지막으로</a></td>
		<%
			}
		%>
		<tr>
	</table>
</body>
</html>