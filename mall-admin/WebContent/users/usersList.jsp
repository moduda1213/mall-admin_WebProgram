<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "vo.*" %>
<%@ page import = "dao.*" %>
<%@ page import = "java.util.*" %>
<%
	if(session.getAttribute("loginAdminId")== null){
		response.sendRedirect("/mall-admin/login/login.jsp"); // 로그인 안되었다면 세션은 세션대로 인덱스 코드는 인덱스 대로 진행되고 있다
		return; //로그인이 안되었다면 끝낸다. 인덱스 코드가 진행되지 않게 하도록
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<title>회원 관리</title>
</head>
<body>
	<%
		/*
			현재 회원들의 정보를 리스트로 구현
			기능
			1. 탈퇴기능
			 - 회원이 회원 탈퇴하면 회원 기능 불능 + 탈퇴 대기중 출력
			 - admin은 탈퇴 대기중 상태인 회원의 사유 + 확인 기능(2~3일 부여)
			 - 회원은 탈퇴 철회 가능
		*/
		ArrayList<Users> usersList = new ArrayList<Users>();
		UsersDao usersDao = new UsersDao();
		
		usersList = usersDao.usersList(); // 회원 정보 불러오기
		
	%>
	<div class="container">
		<div>
			<jsp:include page ="/inc/menu.jsp"></jsp:include>
		</div>	
		<h1>회원관리</h1>
		<table class="table table-bordered table-hover table-responsive-md">
			<thead class="table-success">
				<tr>
					<th>회원 이름</th>
					<th>회원 아이디</th>
					<th>회원 비밀번호</th>
					<th>질문 답변</th>
					<th>회원 탈퇴</th> <!-- 만약 user_withdrawal이 T일 경우에만 표시 -->
				</tr>
			</thead>
			<tbody>
				<%
					for(Users u : usersList){
				%>
						<tr>
							<td><%=u.getUsersName() %></td>
							<td><%=u.getUsersId() %></td>
							<td><%=u.getUsersPw() %></td>
							<td><%=u.getUsersCheck() %></td>
							<td><%=u.getUsersWithdrawal() %></td>
							<%
								if(u.getUsersWithdrawal().equals("Y")){ // 탈퇴 신청한 유저 행에만 보이도록 하는 코드
							%>
									<td><a href="<%=request.getContextPath() %>/users/usersWithdrawarAction.jsp?userId=<%=u.getUsersId()%>">탈퇴 확인</a></td>
							<%
								}
								System.out.println(u.getUsersId()); // 탈퇴신청한 유저 아이디
								System.out.println(u.getUsersWithdrawal());
							%>
						</tr>
				<%
					}
				%>
			</tbody>
		</table>
	</div>
</body>
</html>