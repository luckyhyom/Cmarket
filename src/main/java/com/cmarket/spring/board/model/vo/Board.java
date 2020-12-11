package com.cmarket.spring.board.model.vo;

import java.sql.Date;
import java.sql.Timestamp;

public class Board {
	private int board_sq;
	private String board_writer;
	private String board_category;
	private String board_title;
	private int price;
	private String board_img;
	private int board_dips_cnt;
	private int board_chat_cnt;
	private int board_views_cnt;
	private Timestamp board_date;
	private Timestamp board_update_date;
	private String board_address;
	private String nego;
	private String board_state;
	private String board_sample4_jibunAddress;
	private int profile_sq;
	
	public Board() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Board(int board_sq, String board_writer, String board_category, String board_title, int price,
			String board_img, int board_dips_cnt, int board_chat_cnt, int board_views_cnt, Timestamp board_date,
			Timestamp board_update_date, String board_address, String nego, String board_state,
			String board_sample4_jibunAddress, int profile_sq) {
		super();
		this.board_sq = board_sq;
		this.board_writer = board_writer;
		this.board_category = board_category;
		this.board_title = board_title;
		this.price = price;
		this.board_img = board_img;
		this.board_dips_cnt = board_dips_cnt;
		this.board_chat_cnt = board_chat_cnt;
		this.board_views_cnt = board_views_cnt;
		this.board_date = board_date;
		this.board_update_date = board_update_date;
		this.board_address = board_address;
		this.nego = nego;
		this.board_state = board_state;
		this.board_sample4_jibunAddress = board_sample4_jibunAddress;
		this.profile_sq = profile_sq;
	}



	public int getBoard_sq() {
		return board_sq;
	}

	public void setBoard_sq(int board_sq) {
		this.board_sq = board_sq;
	}

	public String getBoard_writer() {
		return board_writer;
	}

	public void setBoard_writer(String board_writer) {
		this.board_writer = board_writer;
	}

	public String getBoard_category() {
		return board_category;
	}

	public void setBoard_category(String board_category) {
		this.board_category = board_category;
	}

	public String getBoard_title() {
		return board_title;
	}

	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getBoard_img() {
		return board_img;
	}

	public void setBoard_img(String board_img) {
		this.board_img = board_img;
	}

	public int getBoard_dips_cnt() {
		return board_dips_cnt;
	}

	public void setBoard_dips_cnt(int board_dips_cnt) {
		this.board_dips_cnt = board_dips_cnt;
	}

	public int getBoard_chat_cnt() {
		return board_chat_cnt;
	}

	public void setBoard_chat_cnt(int board_chat_cnt) {
		this.board_chat_cnt = board_chat_cnt;
	}

	public int getBoard_views_cnt() {
		return board_views_cnt;
	}

	public void setBoard_views_cnt(int board_views_cnt) {
		this.board_views_cnt = board_views_cnt;
	}

	public Timestamp getBoard_date() {
		return board_date;
	}

	public void setBoard_date(Timestamp board_date) {
		this.board_date = board_date;
	}

	public Timestamp getBoard_update_date() {
		return board_update_date;
	}

	public void setBoard_update_date(Timestamp board_update_date) {
		this.board_update_date = board_update_date;
	}

	public String getBoard_address() {
		return board_address;
	}

	public void setBoard_address(String board_address) {
		this.board_address = board_address;
	}

	public String getNego() {
		return nego;
	}

	public void setNego(String nego) {
		this.nego = nego;
	}

	public String getBoard_state() {
		return board_state;
	}

	public void setBoard_state(String board_state) {
		this.board_state = board_state;
	}

	public String getBoard_sample4_jibunAddress() {
		return board_sample4_jibunAddress;
	}

	public void setBoard_sample4_jibunAddress(String board_sample4_jibunAddress) {
		this.board_sample4_jibunAddress = board_sample4_jibunAddress;
	}
	
	public int getProfile_sq() {
		return profile_sq;
	}

	public void setProfile_sq(int profile_sq) {
		this.profile_sq = profile_sq;
	}



	@Override
	public String toString() {
		return "Board [board_sq=" + board_sq + ", board_writer=" + board_writer + ", board_category=" + board_category
				+ ", board_title=" + board_title + ", price=" + price + ", board_img=" + board_img + ", board_dips_cnt="
				+ board_dips_cnt + ", board_chat_cnt=" + board_chat_cnt + ", board_views_cnt=" + board_views_cnt
				+ ", board_date=" + board_date + ", board_update_date=" + board_update_date + ", board_address="
				+ board_address + ", nego=" + nego + ", board_state=" + board_state + ", board_sample4_jibunAddress="
				+ board_sample4_jibunAddress + ", profile_sq=" + profile_sq + "]";
	}

	

	
}
