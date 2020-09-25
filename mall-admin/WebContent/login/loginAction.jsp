<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "vo.*" %>
<%@ page import = "dao.*" %>
<%@ page import = "java.util.*" %>
<%
	request.setCharacterEncoding("utf-8");
	
	String adminId = request.getParameter("adminId");
	String adminPw = request.getParameter("adminPw");
	
	Admin paraAdmin = new Admin(); // 로그인하기 위해 입력한 데이터 저장하는 공간
	paraAdmin.setAdminId(adminId);
	paraAdmin.setAdminPw(adminPw);
	
	AdminDao adminDao = new AdminDao();
	Admin loginAdmin = adminDao.login(paraAdmin); // 옳바른 id,pw값인지 판단 후 저장하는 공간
	
	if(loginAdmin == null){
		System.out.println("로그인 실패");
		response.sendRedirect("/mall-admin/login/login.jsp");
	}else{
		System.out.println("로그인 성공"); 
		// 로그인 정보를 session에 저장( page < request < session < application )
		session.setAttribute("loginAdminId", loginAdmin.getAdminId()); // 세션의 변수 만드는 방법
		response.sendRedirect("/mall-admin/index.jsp");
	}
%>
