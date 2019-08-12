package com.bitcamp.guest.dao;

import java.util.List;
import java.util.Map;

import com.bitcamp.guest.model.Message;

public interface MessageSessionDao {
	
	public int insert(Message message);
	
	public Message select(int messageId);
	
	public int selectCount();
	
	public List<Message> selectList(Map<String, Object> params);
	
	public int deleteMessage(int messageId);

}
