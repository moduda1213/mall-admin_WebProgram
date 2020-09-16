<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "vo.*" %>
<%@ page import = "dao.*" %>
<%
	/*
		"categoryId" 
		"categoryName"
	*/
	request.setCharacterEncoding("utf-8");
	
	int categoryId = Integer.parseInt(request.getParameter("categoryId")); //수정할 이름의 번호 불러오기
	String categoryName = request.getParameter("categoryName"); // 수정할 이름 불러오기
	
	Category category = new Category();
	category.CategoryId = categoryId;
	category.CategoryName = categoryName;
	
	CategoryDao categoryDao = new CategoryDao();
	categoryDao.updateCategory(category);
	
	response.sendRedirect("/mall-admin/category/categoryList.jsp");
%>