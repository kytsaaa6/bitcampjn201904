package guestbook.service;

import java.sql.Connection;
import java.sql.SQLException;

import gdbc.ConnectionProvider;
import guestbook.dao.MessageDao;
import guestbook.model.Message;

public class WriteMessageService {

	// 만들어진 인스턴스 값을 외부에서 바꾸지 못하도록 private
	private static WriteMessageService service = new WriteMessageService();
	
	// getInstance 클래스 메서드를 통해 service 인스턴스 하나만 받을 수 있음
	public static WriteMessageService getInstance() {
		return service;
	}
	
	// 생성자 제한
	private WriteMessageService() {}
	
	
	
	public int write(Message message) {
		
		int rCnt = 0;
		
		// 1. Connection 생성
		// 2. dao 생성
		// 3. insert 메서드 실행
		
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			
			MessageDao dao = MessageDao.getInstance();
			
			rCnt = dao.insert(conn, message);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return rCnt;
	}
	
	
	
}
