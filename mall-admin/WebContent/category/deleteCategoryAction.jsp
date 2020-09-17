<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "vo.*" %>
<%@ page import = "dao.*" %>

<%
	request.setCharacterEncoding("utf-8");
	
	int categoryId = Integer.parseInt(request.getParameter("categoryId"));
	System.out.println(categoryId);
	
	Category category = new Category();
	category.CategoryId = categoryId;
	
	CategoryDao categoryDao = new CategoryDao();
	categoryDao.deleteCategory(category);
	
	response.sendRedirect("/mall-admin/category/categoryList.jsp");
%>
