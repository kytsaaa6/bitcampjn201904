package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class JDBCPractice1 {

	public static void main(String[] args) {
		
		
		Connection conn = null;
		
		try {
			// 1. 데이터베이스 드라이버 로드
			Class.forName("com.mysql.jdbc.Driver");
			
			// 2. 데이터베이스 연결
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?serverTimezone=UTC", "bit", "bit");
			System.out.println("MYSQL에 정상적으로 연결되었습니다. ");
			
			// 문제 1. EMP 테이블에 새로운 사원 정보를 입력하는 프로그램을 작성해보자.
			// insert 쿼리 문 작성
			String sqlInsert = "insert into emp value (?, ?, ?, ?, ?, ?, ?, ?)";
			// pstm 객체 생성
			PreparedStatement pstmt = conn.prepareStatement(sqlInsert);
			
			
			// 컬럼 위치, 데이터 입력
			pstmt.setInt(1, 8010);
			pstmt.setString(2, "KWON1");
			pstmt.setString(3, "Student");
			pstmt.setInt(4, 1);
			pstmt.setString(5, null);
			pstmt.setInt(6, 116);
			pstmt.setInt(7, 5);
			pstmt.setInt(8, 30);
			
			
			// DML 실행
			int resultInt = pstmt.executeUpdate();
			
			if (resultInt > 0) {
				System.out.println("정상적으로 입력되었습니다.");
			}
			
			// 연결 종료
			pstmt.close();			
			conn.close();
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		

	}

}
