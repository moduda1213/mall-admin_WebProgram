<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "dao.*" %>
<%
	if(session.getAttribute("loginAdminId") == null){
		response.sendRedirect("/mall-admin/login/login.jsp");
	}

	request.setCharacterEncoding("utf-8");
	
	int noticeId = Integer.parseInt(request.getParameter("noticeId"));
	
	NoticeDao noticeDao = new NoticeDao();
	noticeDao.deleteNotice(noticeId);
	
	response.sendRedirect(request.getContextPath()+"/notice/noticeList.jsp");
%>