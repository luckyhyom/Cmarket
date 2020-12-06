package com.cmarket.spring.member.model.vo;

import java.sql.Timestamp; 

//import java.sql.Date;

public class MemberProfile {
	   private int profile_sq;           
	   private int user_sq;  
	   private String profile_nickname;   
	   private String profile_gender;     
	   private String profile_photo;      
	   private Double profile_temperature;
	   private Timestamp profile_date;
	   
	public MemberProfile() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MemberProfile(int profile_sq, int user_sq, String profile_nickname, String profile_gender,
			String profile_photo, Double profile_temperature, Timestamp profile_date) {
		super();
		this.profile_sq = profile_sq;
		this.user_sq = user_sq;
		this.profile_nickname = profile_nickname;
		this.profile_gender = profile_gender;
		this.profile_photo = profile_photo;
		this.profile_temperature = profile_temperature;
		this.profile_date = profile_date;
	}
	public int getProfile_sq() {
		return profile_sq;
	}
	public void setProfile_sq(int profile_sq) {
		this.profile_sq = profile_sq;
	}
	public int getUser_sq() {
		return user_sq;
	}
	public void setUser_sq(int user_sq) {
		this.user_sq = user_sq;
	}
	public String getProfile_nickname() {
		return profile_nickname;
	}
	public void setProfile_nickname(String profile_nickname) {
		this.profile_nickname = profile_nickname;
	}
	public String getProfile_gender() {
		return profile_gender;
	}
	public void setProfile_gender(String profile_gender) {
		this.profile_gender = profile_gender;
	}
	public String getProfile_photo() {
		return profile_photo;
	}
	public void setProfile_photo(String profile_photo) {
		this.profile_photo = profile_photo;
	}
	public Double getProfile_temperature() {
		return profile_temperature;
	}
	public void setProfile_temperature(Double profile_temperature) {
		this.profile_temperature = profile_temperature;
	}
	public Timestamp getProfile_date() {
		return profile_date;
	}
	public void setProfile_date(Timestamp profile_date) {
		this.profile_date = profile_date;
	}
	@Override
	public String toString() {
		return "MemberProfile [profile_sq=" + profile_sq + ", user_sq=" + user_sq + ", profile_nickname="
				+ profile_nickname + ", profile_gender=" + profile_gender + ", profile_photo=" + profile_photo
				+ ", profile_temperature=" + profile_temperature + ", profile_date=" + profile_date + "]";
	}
	   
}
