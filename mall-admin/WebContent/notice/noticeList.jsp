<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "vo.*" %>
<%@ page import = "dao.*" %>
<%@ page import = "java.util.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<title>공지 관리</title>
</head>
<body>
	<%
		/*
			notice 리스트 불러오기
			수정 , 삭제 , 추가 
		*/
		ArrayList<Notice> notice = new ArrayList<Notice>();
		NoticeDao noticeDao = new NoticeDao();
		notice = noticeDao.selectNoticeList(); //notice리스트 메서드 호출하여 리스트 불러오기
		
	%>
	
	<div class ="container">
		<div>
			<jsp:include page ="/inc/menu.jsp"></jsp:include>
		</div>
		
		<h1>공지사항 관리</h1>
			<table class="table table-bordered table-hover table-responsive-md">
				<thead class="table-success">
					<tr>
						<th>noticeId</th>
						<th>공지 이름</th>
						<th>게시된 날짜</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<%
						for(Notice n : notice){
					%>
							<tr>
								<td>
									<a href="<%=request.getContextPath()%>/notice/noticeListOne.jsp?noticeId=<%=n.noticeId%>"><%=n.noticeId %></a>
								</td>
								<td><%=n.noticeTitle %></td>
								<td><%=n.noticeDate %></td>
								<td>
									<a href="<%=request.getContextPath()%>/notice/noticeListDeleteAction.jsp">삭제</a>
								</td>
							</tr>
					<%
						}
					%>
				</tbody>
			</table>
		<a href="<%=request.getContextPath()%>/notice/noticeListInsert.jsp">공지 추가</a>
	</div>
</body>
</html>