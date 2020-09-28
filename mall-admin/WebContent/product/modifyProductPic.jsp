<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modifyProductPic</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	
		int productId=Integer.parseInt(request.getParameter("productId"));
	%>
	<h1>상품 이미지 수정</h1>
	<form action="<%=request.getContextPath()%>/product/modifyProductPicAction.jsp" method="post" enctype ="multipart/form-data"> <!-- enctype -> 폼안에 내용을 action을 통해 enctype타입으로 변경되어 전송한다 --> <!-- multipart/form-data -> 파일로 보낸다 -->
		<input type ="hidden" name="productId" value="<%=productId %>">
		<div>
			이미지 선택 : 
			<input type="file" name="productPic">
		<!-- <input type="text"> : 글자도 파일타입으로 넘어간다 -->
		</div>
		<div>
			<button type="submit">이미지 수정</button>
		</div>
	</form>
</body>
</html>