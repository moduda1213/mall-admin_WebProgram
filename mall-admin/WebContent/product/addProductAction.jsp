<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="vo.*" %>
<%@ page import ="dao.*" %>
<%
	if(session.getAttribute("loginAdminId")==null){
		response.sendRedirect("/mall-admin/login/login.jsp");
	}
%>
<%
	request.setCharacterEncoding("utf-8");

	int categoryId = Integer.parseInt(request.getParameter("categoryId"));
	String productName = request.getParameter("productName");
	int productPrice = Integer.parseInt(request.getParameter("productPrice"));
	String productContent = request.getParameter("productContent");
	String productSoldout = request.getParameter("productSoldout");

	Product product = new Product();
	product.categoryId = categoryId;
	product.productName = productName;
	product.productPrice = productPrice;
	product.productContent = productContent;
	product.productSoldout = productSoldout;
	
	ProductDao productDao = new ProductDao();
	productDao.insertProduct(product);
	
	response.sendRedirect("/mall-admin/product/productList.jsp"); //<a href="">
%>