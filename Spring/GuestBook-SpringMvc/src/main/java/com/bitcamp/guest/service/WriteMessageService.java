package com.bitcamp.guest.service;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.guest.dao.MessageDao;
import com.bitcamp.guest.jdbc.ConnectionProvider;
import com.bitcamp.guest.model.Message;


@Service("writeService")
public class WriteMessageService implements GuestBookService {

	@Autowired
	private MessageDao dao;
	
	public int write(Message message) {
		
		int rCnt = 0;
		
		// 1. Connection 생성
		// 2. dao 생성
		// 3. insert 메서드 실행
		
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			
			//MessageDao dao = MessageDao.getInstance();
			
			rCnt = dao.insert(conn, message);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return rCnt;
	}

	
	
	
	
}
