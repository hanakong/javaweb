package database;
// statement 객체? resultset? connection객체? 누구나 쓰니까 전역변수로 설정하는게 좋다 // 보안상 preparedStatement를 사용한다.
/* connection JDBC를 통한 연결 statement?
 * 
 * 
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

public class LoginDAO {//3요소!
	private Connection conn = null; //sql.connection을 import해야한다. mysql사용 X // 내가 연결하는 것이 아니라 외부와 DB를 연결하는 것이기 때문에 connection객체가 필요
	private PreparedStatement pstmt = null; //sql.connection을 import해야한다. mysql사용 X
	private ResultSet rs = null; //select만 사용가능
	
	LoginVO vo = null; // vo는 로그인 체크 뿐만 아니라 다른 곳에서도 사용될 것이므로 전역변수로 선언한다.
	String sql = ""; // sql문도 마찬가지로 이곳저곳에서 사용되므로 전역변수로 선언
	
	public LoginDAO() {
		String url = "jdbc:mysql://localhost:3306/javaweb"; //나중에 취업하면~ localhost 자리에 도메인 이름을 적어주면 된다.
		String user = "root";
		String password = "1234";
		
		try {
			Class.forName("com.mysql.jdbc.Driver");//제작사에서 정해준 class name을 입력해야한다.
			conn = DriverManager.getConnection(url, user, password); // 외부에서 오는 것이기 때문에 try/catch 사용해야함
		} catch (ClassNotFoundException e) {
//			e.printStackTrace();
			System.out.println("드라이버 검색 실패");
		} catch (SQLException e) {
			System.out.println("Database 연동 실패"); //이 메세지가 나온다면 url, uesr, password가 틀렸는지 확인해봐야한다.
		} 
	}
	
	// 사용한 객체의 반납(해제)
	public void pstmtClose() {
		if(pstmt != null) { //사용 중이면 null이 뜰 수 없다 
			try {
				pstmt.close();
			} catch (SQLException e) {} // 닫는 것은 문제 생길 일이 없기 때문에 그냥 닫아도 괜찮다.
		}
	}
	
	public void rsClose() {
		if(rs != null) {
			try {
				rs.close(); // rs는 select만 가능 
				pstmt.close(); // pstmt가 rs보다 더 많은 역할을 하는 것일뿐 포함관계가 아니다 
			} catch (SQLException e) {}
		}
	}

	// LoginOk의 loginCheck 로그인 체크
	public LoginVO getLoginCheck(String mid, String pwd) {
		// vo를 만듬
		vo = new LoginVO();
		// 아이디, 비밀번호 검색 select 사용(DB)
		sql = "select * from login where mid=? and pwd=?"; //pstmt는 뭔지 모를 때 ? 사용
		try {
			pstmt = conn.prepareStatement(sql); // 이 값을 가져와서 ?를 채워주는 것 
			// 여기까지 sql에 접근완료
			pstmt.setString(1, mid); // 1 : 첫번째 물음표
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery(); //execute 많은 명령 중 2개만 외우면 됨 executeQuery(select만), executeUpdate(나머지)
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
			System.out.println("SQL 명령문 오류 : " + e.getMessage());
		} finally {
			//열었던 객체 닫기
			rsClose();
		}
		return vo; //
	}
	
	//5%%% 방문 포인트 증가시키기 //DB에 접근하는 것이므로 무조건 예외처리해야한다 //6^^^
	public void setPointPlus(String mid) { //void 리턴타입 없음
		try {
			sql = "update login set point = point + 10, lastDate=now(), todayCount = todayCount+1 where mid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.executeUpdate();
		} catch (SQLException e) {	
			System.out.println("SQL 명령문 오류 : " + e.getMessage());
		} finally {
			//열었던 객체 닫기
			pstmtClose();
		}
	}
	
	//다음날 1!!! 아이디 검색처리
	public LoginVO getMidCheck(String mid) {
		LoginVO vo = new LoginVO();
		try {
			sql = "select * from login where mid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery(); // 읽어오는 것이므로 rs로 받아?
			
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
			System.out.println("SQL 명령문 오류 : " + e.getMessage());
		} finally {
			rsClose();
		}
		return vo;
	}
	
	// 회원가입처리
	public void setJoinOk(LoginVO vo) {
		try {
			sql= "insert into login values(default,?,?,?,default,default,default)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getPwd());
			pstmt.setString(3, vo.getName());
			pstmt.executeUpdate();
		} catch (SQLException e) {	
			System.out.println("SQL 명령문 오류 : " + e.getMessage());
		} finally {
			//열었던 객체 닫기
			pstmtClose();
		}
	}

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
			
			//날짜 비교
			/*
				Date today = new Date();
	      SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	      String strToday = sdf.format(today);
	      String lastDate = vo.getLastDate();
	      if(strToday.equals(lastDate.substring(0,10))) vo.setTodayCount(0);
      */
      vo.setTodayCount(compareDate(vo.getLastDate(), vo.getTodayCount())); 
			
			vos.add(vo);
		}
	} catch (SQLException e) {	
		System.out.println("SQL 명령문 오류 : " + e.getMessage());
	} finally {
		rsClose();
	}
	return vos;
}

	//날짜비교 처리
	private int compareDate(String lastDate, int todayCount) {
		
		Date today = new Date();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    String strToday = sdf.format(today);
//    String lastDate = vo.getLastDate(); // 위에서 받아서 넘겨줬기 때문에 필요 없음
    if(!strToday.equals(lastDate.substring(0,10))) todayCount = 0;
		
    return todayCount;
	}

	//개인정보 수정하기
	public int setUpdateOk(LoginVO vo) {
		int res = 0;
		try {
			sql = "update login set pwd=?, name=? where mid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getPwd());
			pstmt.setString(2, vo.getName());
			pstmt.setString(3, vo.getMid());
			pstmt.executeUpdate();
			res =1;
		} catch (SQLException e) {	
			System.out.println("SQL 명령문 오류 : " + e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}

	public int setDeleteOk(String mid) {
		int res = 0;
		try {
			sql = "delete from login where mid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.executeUpdate();
			res=1;
		} catch (SQLException e) {	
			System.out.println("SQL 명령문 오류 : " + e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}
}