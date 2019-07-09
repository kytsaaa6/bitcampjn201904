package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class JDBCPractice4 {

	public static void main(String[] args) {
		
		
		Connection conn = null;
		
		try {
			// 1. 데이터베이스 드라이버 로드
			Class.forName("com.mysql.jdbc.Driver");
			
			// 2. 데이터베이스 연결
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?serverTimezone=UTC", "bit", "bit");
			System.out.println("MYSQL에 정상적으로 연결되었습니다. ");
			
			// 문제 4. EMP 테이블에 서 “SCOTT” 이름으로 검색한 결과를 출력하는 프로그램을 작성해보자.
			String sqlSelect = "select * from emp where ename = 'SCOTT'";
			PreparedStatement pstmt = conn.prepareStatement(sqlSelect);
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next()) {
				System.out.println("SCOTT 사원의 정보 안내드립니다.");
				System.out.println("사원번호		: " + rs.getInt(1));
				System.out.println("사원이름		: " + rs.getString(2));
				System.out.println("직업 		: " + rs.getString(3));
				System.out.println("매니저번호 	: " + rs.getInt(4));
				System.out.println("입사시기 		: " + rs.getString(5));
				System.out.println("연봉 		: " + rs.getInt(6));
				System.out.println("성과금		: " + rs.getInt(7));
				System.out.println("부서번호		: " + rs.getInt(8));
				System.out.println("--------------------------------------------");

			}
			
			rs.close();
			pstmt.close();		
			conn.close();
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		

	}

}
