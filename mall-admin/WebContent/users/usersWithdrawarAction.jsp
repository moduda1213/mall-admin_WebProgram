<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "dao.*" %>
<%
	request.setCharacterEncoding("utf-8");
	
	String userId = request.getParameter("userId");
	
	UsersDao usersDao = new UsersDao();
	usersDao.usersWithdrawar(userId);
	
	response.sendRedirect(request.getContextPath()+"/users/usersList.jsp");
%>
