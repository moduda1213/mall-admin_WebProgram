<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	session.invalidate(); // 지금 존재하는 세션 삭제 -> 새 세션을 만드는 코드
	response.sendRedirect("/mall-admin/login/login.jsp");
%>