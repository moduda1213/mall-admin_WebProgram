package dao;
import vo.*;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class OrdersDao {
	
	//paging ó���ϱ� ���� �޼���
	public Page pageSelectOrderList(int currentPage) throws Exception{
		int rowPerPage = 5; // �� �������� ������ ����Ʈ ��
		int beginRow = (currentPage-1)*rowPerPage; // �� ���������� 5���� ������ ����Ʈ  
		
		String driver ="org.mariadb.jdbc.Driver";
		String dbaddr ="jdbc:mariadb://localhost:3306/mall";
		String dbid="root";
		String dbpw="java1004";
		String sql = "SELECT count(*) FROM orders";
		Class.forName(driver);
		Connection conn = DriverManager.getConnection(dbaddr,dbid,dbpw);
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		
		int totalList = 0; // ���̺��� ��ü ����Ʈ �׸� ��
		int lastPage = 0; // ������ ������ -> [����������] ��ư ����ϱ� ����
		
		if(rs.next()) {
			totalList = rs.getInt("count(*)");
		}
		
		if(totalList % rowPerPage != 0) {
			lastPage = (totalList / rowPerPage) +1;
		}else {
			lastPage = totalList / rowPerPage;
		}
		
		Page p = new Page();
		
		p.beginRow = beginRow;
		p.lastPage = lastPage;
		p.rowPerPage = rowPerPage;
		
		return p;
	}
	
	//option ���� ����ϱ� ����
	public ArrayList<String> selectOrdersStateList() throws Exception{
		ArrayList<String> list = new ArrayList<String>();
		
		String driver ="org.mariadb.jdbc.Driver";
		String dbaddr ="jdbc:mariadb://localhost:3306/mall";
		String dbid="root";
		String dbpw="java1004";
		String sql = "SELECT DISTINCT orders_state FROM orders";
		Class.forName(driver);
		Connection conn = DriverManager.getConnection(dbaddr,dbid,dbpw);
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			String ordersState = rs.getString("orders_state"); 
			list.add(ordersState);
		}
		
		conn.close();
		return list;
	}
	
	//ordersList ���
	public ArrayList<OrdersAndProduct> selectOrdersList(int beginRow, int rowPerPage) throws Exception{
		ArrayList<OrdersAndProduct> list = new ArrayList<OrdersAndProduct>();
		
		String driver ="org.mariadb.jdbc.Driver";
		String dbaddr ="jdbc:mariadb://localhost:3306/mall";
		String dbid="root";
		String dbpw="java1004";
		/*
		 * select o.orders_id, o.product_id, o.orders_amount, o.orders_price, o.member_email, o.orders_addr, o.orders_state, o.orders_date, p.product_name
		 * from orders o inner join product p
		 * on o.product_id = p.product_id
		 * */
		String sql = "select o.orders_id, o.product_id, o.orders_amount, o.orders_price, o.member_email, o.orders_addr, o.orders_state, o.orders_date, p.product_name from orders o inner join product p on o.product_id = p.product_id limit ?,?";
		Class.forName(driver);
		Connection conn = DriverManager.getConnection(dbaddr,dbid,dbpw);
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, beginRow);
		stmt.setInt(2, rowPerPage);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			OrdersAndProduct ordersAndProduct = new OrdersAndProduct();
			ordersAndProduct.orders = new Orders();
			ordersAndProduct.product = new Product();
			
			ordersAndProduct.orders.setOrdersId(rs.getInt("orders_id"));
			ordersAndProduct.orders.setProductId(rs.getInt("product_id"));
			ordersAndProduct.orders.setOrdersAmount(rs.getInt("orders_amount"));
			ordersAndProduct.orders.setOrdersPrice(rs.getInt("orders_price"));
			ordersAndProduct.orders.setMemberEmail(rs.getString("member_email"));
			ordersAndProduct.orders.setOrdersAddr(rs.getString("orders_addr"));
			ordersAndProduct.orders.setOrdersState(rs.getString("orders_state"));
			ordersAndProduct.orders.setOrdersDate(rs.getString("orders_date"));
			ordersAndProduct.product.setProductName(rs.getString("product_name"));
			list.add(ordersAndProduct);
		}
		conn.close();
		
		return list;
	}
	
	//���⿡ ���� ordersList ���
	public ArrayList<OrdersAndProduct> selectOrdersListByState(String ordersState, int beginRow, int rowPerPage) throws Exception{
		ArrayList<OrdersAndProduct> list = new ArrayList<OrdersAndProduct>();
		
		String driver ="org.mariadb.jdbc.Driver";
		String dbaddr ="jdbc:mariadb://localhost:3306/mall";
		String dbid="root";
		String dbpw="java1004";
		String sql = "select o.orders_id, o.product_id, o.orders_amount, o.orders_price, o.member_email, o.orders_addr, o.orders_state, o.orders_date, p.product_name from orders o inner join product p on o.product_id = p.product_id where orders_state=? limit ?,?";
		Class.forName(driver);
		Connection conn = DriverManager.getConnection(dbaddr,dbid,dbpw);
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, ordersState);
		stmt.setInt(2, beginRow);
		stmt.setInt(3, rowPerPage);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			OrdersAndProduct ordersAndProduct = new OrdersAndProduct();
			ordersAndProduct.orders = new Orders();
			ordersAndProduct.product = new Product();

			ordersAndProduct.orders.setOrdersId(rs.getInt("orders_id"));
			ordersAndProduct.orders.setProductId(rs.getInt("product_id"));
			ordersAndProduct.orders.setOrdersAmount(rs.getInt("orders_amount"));
			ordersAndProduct.orders.setOrdersPrice(rs.getInt("orders_price"));
			ordersAndProduct.orders.setMemberEmail(rs.getString("member_email"));
			ordersAndProduct.orders.setOrdersAddr(rs.getString("orders_addr"));
			ordersAndProduct.orders.setOrdersState(rs.getString("orders_state"));
			ordersAndProduct.orders.setOrdersDate(rs.getString("orders_date"));
			ordersAndProduct.product.setProductName(rs.getString("product_name"));
			
			list.add(ordersAndProduct);
		}
		return list;
	}
	
	// ����Ʈ�� �׸� ���� ->  modifyOrdersStateAction.jsp
	public void updateOrdersState(OrdersAndProduct ordersAndProduct) throws Exception{
		String driver ="org.mariadb.jdbc.Driver";
		String dbaddr ="jdbc:mariadb://localhost:3306/mall";
		String dbid="root";
		String dbpw="java1004";
		String sql ="update orders set orders_state =? where orders_id=?";
		Class.forName(driver);
		Connection conn = DriverManager.getConnection(dbaddr,dbid,dbpw);
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, ordersAndProduct.orders.getOrdersState());
		stmt.setInt(2, ordersAndProduct.orders.getOrdersId());

		stmt.executeUpdate();
		
		conn.close();
	}
	
	 // orders_state �����ϱ� ���� ��µǴ� �޼ҵ� -> modifyOrdersState.jsp
	 public OrdersAndProduct selectOrdersOne(int ordersId) throws Exception{
		 	OrdersAndProduct ordersAndProduct = new OrdersAndProduct();
		 
			String driver ="org.mariadb.jdbc.Driver";
			String dbaddr ="jdbc:mariadb://localhost:3306/mall";
			String dbid="root";
			String dbpw="java1004";
			/*
			 * select o.orders_id, o.product_id, o.orders_amount, o.orders_price, o.member_email, o.orders_addr, o.orders_state, o.orders_date, p.product_name
			 * from orders o inner join product p
			 * on o.product_id = p.product_id
			 * */
			String sql = "select o.orders_id, o.product_id, o.orders_amount, o.orders_price, o.member_email, o.orders_addr, o.orders_state, o.orders_date, p.product_name from orders o inner join product p on o.product_id = p.product_id where orders_id =?";
			Class.forName(driver);
			Connection conn = DriverManager.getConnection(dbaddr,dbid,dbpw);
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, ordersId);
			ResultSet rs = stmt.executeQuery();
			
			if(rs.next()) {
				
				ordersAndProduct.orders = new Orders();
				ordersAndProduct.product = new Product();
				
				ordersAndProduct.orders.setOrdersId(rs.getInt("orders_id"));
				ordersAndProduct.orders.setProductId(rs.getInt("product_id"));
				ordersAndProduct.orders.setOrdersAmount(rs.getInt("orders_amount"));
				ordersAndProduct.orders.setOrdersPrice(rs.getInt("orders_price"));
				ordersAndProduct.orders.setMemberEmail(rs.getString("member_email"));
				ordersAndProduct.orders.setOrdersAddr(rs.getString("orders_addr"));
				ordersAndProduct.orders.setOrdersState(rs.getString("orders_state"));
				ordersAndProduct.orders.setOrdersDate(rs.getString("orders_date"));
				ordersAndProduct.product.setProductName(rs.getString("product_name"));
			}
			conn.close();
			
			return ordersAndProduct;
		}
}
