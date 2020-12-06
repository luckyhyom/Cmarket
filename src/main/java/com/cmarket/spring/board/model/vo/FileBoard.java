package com.cmarket.spring.board.model.vo;

public class FileBoard {
	
	private int file_sq;
	private int board_content_sq;
	private String file_name;
	private String file_org_name;
	private int file_size;
	
	public FileBoard() {
		super();
		// TODO Auto-generated constructor stub
	}

	public FileBoard(int file_sq, int board_content_sq, String file_name, String file_org_name, int file_size) {
		super();
		this.file_sq = file_sq;
		this.board_content_sq = board_content_sq;
		this.file_name = file_name;
		this.file_org_name = file_org_name;
		this.file_size = file_size;
	}

	public int getFile_sq() {
		return file_sq;
	}

	public void setFile_sq(int file_sq) {
		this.file_sq = file_sq;
	}

	public int getBoard_content_sq() {
		return board_content_sq;
	}

	public void setBoard_content_sq(int board_content_sq) {
		this.board_content_sq = board_content_sq;
	}

	public String getFile_name() {
		return file_name;
	}

	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}

	public String getFile_org_name() {
		return file_org_name;
	}

	public void setFile_org_name(String file_org_name) {
		this.file_org_name = file_org_name;
	}

	public int getFile_size() {
		return file_size;
	}

	public void setFile_size(int file_size) {
		this.file_size = file_size;
	}

	@Override
	public String toString() {
		return "FileBoard [file_sq=" + file_sq + ", board_content_sq=" + board_content_sq + ", file_name=" + file_name
				+ ", file_org_name=" + file_org_name + ", file_size=" + file_size + "]";
	}
	

}
