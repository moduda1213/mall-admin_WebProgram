package dao;
import vo.*;
import java.sql.*;
import java.util.*;

public class ProductDao {
	
	public ArrayList<Product> selectProductList() throws Exception{
		ArrayList<Product> list = new ArrayList<Product>();
		
		String driver ="org.mariadb.jdbc.Driver";
		String dbaddr ="jdbc:mariadb://localhost:3306/mall";
		String dbid="root";
		String dbpw="java1004";
		String sql = "select product_id, category_id, product_name, product_price, product_content,product_soldout from product";
		Class.forName(driver);
		Connection conn = DriverManager.getConnection(dbaddr,dbid,dbpw); 
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			Product p = new Product();
			p.setProductId(rs.getInt("product_id"));
			p.setCategoryId(rs.getInt("category_id"));
			p.setProductName(rs.getString("product_name"));
			p.setProductPrice(rs.getInt("product_price"));
			p.setProductContent(rs.getString("product_content"));
			p.setProductSoldout(rs.getString("product_soldout"));
			list.add(p);
		}
		conn.close();
		return list;
	}
	
	public ArrayList<Product> pageSelectProductList(int beginRow, int rowPerPage) throws Exception{
		ArrayList<Product> list = new ArrayList<Product>();
		
		String driver ="org.mariadb.jdbc.Driver";
		String dbaddr ="jdbc:mariadb://localhost:3306/mall";
		String dbid="root";
		String dbpw="java1004";
		String sql = "select product_id, category_id, product_name, product_price, product_content,product_soldout from product limit ?,?";
		Class.forName(driver);
		Connection conn = DriverManager.getConnection(dbaddr,dbid,dbpw); 
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, beginRow);
		stmt.setInt(2, rowPerPage);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			Product p = new Product();
			p.setProductId(rs.getInt("product_id"));
			p.setCategoryId(rs.getInt("category_id"));
			p.setProductName(rs.getString("product_name"));
			p.setProductPrice(rs.getInt("product_price"));
			p.setProductContent(rs.getString("product_content"));
			p.setProductSoldout(rs.getString("product_soldout"));
			list.add(p);
		}
		conn.close();
		return list;
	}
	
	public ArrayList<Product> selectProductListByCategory(int categoryId, int beginRow, int rowPerPage) throws Exception{
		ArrayList<Product> list = new ArrayList<Product>();
		
		String driver ="org.mariadb.jdbc.Driver";
		String dbaddr ="jdbc:mariadb://localhost:3306/mall";
		String dbid="root";
		String dbpw="java1004";
		String sql = "select product_id, category_id, product_name, product_price, product_content,product_soldout from product where category_id=? limit ?,?";
		Class.forName(driver);
		Connection conn = DriverManager.getConnection(dbaddr,dbid,dbpw); 
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, categoryId);
		stmt.setInt(2, beginRow);
		stmt.setInt(3, rowPerPage);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			Product p = new Product();
			p.setProductId(rs.getInt("product_id"));
			p.setCategoryId(rs.getInt("category_id"));
			p.setProductName(rs.getString("product_name"));
			p.setProductPrice(rs.getInt("product_price"));
			p.setProductContent(rs.getString("product_content"));
			p.setProductSoldout(rs.getString("product_soldout"));
			list.add(p);
		}
		conn.close();
		return list;
	}
	//productList 추가
	public void insertProduct(Product product) throws Exception{
		String driver ="org.mariadb.jdbc.Driver";
		String dbaddr ="jdbc:mariadb://localhost:3306/mall";
		String dbid="root";
		String dbpw="java1004";
		Class.forName(driver);
		Connection conn = DriverManager.getConnection(dbaddr,dbid,dbpw);
		String sql = "insert into product(category_id,product_name,product_price, product_content,product_soldout) values(?,?,?,?,?)";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, product.getCategoryId());
		stmt.setString(2, product.getProductName());
		stmt.setInt(3, product.getProductPrice());
		stmt.setString(4, product.getProductContent());
		stmt.setString(5, product.getProductSoldout());
		stmt.executeUpdate();
		
		conn.close();
	}
	
	//productList 삭제
	public void deleteProduct(Product product) throws Exception{
		String driver ="org.mariadb.jdbc.Driver";
		String dbaddr ="jdbc:mariadb://localhost:3306/mall";
		String dbid="root";
		String dbpw="java1004";
		Class.forName(driver);
		Connection conn = DriverManager.getConnection(dbaddr,dbid,dbpw);
		String sql = "delete from product where product_id =?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, product.getProductId());
		stmt.executeUpdate();
		
		conn.close();
	}
	
	//productList 수정
	public void updateProduct(Product product) throws Exception{
		String driver ="org.mariadb.jdbc.Driver";
		String dbaddr ="jdbc:mariadb://localhost:3306/mall";
		String dbid="root";
		String dbpw="java1004";
		Class.forName(driver);
		Connection conn = DriverManager.getConnection(dbaddr,dbid,dbpw);
		String sql = "update product set category_id=?, product_name=?, product_price=?,product_content=?,product_soldout=? where product_id =?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, product.getCategoryId());
		stmt.setString(2, product.getProductName());
		stmt.setInt(3, product.getProductPrice());
		stmt.setString(4, product.getProductContent());
		stmt.setString(5, product.getProductSoldout());
		stmt.setInt(6, product.getProductId());
		stmt.executeUpdate();
		
		conn.close();
		
	}
	
	//productList 수정(강사님 version)
	public void updateProductSoldout(int productId, String productSoldout) throws Exception {
		String driver ="org.mariadb.jdbc.Driver";
		String dbaddr ="jdbc:mariadb://localhost:3306/mall";
		String dbid="root";
		String dbpw="java1004";
		Class.forName(driver);
		Connection conn = DriverManager.getConnection(dbaddr,dbid,dbpw);
		String sql = "update product set product_soldout=? where product_id =?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		if(productSoldout.equals("Y")) {
			stmt.setString(1,"N");
		}else {
			stmt.setString(1,"Y");
		}
		stmt.setInt(2, productId);
		//stmt.executeUpdate();
		//디버깅 과정
		int row = stmt.executeUpdate();
		System.out.println(row+"행 수정");
	}
	
	//product 상세보기
	public Product selectProductOne(int productId) throws Exception{
		Product product = null;
		
		String driver ="org.mariadb.jdbc.Driver";
		String dbaddr ="jdbc:mariadb://localhost:3306/mall";
		String dbid="root";
		String dbpw="java1004";
		Class.forName(driver);
		Connection conn = DriverManager.getConnection(dbaddr,dbid,dbpw);
		String sql = "select * from product where product_id=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, productId);
		ResultSet rs = stmt.executeQuery();
		
		if(rs.next()) {
			product = new Product();
			product.setProductId(rs.getInt("product_id"));
			product.setCategoryId(rs.getInt("category_id"));
			product.setProductName(rs.getString("product_name"));
			product.setProductPrice(rs.getInt("product_price"));
			product.setProductContent(rs.getString("product_content"));
			product.setProductSoldout(rs.getString("product_soldout"));
			product.setProductPic(rs.getString("product_pic"));
		}
		
		return product;
	}
	
	// 페이징
	public Page pageProductList(int currentPage) throws Exception {
		int rowPerPage = 5;
		int beginRow = (currentPage -1)*rowPerPage;
		
		String driver ="org.mariadb.jdbc.Driver";
		String dbaddr ="jdbc:mariadb://localhost:3306/mall";
		String dbid="root";
		String dbpw="java1004";
		String sql ="select count(*) from product";
		Class.forName(driver);
		Connection conn = DriverManager.getConnection(dbaddr,dbid,dbpw);
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		
		int lastPage = 0;
		int totalList = 0;
		if(rs.next()) {
			totalList = rs.getInt("count(*)");
		}
		
		if(totalList % rowPerPage != 0) {
			lastPage = (totalList / rowPerPage) + 1;
		}else {
			lastPage = totalList / rowPerPage;
		}
		
		Page page = new Page();
		page.beginRow = beginRow;
		page.lastPage = lastPage;
		page.rowPerPage = rowPerPage;
		
		return page;
	}
	
	
	
	
	
	
}
