<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "vo.*" %>
<%@ page import = "dao.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modifyOrdersState</title>
</head>
<body>
	<%
		/*
			orderId 를 가져와서 ordersState만 불러오기
			orderState는 select된 상태
		*/
		
		request.setCharacterEncoding("utf-8");
		
		int ordersId = Integer.parseInt(request.getParameter("ordersId"));
		
		OrdersAndProduct oap = new OrdersAndProduct();
		OrdersDao ordersDao = new OrdersDao();
		
		oap = ordersDao.selectOrdersOne(ordersId);
		
		ArrayList<String> stateList = null; // 주문 상태를 불러오기 위한 변수
		stateList = ordersDao.selectOrdersStateList();
		
		String state = null;
	%>
<div class ="container">
	<div><!-- 메뉴 -->
		<jsp:include page ="/inc/menu.jsp"></jsp:include>
	</div>
	<h1>주문 상태 변경</h1>
	<form method = "post" action = "/mall-admin/orders/modifyOrdersStateAction.jsp">
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
					<th></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><%=oap.orders.ordersId %></td>
					<td><%=oap.orders.productId %></td>
					<td><%=oap.product.productName %></td> 
					<td><%=oap.orders.ordersAmount %></td>
					<td><%=oap.orders.ordersPrice %></td>
					<td><%=oap.orders.memberEmail %></td>
					<td><%=oap.orders.ordersAddr %></td>
					<td>
						<select>
							<%
								for(String s : stateList){
									if(s.equals(oap.orders.ordersState)){
							%>
									<option selected="selected"><%=s %></option>
									
							<%
									state = s;
									}else{
							%>
									<option><%=s %></option>
							<%
									}
								}
							%>
						</select>
					</td>
					<td><%=oap.orders.ordersDate %></td>
					<% System.out.println(oap.orders.ordersState); %>
					<td><a href="/mall-admin/orders/modifyOrdersStateAction.jsp?ordersId=<%=oap.orders.ordersId%>&ordersState=<%=state%>">수정</a></td>
				</tr>
			</tbody>
	</table>
	</form>
</div>
</body>
</html>