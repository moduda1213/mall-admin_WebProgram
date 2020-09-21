<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String adminId = request.getParameter("adminId");
	String adminPw = request.getParameter("adminPw");
	
	
	String sysId = "admin";
	String sysPw = "1234";
	if(adminId.equals(sysId) && adminPw.equals(sysPw)){
		response.sendRedirect("/mall-admin/index.jsp"); //로그인 되었을 때 log = 1
	}else{
		response.sendRedirect("/mall-admin/index.jsp");
	}
%>
