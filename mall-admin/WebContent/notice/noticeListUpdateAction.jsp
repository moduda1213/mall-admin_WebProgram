<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "vo.*" %>
<%@ page import = "dao.*" %>

<%
	if(session.getAttribute("loginAdminId") == null){
		response.sendRedirect("/mall-admin/login/login.jsp");
	}

	/*
		notice id/title/content 요청하기
		Dao method 로 업데이트
		response로 List.jsp로 보내기
	*/
	
	request.setCharacterEncoding("utf-8");
	
	int noticeId = Integer.parseInt(request.getParameter("noticeId"));
	String noticeTitle = request.getParameter("noticeTitle");
	String noticeContent = request.getParameter("noticeContent");
	
	System.out.println(noticeId + " " + noticeTitle + " " + noticeContent);
	
	Notice notice = new Notice();
	notice.setNoticeId(noticeId);
	notice.setNoticeTitle(noticeTitle);
	notice.setNoticeContent(noticeContent);
	
	System.out.println(notice.getNoticeId() + " " + notice.getNoticeTitle() + " " + notice.getNoticeContent());
	
	NoticeDao noticeDao = new NoticeDao();
	noticeDao.updateNotice(notice);
	
	response.sendRedirect(request.getContextPath()+"/notice/noticeList.jsp");
%>

