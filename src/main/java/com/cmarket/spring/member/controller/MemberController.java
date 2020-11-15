package com.cmarket.spring.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {

	
	@RequestMapping("login.do")
	public String login() {
		return "member/loginForm";
	}
	
	@RequestMapping("joinForm.do")
	public String join() {
		return "member/joinForm";
	}
	
	@RequestMapping("myInfo.do")
	public String myInfo() {
		return "member/myInfo";
	}
	
	@RequestMapping("myInfoUpdate.do")
	public String myInfoUpdate() {
		return "member/myInfoUpdate";
	}
	
	@RequestMapping("findId.do")
	public String findId() {
		return "member/findId";
	}
	
	@RequestMapping("findPwd.do")
	public String findPwd() {
		return "member/findPwd";
	}
	
	@RequestMapping("updatePwd.do")
	public String updatePwd() {
		return "member/updatePwd";
	}
	
	@RequestMapping("userProfile.do")
	public String userProfile() {
		return "member/userProfile";
	}
	
	@RequestMapping("sellList.do")
	public String sellList() {
		return "member/sellList";
	}
}
