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
	private String sample4_postcode;
	private String sample4_roadAddress;
	private String sample4_jibunAddress;
	private String sample4_detailAddress;
	private String user_status;
	
	public Member() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Member(int user_sq, String user_id, String user_pwd, String user_name, String email, String phone,
			String address, String sample4_postcode, String sample4_roadAddress, String sample4_jibunAddress,
			String sample4_detailAddress, String user_status) {
		super();
		this.user_sq = user_sq;
		this.user_id = user_id;
		this.user_pwd = user_pwd;
		this.user_name = user_name;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.sample4_postcode = sample4_postcode;
		this.sample4_roadAddress = sample4_roadAddress;
		this.sample4_jibunAddress = sample4_jibunAddress;
		this.sample4_detailAddress = sample4_detailAddress;
		this.user_status = user_status;
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

	public String getSample4_postcode() {
		return sample4_postcode;
	}


	public void setSample4_postcode(String sample4_postcode) {
		this.sample4_postcode = sample4_postcode;
	}


	public String getSample4_roadAddress() {
		return sample4_roadAddress;
	}


	public void setSample4_roadAddress(String sample4_roadAddress) {
		this.sample4_roadAddress = sample4_roadAddress;
	}

	public String getSample4_jibunAddress() {
		return sample4_jibunAddress;
	}

	public void setSample4_jibunAddress(String sample4_jibunAddress) {
		this.sample4_jibunAddress = sample4_jibunAddress;
	}

	public String getSample4_detailAddress() {
		return sample4_detailAddress;
	}

	public void setSample4_detailAddress(String sample4_detailAddress) {
		this.sample4_detailAddress = sample4_detailAddress;
	}

	
	public String getUser_status() {
		return user_status;
	}


	public void setUser_status(String user_status) {
		this.user_status = user_status;
	}


	@Override
	public String toString() {
		return "Member [user_sq=" + user_sq + ", user_id=" + user_id + ", user_pwd=" + user_pwd + ", user_name="
				+ user_name + ", email=" + email + ", phone=" + phone + ", address=" + address + "]";
	}
	
}
