package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JDBCExample1 {

	public static void main(String[] args) {
		
		Connection conn = null ;
		
		try {
			// 1. 데이터베이스 드라이버 로드
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			// 2. 데이터베이스 연결
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "scott", "tiger");
			System.out.println("오라클 데이터베이스에 접속했습니다.");
			
			// 3. Statement 객체 생성
			
			
			// insdrt 구문
			String slqInsert = "insert into dept values (?, ?, ?)";			
			PreparedStatement pstmt = conn.prepareStatement(slqInsert);
			pstmt.setInt(1,90);
			pstmt.setString(2, "MARKETING");
			pstmt.setString(3, "JEJU");
			int resultCnt =  pstmt.executeUpdate();
			if(resultCnt>0) {
				System.out.println("정상적으로 입력되었습니다.");
				System.out.println("--------------------------------");
			}
			
			// 4. SQL 실행 : SELECT / INSERT / UPDATE / DELETE	
			
			Statement stmt = conn.createStatement();
			
			String sql1="select * from dept where dname=? order by dname";
			
			ResultSet rs = stmt.executeQuery(sql1);
			
			// 5. 결과 출력
			
			System.out.println("--------------------------------");
			
			while(rs.next()) {
				System.out.println("부서번호 : " + rs.getInt("deptno"));
				System.out.println("부서이름 : " + rs.getString(2));
				System.out.println("부서위치 : " + rs.getString(3));
				System.out.println("--------------------------------");
			}
						
			// 6. 사용 객체 CLOSE : ResultSet, Statement, Connection
			rs.close();
			stmt.close();
			pstmt.close();
			conn.close();
			
			
			
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		

	}
	
	
	
	
	
	
	
	

}
