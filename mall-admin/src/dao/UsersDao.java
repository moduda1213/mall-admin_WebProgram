package dao;
import vo.*;
import commons.*;
import java.sql.*;
import java.util.*;

public class UsersDao {
	public ArrayList<Users> usersList() throws Exception{ // 모든 회원 리스트 출력 
		ArrayList<Users> list = new ArrayList<Users>(); 
		
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "select user_id, user_pw, user_check,user_name,user_withdrawal from user";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			Users u = new Users();
			u.setUsersId(rs.getString("user_id"));
			u.setUsersPw(rs.getString("user_pw"));
			u.setUsersCheck(rs.getString("user_check"));
			u.setUsersName(rs.getString("user_name"));
			u.setUsersWithdrawal(rs.getString("user_withdrawal"));
			list.add(u);
		}
		
		conn.close();
		return list;
	}
	
	public void usersWithdrawar(String userId) throws Exception{
		
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql = "delete from user where user_Id=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, userId);
		
		stmt.executeUpdate();
		
		conn.close();
	}
	
}
