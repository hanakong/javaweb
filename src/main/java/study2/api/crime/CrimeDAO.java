package study2.api.crime;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import conn.GetConn;

public class CrimeDAO {
	GetConn getConn = GetConn.getInstance();
	
	private Connection conn = getConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql = "";
	
	CrimeVO vo = null;

	public void setCrimeSaveOk(CrimeVO vo) {
		try {
			sql = "insert into crime values (default,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getYear());
			pstmt.setString(2, vo.getPolice());
			pstmt.setInt(3, vo.getRobbery());
			pstmt.setInt(4, vo.getMurder());
			pstmt.setInt(5, vo.getTheft());
			pstmt.setInt(6, vo.getViolence());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("sql오류 : " + e.getMessage());
		}finally {
			getConn.pstmtClose();
		}
		
	}
	//해당년도 자료 삭제
	public String setCrimeDeleteOk(int year) {
		String res = "0";
		try {
			sql = "delete from crime where year = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, year);
			pstmt.executeUpdate();
			res = "1";
			
		} catch (SQLException e) {
			System.out.println("sql오류 : " + e.getMessage());
		}finally {
			getConn.pstmtClose();
		}
		return res;
	}
	public String getSearchYear(int year) {
		String res = "0";
		try {
			sql = "select * from crime where year = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, year);
			rs = pstmt.executeQuery();
			if(rs.next())	res = "1";
		} catch (SQLException e) {
			System.out.println("sql오류 : " + e.getMessage());
		}finally {
			getConn.rsClose();
		}
		return res;
	}
	public void getAlignCrimeList(int year, String radioVal) {
		try {
			sql = "select * from crime where year = ? order by police ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, year);
			pstmt.setString(2, radioVal);
			rs = pstmt.executeQuery();
		} catch (SQLException e) {
			System.out.println("sql오류 : " + e.getMessage());
		}finally {
			getConn.rsClose();
		}

	}
}
