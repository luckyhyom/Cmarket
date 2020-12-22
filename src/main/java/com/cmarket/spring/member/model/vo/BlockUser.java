package com.cmarket.spring.member.model.vo;

public class BlockUser {
	private int blocker;
	private int blocked;
	
	public BlockUser() {
		super();
		// TODO Auto-generated constructor stub
	}

	public BlockUser(int blocker, int blocked) {
		super();
		this.blocker = blocker;
		this.blocked = blocked;
	}

	public int getBlocker() {
		return blocker;
	}

	public void setBlocker(int blocker) {
		this.blocker = blocker;
	}

	public int getBlocked() {
		return blocked;
	}

	public void setBlocked(int blocked) {
		this.blocked = blocked;
	}

	@Override
	public String toString() {
		return "BlockUser [blocker=" + blocker + ", blocked=" + blocked + "]";
	}


}
