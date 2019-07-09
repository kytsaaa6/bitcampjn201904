package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class JDBCPractice3 {

	public static void main(String[] args) {
		
		
		Connection conn = null;
		
		try {
			// 1. 데이터베이스 드라이버 로드
			Class.forName("com.mysql.jdbc.Driver");
			
			// 2. 데이터베이스 연결
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?serverTimezone=UTC", "bit", "bit");
			System.out.println("MYSQL에 정상적으로 연결되었습니다. ");
	
			
			// 문제 3. EMP 테이블에 서 “SCOTT” 사원의 급여(sal) 정보를 1000으로 바꾸는 프로그램을 작성해보자.
			String sqlUpdate = "update emp set sal=1000 where ename='SCOTT'";
			PreparedStatement pstmt = conn.prepareStatement(sqlUpdate);
			pstmt.executeUpdate();

			pstmt.close();		
			conn.close();
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		

	}

}
