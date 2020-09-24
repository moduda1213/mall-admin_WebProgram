<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "vo.*" %>
<%@ page import = "dao.*" %>
<%
	if(session.getAttribute("loginAdminId") == null){
		response.sendRedirect("/mall-admin/login/login.jsp");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<title>공지 상세보기</title>
</head>
<body>
	<%
		/*
			id 요청
			noticeOne 메서드 호출
			*형식
				--------- 	메뉴
				-			번호 //입력 불가능
				-			제목
				-			내용
				-			날짜
				ㅁ			수정
		*/
		request.setCharacterEncoding("utf-8");
		
		int noticeId = Integer.parseInt(request.getParameter("noticeId")); //noticeId 요청
		System.out.println(noticeId); //디버깅
		
		Notice notice = new Notice(); //noticeDao 메서드 결과를 저장할 변수
		NoticeDao noticeDao = new NoticeDao();
		
		notice = noticeDao.selectNoticeOne(noticeId);
	%>
		<div class="container">
		<div>
			<jsp:include page = "/inc/menu.jsp"></jsp:include>
		</div>
		<form method="post" action="<%=request.getContextPath()%>/notice/noticeListInsertAction.jsp">
			<table class="table table-bordered table-hover table-responsive-md">
				<tr>
					<th class="table-success">noticeId</th>
					<td>
						<input type="text" name = "noticeId" readonly="readonly" value="<%=notice.noticeId %>">
					</td>
				</tr>
				<tr>
					<th class="table-success">noticeTitle</th>
					<td>
						<input type="text" name = "noticeTitle" value="<%=notice.noticeTitle %>">
				</tr>
				<tr>
					<th class="table-success">noticeContent</th>
					<td>
						<textarea name ="noticeContent" rows="5" cols="50"><%=notice.noticeContent %></textarea>
					</td>
				</tr>
				<tr>
					<th class="table-success">noticeDate</th>
					<td>
						<input type="text" name = "noticeDate" readonly="readonly" value="<%=notice.noticeDate %>">
					</td>
				</tr>
			</table>
			<button type="submit">수정하기</button>
		</form>
	</div>
</body>
</html>