package com.cmarket.spring.member.model.vo;

import java.sql.Date;
// 직렬화는 타시스템에 연동할때
public class Member {
	private int user_sq;
	private String user_id;
	private String user_pwd;
	private String user_name;
	private String email;
	private String phone;
	private String address;
	
	public Member() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Member(int user_sq, String user_id, String user_pwd, String user_name, String email, String phone,
			String address) {
		super();
		this.user_sq = user_sq;
		this.user_id = user_id;
		this.user_pwd = user_pwd;
		this.user_name = user_name;
		this.email = email;
		this.phone = phone;
		this.address = address;
	}

	public int getUser_sq() {
		return user_sq;
	}

	public void setUser_sq(int user_sq) {
		this.user_sq = user_sq;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_pwd() {
		return user_pwd;
	}

	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Override
	public String toString() {
		return "Member [user_sq=" + user_sq + ", user_id=" + user_id + ", user_pwd=" + user_pwd + ", user_name="
				+ user_name + ", email=" + email + ", phone=" + phone + ", address=" + address + "]";
	}
	
}
