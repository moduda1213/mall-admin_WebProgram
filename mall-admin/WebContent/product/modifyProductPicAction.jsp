<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%
	/*
		1. 이미지 상품 id와 이미지 파일을 받는다.
		2. 이미지 파일을 서버 / image폴더에 새로운 이름으로 저장한다.
		3. 저장된 이미지의 이름을 상품table에서 수정한다. ex) default.jsp -> 새로 생성된 이름으로 변경
	
	
		request.setCharacterEncoding("utf-8");
		
		<form enctype ="multipart/form-data"> 방식은 기존방식 사용 불가
				
		String productId = request.getParameter("productId");
		String productPic = request.getParameter("productPic");
		System.out.println(productId + "<--productId"); // null -> 이미지타입의 enctype으로 넘어왔기 때문에
		System.out.println(productPic +"<--productPic"); // null
		
		// cos.jar 외부라이브러리 사용(내부 라이브러리 사용도 가능하지만 사용방법이 복잡)
	*/
	
	//DefaultFileRenamePolicy dfp = new DefaultFileRenamePolicy(); // 파일 이름을 만들어주는 객체
	int size=1024*1024*100; //100MB
	// 주소/위치가 바뀔수 있기 때문에 이 파일의 위치를 찾아달라는 코드
	String path = application.getRealPath("image");
	// (request, 경로, 크기, 인코딩, new DefaultFileRenamePolicy())
	System.out.println(path +"<--path");
	MultipartRequest multi = new MultipartRequest(request, path, size, "utf-8", new DefaultFileRenamePolicy());
	
	
	int productId = Integer.parseInt(multi.getParameter("productId"));
	System.out.println(productId + "<--productId");
	//System.out.println(multi.getOriginalFileName("productPic"+"<--파일 원본이름"));
	
	String productPic = multi.getFilesystemName("productPic");
	System.out.println(multi.getFilesystemName("productPic") +"<--새로 생성된 파일 이름");
	
	Product product = new Product();
	product.setProductId(productId);
	product.setProductPic(productPic);
	System.out.println(product.getProductPic()+"<--product.getProductPic()");
	System.out.println(product.getProductId()+"<--product.getProductId()");
	
	ProductDao productDao = new ProductDao();
	productDao.updateProductPic(product);
	
	response.sendRedirect("/mall-admin/product/productOne.jsp?productId="+product.getProductId());
%>
