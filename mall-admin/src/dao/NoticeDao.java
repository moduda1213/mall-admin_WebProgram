package dao;
import java.util.*;
import java.sql.*;
import vo.*;
import commons.*;

public class NoticeDao {
	public ArrayList<Notice> selectNoticeList() throws Exception{ //공지사항 불러오기
		ArrayList<Notice> list = new ArrayList<Notice>();
		
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "select notice_id,notice_title,notice_date from notice order by notice_date asc";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			Notice n = new Notice();
			n.noticeId = rs.getInt("notice_id");
			n.noticeTitle = rs.getString("notice_title");
			n.noticeDate = rs.getString("notice_date");
			list.add(n);
		}
		
		conn.close();
		return list;
	}
	
	public Notice selectNoticeOne(int noticeId) throws Exception{ // 공지사항 상세보기
		Notice n = new Notice();
		
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "select notice_id,notice_title,notice_content,notice_date from notice where notice_id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1,noticeId);
		ResultSet rs = stmt.executeQuery();
		
		if(rs.next()) {
			n.noticeId = rs.getInt("notice_id");
			n.noticeTitle = rs.getString("notice_title");
			n.noticeContent = rs.getString("notice_content");
			n.noticeDate = rs.getString("notice_date");
		}
		
		conn.close();
		
		return n;
	}
	
	public void updateNotice(Notice notice) throws Exception{
		
		
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql= "update notice set notice_title=?, notice_content=? where notice_id=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		
		stmt.setString(1,notice.noticeTitle);
		stmt.setString(2,notice.noticeContent);
		stmt.setInt(3, notice.noticeId);
		
		stmt.executeUpdate();
		conn.close();
		
	}
}




















