<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "vo.*"%>
<%@ page import = "dao.*"%>
<%
	request.setCharacterEncoding("utf-8");
	String categoryName = request.getParameter("categoryName");
	
	Category category = new Category(); // 실제로 전송되는 데이터 양은 많아질 것이기 때문에 카테고리 형식으로 원하는 데이터를 잡아내기 위해
	category.CategoryName = categoryName;
	CategoryDao categoryDao = new CategoryDao();
	categoryDao.insertCategory(category);
	response.sendRedirect("/mall-admin/category/categoryList.jsp");
%>
