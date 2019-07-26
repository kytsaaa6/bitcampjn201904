package membermanager.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import membermanager.model.LoginInfo;
import membermanager.model.MemberInfo;

public class MemberDao {

	
	private static MemberDao dao = new MemberDao();
	
	private MemberDao() {}
	
	public static MemberDao getInstance() {
		return dao;
	}
	
	public int insert(Connection conn, MemberInfo member) {
		
		int rCnt = 0;
		PreparedStatement pstmt = null;
		
		String sql = "INSERT INTO MEMBERINFO(mId, mPw, mName, mPhoto) VALUES (?, ?, ?, ?)";
		
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, member.getuId());
			pstmt.setString(2, member.getuPw());
			pstmt.setString(3, member.getuName());
			pstmt.setString(4, member.getuPhoto());
			
			rCnt = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		
		return rCnt;
	}
	
	
	public MemberInfo loginCheck(Connection conn, String uId, String uPw) {
		
		int rCnt = 0;
		
		PreparedStatement pstmt = null;
		
		ResultSet rs = null;
		
		MemberInfo chk = null;
		
		String sql = "SELECT MID,MPW FROM MEMBERINFO WHERE MID=? and MPW=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, uId);
			pstmt.setString(2, uPw);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				chk.setuId(rs.getString(1));
				chk.setuPw(rs.getString(2));
			}
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	
		
		return chk;
	}
	
	
	public int selectCount(Connection conn) {
		
		Statement stmt = null;
		ResultSet rs = null;
		
		int totalCnt = 0;
		
		String sql = "select count(*) from memberinfo";
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
		
			if(rs.next()); {
				totalCnt = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return totalCnt;
	}
	
	public List<MemberInfo> selectList(Connection conn, int firstRow, int memberCountPerPage) {

		List<MemberInfo> list = new ArrayList<MemberInfo>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from MemberInfo order by idx desc limit ?, ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, firstRow);
			pstmt.setInt(2, memberCountPerPage);

			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				MemberInfo msg = new MemberInfo();
				
				msg.setuPk(rs.getInt(1));
				msg.setuId(rs.getString(2));
				msg.setuPw(rs.getString(3));
				msg.setuName(rs.getString(4));
				
				list.add(msg);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
}
