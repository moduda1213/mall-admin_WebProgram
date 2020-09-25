package dao; //함수가 있는 메서드
import java.util.ArrayList;

import commons.DBUtil;
import vo.*;
import commons.*;
import java.sql.*;

public class CategoryDao { 
	 //Category 목록
	public ArrayList<Category> selectCategoryList() throws Exception{
		ArrayList<Category> list = new ArrayList<Category>();
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql = "select category_id, category_name from category";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			Category category = new Category();
			category.setCategoryId(rs.getInt("category_id"));
			category.setCategoryName(rs.getString("category_name"));
			list.add(category);
		}
		conn.close();
		return list;
	}
	
	public ArrayList<Category> intSelectCategoryList(int beginRow, int rowPerPage) throws Exception{
		ArrayList<Category> list = new ArrayList<Category>();
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql = "select category_id, category_name from category limit ?,?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, beginRow);
		stmt.setInt(2, rowPerPage);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			Category category = new Category();
			category.setCategoryId(rs.getInt("category_id"));
			category.setCategoryName(rs.getString("category_name"));
			list.add(category);
		}
		conn.close();
		return list;
	}
	
	//Category 추가 (sql auto increase사용하면 2번 삭제하고 추가하면 3번으로 저장되는 문제가 생김)
	public void insertCategory(Category category) throws Exception{
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql = "insert into category(category_name) values(?)";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, category.getCategoryName());
		stmt.executeUpdate();
		conn.close();
	}
	
	//category 삭제
	public void deleteCategory(Category category) throws Exception{
		String driver ="org.mariadb.jdbc.Driver";
		String dbaddr ="jdbc:mariadb://localhost:3306/mall";
		String dbid="root";
		String dbpw="java1004";
		String sql = "DELETE FROM category WHERE category_id = ?";
		Class.forName(driver);
		Connection conn = DriverManager.getConnection(dbaddr,dbid,dbpw); 
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1,category.getCategoryId());
		stmt.executeUpdate();
		conn.close();
	}
	
	//category 수정
	public void updateCategory(Category category) throws Exception{
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "update category set category_name=? where category_id=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, category.getCategoryName());
		stmt.setInt(2, category.getCategoryId());
		stmt.executeUpdate();
		conn.close();
	}
	// p에는 begin, last, rowPer 요소가 있다
	public Page createPage(int currentPage) throws Exception{
		
		int rowPerPage = 5;
		int beginRow = (currentPage - 1)*rowPerPage;
		
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "select count(*) from category";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		conn.close();
		
		int totalList = 0;
		int lastPage = 0;
		Page p = new Page();
		
		if(rs.next()) {
			totalList=rs.getInt("count(*)");
		}
		if(totalList % rowPerPage != 0){
			lastPage = (totalList / rowPerPage)+1; 
		}else{
			lastPage = (totalList / rowPerPage); 
		}
		p.beginRow = beginRow;
		p.lastPage = lastPage;
		p.rowPerPage = rowPerPage;
		 // beginRow와 lastPage만 가지고 나가면 된다
		return p;
	}
}
