package com.cmarket.spring.board.model.vo;

public class Category {
	
	private int cate_sq;
	private String cate_name;
	
	public Category() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Category(int cate_sq, String cate_name) {
		super();
		this.cate_sq = cate_sq;
		this.cate_name = cate_name;
	}

	public int getCate_sq() {
		return cate_sq;
	}

	public void setCate_sq(int cate_sq) {
		this.cate_sq = cate_sq;
	}

	public String getCate_name() {
		return cate_name;
	}

	public void setCate_name(String cate_name) {
		this.cate_name = cate_name;
	}

	@Override
	public String toString() {
		return "Category [cate_sq=" + cate_sq + ", cate_name=" + cate_name + "]";
	}
	
}
