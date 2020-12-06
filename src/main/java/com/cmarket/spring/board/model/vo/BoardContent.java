package com.cmarket.spring.board.model.vo;

public class BoardContent {

	private int board_content_sq;
	private int board_sq;
	private String board_content;
	
	public BoardContent() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public BoardContent(int board_content_sq, int board_sq, String board_content) {
		super();
		this.board_content_sq = board_content_sq;
		this.board_sq = board_sq;
		this.board_content = board_content;
	}
	
	public int getBoard_content_sq() {
		return board_content_sq;
	}
	public void setBoard_content_sq(int board_content_sq) {
		this.board_content_sq = board_content_sq;
	}
	public int getBoard_sq() {
		return board_sq;
	}
	public void setBoard_sq(int board_sq) {
		this.board_sq = board_sq;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	
	@Override
	public String toString() {
		return "BoardContent [board_content_sq=" + board_content_sq + ", board_sq=" + board_sq + ", board_content="
				+ board_content + "]";
	}
	
	
}
