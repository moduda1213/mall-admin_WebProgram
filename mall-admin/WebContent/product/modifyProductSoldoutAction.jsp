<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "dao.*" %>
<%
	if(session.getAttribute("loginAdminId")==null){
		response.sendRedirect("/mall-admin/login/login.jsp");
	}
%>
<%
	request.setCharacterEncoding("utf-8");
	
	int productId = Integer.parseInt(request.getParameter("productId"));
	String productSoldout = request.getParameter("productSoldout");
	
	ProductDao productDao = new ProductDao();
	productDao.updateProductSoldout(productId,productSoldout);
	
	response.sendRedirect("/mall-admin/product/productOne.jsp?productId="+productId);
%>