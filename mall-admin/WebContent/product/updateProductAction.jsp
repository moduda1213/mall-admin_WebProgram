<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "vo.*" %>
<%@ page import = "dao.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.sql.*" %>
<%
	if(session.getAttribute("loginAdminId")==null){
		response.sendRedirect("/mall-admin/login/login.jsp");
	}
%>
<%
	request.setCharacterEncoding("utf-8");
	
	int productId = Integer.parseInt(request.getParameter("productId"));
	int categoryId = Integer.parseInt(request.getParameter("categoryId"));
	String productName = request.getParameter("productName");
	int productPrice = Integer.parseInt(request.getParameter("productPrice"));
	String productContent = request.getParameter("productContent");
	String productSoldout = request.getParameter("productSoldout");

	Product product = new Product();
	product.productId = productId;
	product.categoryId = categoryId;
	product.productName = productName;
	product.productPrice = productPrice;
	product.productContent = productContent;
	product.productSoldout = productSoldout;
	
	ProductDao productDao = new ProductDao();
	productDao.updateProduct(product);
	
	response.sendRedirect("/mall-admin/product/productList.jsp");
%>