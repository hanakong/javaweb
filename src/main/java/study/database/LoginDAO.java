package study.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

public class LoginDAO {
	private Connection conn = null;
//자바 프로그램과 데이터베이스를 네트워크 상에서 연결해주는 메소드
	private PreparedStatement pstmt = null;
//connection이 자바와 데이터베이스를 연결하는 역할을 한다면 
//statement 객체는 SQL문을 데이터베이스로 전달하고
//DB에서 처리된 결과를 다시 자바 프로그램쪽으로 전달하는 역할을 한다.
//즉 서로에게 데이터를 전달해주는 역할을 한다.

//SQL문을 실행하기 위해 일반적으로 사용되는 메소드는 2개가 있는데
//executeQuery()와 executeUpdate()가 그 2가지다
//두 메소드 모두 SQL을 실행하지만 메소드를 실행한 후 반환하는 값이 다르다.
//executeQuery()는 Resultset을 반환, executeUpdate()는 int값을 반환한다.

//executeUpdate는 update, delete, insert 후 수정된 레코드의 수를 반환한다.
//executeQuery는 select한 결과값을 가지고있는 객체이다.
//** statement 객체와 preparedStatement 객체가 다른점은 후자는 SQL문을 작성할 때 ? 기호와 함께 작성할 수 있다는 점	
	private ResultSet rs = null;
//afterLast()와 beforFirst()라는 메소드를 가진다.
//전자는 커서를 끝 빈행으로 이동, 후자는 커서를 시작 빈행으로 이동시킨다.
//resultSet은 select한 결과 레코드가 있든 없든 시작과 끝에 빈행을 가진다.	
	String sql = "";
	
	private LoginVO vo = null;
	
	public LoginDAO() {
		String url = "jdbc:mysql://localhost:3306/javaweb";
		String user = "root";
		String password = "1234";
		
		try {
			Class.forName("com.mysql.jdbc.Driver"); //제작사에서 정해준 class name을 입력해야한다.
			conn = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 검색 실패~~~");
		} catch (SQLException e) {
			System.out.println("Database 연동 실패~~~");
		//이 메세지가 나온다면 url, uesr, password가 틀렸는지 확인해봐야한다.
		}
	}
	
	// 사용한 객체의 반납(해제)
	public void pstmtClose() {
		if(pstmt != null) { //사용 중이면 null이 뜰 수 없다 
			try {
				pstmt.close();
			} catch (SQLException e) {}
			// 닫는 것은 문제 생길 일이 없기 때문에 그냥 닫아도 괜찮다.
		}
	}
	
	public void rsClose() {
		if(rs != null) {
			try {
				rs.close();
				pstmtClose(); // pstmt가 rs보다 더 많은 역할을 하는 것일뿐 포함관계가 아니다
			} catch (SQLException e) {}
		}
	}

	// 로그인 체크
	public LoginVO getLoginCheck(String mid, String pwd) {
		vo = new LoginVO();
		
		try {// 아이디, 비밀번호 검색 select 사용(DB)
			sql = "select * from login where mid=? and pwd=?";
			pstmt = conn.prepareStatement(sql);
			// 이 값을 가져와서 ?를 채워주는 것
			// 여기까지 sql에 접근완료
			pstmt.setString(1, mid); // 1 : 첫번째 물음표
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();
			//여기까지가 데이터베이스에 있는 자료를 읽어온 것
			if(rs.next()) {
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setPwd(rs.getString("pwd"));
				vo.setName(rs.getString("name"));
				vo.setPoint(rs.getInt("point"));
				vo.setLastDate(rs.getString("lastDate"));
				vo.setTodayCount(rs.getInt("todayCount"));
			}
		//여기까지 vo에 데이터를 담았다
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
		//열었던 객체 닫기
			rsClose();
		}
		return vo;
	}

//5%%% 방문 포인트 증가시키기 //DB에 접근하는 것이므로 무조건 예외처리해야한다 //6^^^
	public void setPointPlus(String mid, int point, int todayCount) {
		try {
			sql = "update login set point=?, todayCount=?, lastDate=now() where mid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, point);
			pstmt.setInt(2, todayCount);
			pstmt.setString(3, mid);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			pstmtClose();
		}
		
	}

// 다음날 1!!! 아이디 검색처리
	public LoginVO getMidCheck(String mid) {
		LoginVO vo = new LoginVO();
		try {
			sql = "select * from login where mid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			
			if(rs.next()) { //true = 자료가 있다 => 아이디가 중복되었다.
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setPwd(rs.getString("pwd"));
				vo.setName(rs.getString("name"));
				vo.setPoint(rs.getInt("point"));
				vo.setLastDate(rs.getString("lastDate"));
				vo.setTodayCount(rs.getInt("todayCount"));
				
				vo.setTodayCount(compareDate(vo.getLastDate(), vo.getTodayCount()));
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			rsClose();
		}
		return vo;
	}

	// 회원가입처리
	public void setJoinOk(LoginVO vo) {
		try {
			sql = "insert into login values (default,?,?,?,default,default,default)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getPwd());
			pstmt.setString(3, vo.getName());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			pstmtClose();
		}
	}

	// 전체회원조회
	public ArrayList<LoginVO> getLoginList() {
		ArrayList<LoginVO> vos = new ArrayList<>();
		try {
			sql = "select * from login order by idx desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo = new LoginVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setPwd(rs.getString("pwd"));
				vo.setName(rs.getString("name"));
				vo.setPoint(rs.getInt("point"));
				vo.setLastDate(rs.getString("lastDate"));
				vo.setTodayCount(rs.getInt("todayCount"));

				// 날짜 비교
				/*
				Date today = new Date();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				String strToday = sdf.format(today);
				String lastDate = vo.getLastDate();
				if(!strToday.equals(lastDate.substring(0,10))) vo.setTodayCount(0);
				*/
				vo.setTodayCount(compareDate(vo.getLastDate(), vo.getTodayCount()));
				
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			rsClose();
		}
		
		return vos;
	}

	// 날짜비교처리 메소드
	private int compareDate(String lastDate, int todayCount) {
		Date today = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String strToday = sdf.format(today);
		//String lastDate = vo.getLastDate();
		// 위에서 받아서 넘겨줬기 때문에 필요 없음
		if(!strToday.equals(lastDate.substring(0,10))) todayCount = 0;
		
		return todayCount;
	}

	// 개인정보 수정하기
	public int setUpdateOk(LoginVO vo) {
		int res = 0;
		try {
			sql = "update login set pwd=?, name=? where mid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getPwd());
			pstmt.setString(2, vo.getName());
			pstmt.setString(3, vo.getMid());
			pstmt.executeUpdate();
			res = 1;
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}

	// 회원 탈퇴처리
	public int setDeleteOk(String mid) {
		int res = 0;
		try {
			sql = "delete from login where mid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.executeUpdate();
			res = 1;
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}
	
}
