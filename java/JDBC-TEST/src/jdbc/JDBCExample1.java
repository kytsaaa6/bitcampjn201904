package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.mysql.cj.xdevapi.PreparableStatement;

public class JDBCExample1 {

	public static void main(String[] args) {
		
		Connection conn = null;
		
		try {
			// 1. 데이터베이스 드라이버 로드
			Class.forName("com.mysql.jdbc.Driver");
			
			// 2. 데이터베이스 연결
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?serverTimezone=UTC","bit","bit");
			System.out.println("MYSQL 데이터베이스에 접속하였습니다.");
			
			// 3. Statement 객체 생성
			Statement stmt = conn.createStatement();
			
			// insert 구문
			String sqlInsert = "insert into dept values (?, ?, ?)";
			PreparedStatement pstmt = conn.prepareStatement(sqlInsert);
			pstmt.setInt(1, 90);
			pstmt.setString(2, "MARKETING");
			pstmt.setString(3, "JEJU");
			int resultCnt = pstmt.executeUpdate();
			if(resultCnt>0) {
				System.out.println("정상적으로 입력되었습니다.");
				System.out.println("----------------------------------------");
			}
			
			// 4. SQL 실행 : SELECT / INSERT / UPDATE / DELETE
			String sql1="select * from dept order by deptno";
			
			ResultSet rs = stmt.executeQuery(sql1);
			
			// 5. 결과 출력
			System.out.println("--------------------------------------------");
			
			while(rs.next()) {
				System.out.println("부서번호 : " + rs.getInt("deptno"));
				System.out.println("부서이름 : " + rs.getString(2));
				System.out.println("부서위치 : " + rs.getString(3));
				System.out.println("--------------------------------------------");
			}
			
			// 6. 사용 객체 CLOSE : ResultSet, Statement, Connection
			rs.close();
			stmt.close();
			pstmt.close();
			conn.close();
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

}
