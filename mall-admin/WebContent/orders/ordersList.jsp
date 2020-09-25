<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "vo.*" %>
<%@ page import= "dao.*" %>
<%@ page import= "java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<title>Insert title here</title>
</head>
<body>
<div class ="container">
	<div><!-- 메뉴 -->
		<jsp:include page ="/inc/menu.jsp"></jsp:include>
	</div>
	<%
		request.setCharacterEncoding("utf-8");
		
		String ordersState=""; //결제완료, 배송준비중, 배송완료, 주문취소 상태를 담을 변수
		if(request.getParameter("ordersState")!=null){
			ordersState = request.getParameter("ordersState");
		}
		
		int currentPage = 1;
		if(request.getParameter("currentPage")!=null){
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		OrdersDao ordersDao = new OrdersDao();
		Page p = new Page();
		p = ordersDao.pageSelectOrderList(currentPage);
		
		ArrayList<OrdersAndProduct> selectList = null; //리스트 불러오기 위한 변수
		ArrayList<String> stateList = null; // 주문 상태를 불러오기 위한 변수
		
		if(ordersState.equals("") || ordersState.equals("선택")){ // 리스트 불러오기
			selectList = ordersDao.selectOrdersList(p.beginRow,p.rowPerPage);
		}
		else{
			selectList = ordersDao.selectOrdersListByState(ordersState, p.beginRow, p.rowPerPage);
		}
		
		stateList = ordersDao.selectOrdersStateList();
		
		System.out.println(ordersState);
	%>
	<h1>주문 목록</h1>
	<form method ="post" action="/mall-admin/orders/ordersList.jsp">
		<select name ="ordersState">
			<option>선택</option>
			<%
				for(String s : stateList){
					if(s.equals(ordersState)){
			%>
					<option selected = "selected"><%=s %></option>
			<%
					}
			%>
					<option><%=s %></option>
			<%
				}
			%>
		</select>
		<button type = "submit">주문상태별로 보기</button>
	</form>
	<table class = "table">
		<thead>
			<tr>
				<th>orders_id</th>
				<th>product_id</th>
				<th>product_name</th>
				<th>orders_amount</th>
				<th>orders_price</th>
				<th>member_email</th>
				<th>orders_addr</th>
				<th>orders_state</th>
				<th>orders_date</th>
				<th>orders_state 수정</th>
			</tr>
		</thead>
		<tbody>
			<%
				for(OrdersAndProduct o : selectList){
			%>
			<tr>
				<td><%=o.orders.getOrdersId() %></td>
				<td><%=o.orders.getProductId() %></td>
				<td><%=o.product.getProductName() %></td> 
				<td><%=o.orders.getOrdersAmount() %></td>
				<td><%=o.orders.getOrdersPrice() %></td>
				<td><%=o.orders.getMemberEmail() %></td>
				<td><%=o.orders.getOrdersAddr() %></td>
				<td><%=o.orders.getOrdersState() %></td>
				<td><%=o.orders.getOrdersDate() %></td>
				<td><a href="/mall-admin/orders/modifyOrdersState.jsp?ordersId=<%=o.orders.getOrdersId() %>">orders_state 수정</a></td>
			</tr>
			<%
				}
			%>
		</tbody>
	</table>
	<div>
		<ul class="pagination"> <!-- 페이징 -->
			<%
				if(currentPage == 1){
			%>
					<li class="page-item disabled"><a class="page-link" href="/mall-admin/orders/ordersList.jsp?currentPage=1">처음으로</a></li>
					<li class="page-item disabled"><a class="page-link" href="/mall-admin/orders/ordersList.jsp?currentPage=<%=currentPage-1%>">이전</a></li>
					<li class="page-item"><a class="page-link" href="/mall-admin/orders/ordersList.jsp?currentPage=<%=currentPage+1%>">다음</a></li>
					<li class="page-item"><a class="page-link" href="/mall-admin/orders/ordersList.jsp?currentPage=<%=p.lastPage%>">마지막으로</a></li>
			<%
				}else if(currentPage == p.lastPage){
			%>
					<li class="page-item"><a class="page-link" href="/mall-admin/orders/ordersList.jsp?currentPage=1">처음으로</a></li>
					<li class="page-item"><a class="page-link" href="/mall-admin/orders/ordersList.jsp?currentPage=<%=currentPage-1%>">이전</a></li>
					<li class="page-item disabled"><a class="page-link" href="/mall-admin/orders/ordersList.jsp?currentPage=<%=currentPage+1%>">다음</a></li>
					<li class="page-item disabled"><a class="page-link" href="/mall-admin/orders/ordersList.jsp?currentPage=<%=p.lastPage%>">마지막으로</a></li>
			<%
				}else{
			%>
					<li class="page-item"><a class="page-link" href="/mall-admin/orders/ordersList.jsp?currentPage=1">처음으로</a></li>
					<li class="page-item"><a class="page-link" href="/mall-admin/orders/ordersList.jsp?currentPage=<%=currentPage-1%>">이전</a></li>
					<li class="page-item"><a class="page-link" href="/mall-admin/orders/ordersList.jsp?currentPage=<%=currentPage+1%>">다음</a></li>
					<li class="page-item"><a class="page-link" href="/mall-admin/orders/ordersList.jsp?currentPage=<%=p.lastPage%>">마지막으로</a></li>
			<%
				}
			%>
		</ul>
	</div>
</div>
</body>
</html>