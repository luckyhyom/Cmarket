package com.cmarket.spring.member.model.vo;

import java.sql.Date;

public class ProfileComment {

	private int comment_sq;
	private int profile_sq;
	private String com_writer;
	private String com_img;
	private String com_content;
	private Date com_date;
	
	
	public ProfileComment() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ProfileComment(int comment_sq, int profile_sq, String com_writer, String com_img, String com_content,
			Date com_date) {
		super();
		this.comment_sq = comment_sq;
		this.profile_sq = profile_sq;
		this.com_writer = com_writer;
		this.com_img = com_img;
		this.com_content = com_content;
		this.com_date = com_date;
	}

	public int getComment_sq() {
		return comment_sq;
	}

	public void setComment_sq(int comment_sq) {
		this.comment_sq = comment_sq;
	}

	public int getProfile_sq() {
		return profile_sq;
	}

	public void setProfile_sq(int profile_sq) {
		this.profile_sq = profile_sq;
	}

	public String getCom_writer() {
		return com_writer;
	}

	public void setCom_writer(String com_writer) {
		this.com_writer = com_writer;
	}

	public String getCom_img() {
		return com_img;
	}

	public void setCom_img(String com_img) {
		this.com_img = com_img;
	}

	public String getCom_content() {
		return com_content;
	}

	public void setCom_content(String com_content) {
		this.com_content = com_content;
	}

	public Date getCom_date() {
		return com_date;
	}

	public void setCom_date(Date com_date) {
		this.com_date = com_date;
	}

	@Override
	public String toString() {
		return "ProfileComment [comment_sq=" + comment_sq + ", profile_sq=" + profile_sq + ", com_writer=" + com_writer
				+ ", com_img=" + com_img + ", com_content=" + com_content + ", com_date=" + com_date + "]";
	}
	
	
}
