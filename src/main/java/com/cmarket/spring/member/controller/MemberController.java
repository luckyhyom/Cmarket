package com.cmarket.spring.member.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.cmarket.spring.member.model.service.MemberService;
import com.cmarket.spring.member.model.vo.Member;
import com.cmarket.spring.member.model.vo.MemberProfile;
@SessionAttributes("loginUser")
@Controller
public class MemberController {

	@Autowired
	private MemberService mService;
	
	
	// 암호화 처리
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	private Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@RequestMapping("loginForm.do")
	public String tologinForm() {
		return "member/loginForm";
	}
	
	@RequestMapping(value="login.do",method=RequestMethod.POST)
	public String login(Member m, Model model, HttpSession session) {
		
		// 프로필도 같이 세션에 넣어줘야하는데..?
		Member loginUser = mService.loginMember(m);
//		MemberProfile profile = mService.loginProfile(m);
		if(loginUser != null && bcryptPasswordEncoder.matches(m.getUser_pwd(),loginUser.getUser_pwd())) {
			model.addAttribute("loginUser",loginUser);
//			session.setAttribute("profile", profile);
			return "redirect:home.do";
		}else {
			model.addAttribute("msg","로그인 실패!");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("joinForm.do")
	public String toJoinForm() {
		return "member/joinForm";
	}
	
	// 회원 가입
	@RequestMapping("memberJoin.do")
	public String insertMember(Member m, Model model,MemberProfile profile,
			@RequestParam("sample4_postcode") String post
			,@RequestParam("sample4_roadAddress") String address1
			,@RequestParam("sample4_jibunAddress") String address2
			,@RequestParam("sample4_detailAddress") String address3) {
		System.out.println("post : "+post);
		System.out.println(m);
		System.out.println(bcryptPasswordEncoder.encode(m.getUser_pwd()));
		// 의존성주입필요, 랜덤적인 솔트값을 처리하고.. 비크립트 방식 <로그인할때 입력해도 변경되기때문에 로그인못함>
		String encPwd = bcryptPasswordEncoder.encode(m.getUser_pwd());
//		sample4_postcode,sample4_roadAddress,sample4_jibunAddress,sample4_detailAddress
		// 프로필도 같이 등록해줘야함
		
		m.setUser_pwd(encPwd);

		if(!post.equals("")) {
			m.setAddress(post+", "+address1+", "+address2+", "+address3);
		}
		
		System.out.println(m);
		
		// 이제 서비스로 이동
		int result = mService.insertMember(m);
		Member getM = mService.loginMember(m);
		int result2 = 0;
		profile.setUser_sq(getM.getUser_sq());
		System.out.println();
		System.out.println(profile.getUser_sq());
		if(result > 0) {
			result2 = mService.insertProfile(profile);	
		}
		
		if(result>0 && result2 >0) {
			return "redirect:home.do";
		}else {
			model.addAttribute("msg","회원가입실패");
			return "common/errorPage";
		}
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
