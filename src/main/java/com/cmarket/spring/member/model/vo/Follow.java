package com.cmarket.spring.member.model.vo;

public class Follow {
	
	private int follower;
	private int leader;
	
	public Follow() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Follow(int follower, int leader) {
		super();
		this.follower = follower;
		this.leader = leader;
	}
	
	public int getFollower() {
		return follower;
	}
	public void setFollower(int follower) {
		this.follower = follower;
	}
	public int getLeader() {
		return leader;
	}
	public void setLeader(int leader) {
		this.leader = leader;
	}
	
	@Override
	public String toString() {
		return "Follow [follower=" + follower + ", leader=" + leader + "]";
	}
	
	

}
