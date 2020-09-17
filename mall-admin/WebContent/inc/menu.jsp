<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	int log = 0;
	if(request.getParameter("log")!=null){
		log = Integer.parseInt(request.getParameter("log"));
	}
	//System.out.println(log);
	
	if(log == 0){//비로그인일 때
%>
		<ul>
			<li>
				<a href="/mall-admin/index.jsp">[홈으로]</a>
			</li>
			<li>
				<a href="/mall-admin/login/login.jsp">[상품카테고리 관리]</a>
			</li>
			<li>
				<a href="/mall-admin/login/login.jsp">[상품 관리]</a>
			</li>
		</ul>
<%
	}else{//로그인일 떄
%>
		<ul>
			<li>
				<a href="/mall-admin/index.jsp">[홈으로]</a>
			</li>
			<li>
				<a href="/mall-admin/category/categoryList.jsp">[상품카테고리 관리]</a>
			</li>
			<li>
				<a href="/mall-admin/product/productList.jsp">[상품 관리]</a>
			</li>
		</ul>
<%
	}
%>