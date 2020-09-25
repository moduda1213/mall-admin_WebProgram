package dao;
import vo.*;
import java.sql.*;

public class AdminDao {
	public Admin login(Admin admin) throws Exception {
		Admin returnAdmin = null;//���̵� ��� ��ġ�ϴ��� �Ǵ� -> �α��� ���� : null / �α��� ���� : �Է��� ������
		
		String driver ="org.mariadb.jdbc.Driver";
		String dbaddr ="jdbc:mariadb://localhost:3306/mall";
		String dbid="root";
		String dbpw="java1004";
		String sql = "SELECT admin_id FROM admin where admin_id=? and admin_pw=?";
		Class.forName(driver);
		Connection conn = DriverManager.getConnection(dbaddr,dbid,dbpw);
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, admin.getAdminId());
		stmt.setString(2, admin.getAdminPw());
		ResultSet rs = stmt.executeQuery();
		
		if(rs.next()) {
			returnAdmin = new Admin();
			returnAdmin.setAdminId(rs.getString("admin_id"));
		}
		
		return returnAdmin; // null�̸� �α��� ����, null�� �ƴϸ� �α��� ����
	}
}
