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
			n.setNoticeId(rs.getInt("notice_id"));
			n.setNoticeTitle(rs.getString("notice_title"));
			n.setNoticeDate(rs.getString("notice_date"));
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
			n.setNoticeId(rs.getInt("notice_id"));
			n.setNoticeTitle(rs.getString("notice_title"));
			n.setNoticeContent(rs.getString("notice_content"));
			n.setNoticeDate(rs.getString("notice_date"));
		}
		
		conn.close();
		
		return n;
	}
	
	public void updateNotice(Notice notice) throws Exception{
		
		
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql= "update notice set notice_title=?, notice_content=? where notice_id=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		
		stmt.setString(1,notice.getNoticeTitle());
		stmt.setString(2,notice.getNoticeContent());
		stmt.setInt(3, notice.getNoticeId());
		
		stmt.executeUpdate();
		conn.close();
		
	}
	
	public void deleteNotice(int noticeId) throws Exception{
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "delete from notice where notice_id =?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		
		stmt.setInt(1, noticeId);
		
		stmt.executeUpdate();
		
		conn.close();
	}
	
	public void insertNotice(Notice notice) throws Exception{
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "insert into notice(notice_title, notice_content, notice_date) values(?,?,now())"; //date도 추가
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1,notice.getNoticeTitle());
		stmt.setString(2, notice.getNoticeContent());
		
		stmt.executeUpdate();
		
		conn.close();
	}
}




















