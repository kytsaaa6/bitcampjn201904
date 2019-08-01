package com.bitcamp.mvc.domain;

public class OrderItem {

	
	private String itemId;
	private String number;
	private String remark;
	
	
	public String getItemId() {
		return itemId;
	}
	public String getNumber() {
		return number;
	}
	public String getRemark() {
		return remark;
	}
	
	@Override
	public String toString() {
		return "OrderItem [itemId=" + itemId + ", number=" + number + ", remark=" + remark + "]";
	}
	
	
	
}
