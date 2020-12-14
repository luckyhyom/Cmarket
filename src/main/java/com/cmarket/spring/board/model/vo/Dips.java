package com.cmarket.spring.board.model.vo;

public class Dips {
	
	private int board_sq;
	private int profile_sq;
	
	public Dips() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Dips(int board_sq, int profile_sq) {
		super();
		this.board_sq = board_sq;
		this.profile_sq = profile_sq;
	}

	public int getBoard_sq() {
		return board_sq;
	}

	public void setBoard_sq(int board_sq) {
		this.board_sq = board_sq;
	}

	public int getProfile_sq() {
		return profile_sq;
	}

	public void setProfile_sq(int profile_sq) {
		this.profile_sq = profile_sq;
	}

	@Override
	public String toString() {
		return "Dips [board_sq=" + board_sq + ", profile_sq=" + profile_sq + "]";
	}

	
	
	
}
