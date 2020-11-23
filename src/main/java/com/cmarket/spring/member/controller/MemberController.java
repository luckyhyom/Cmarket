package com.cmarket.spring.member.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

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

	//	private Logger logger = LoggerFactory.getLogger(MemberController.class);

	@RequestMapping("loginForm.do")
	public String tologinForm(HttpServletRequest request) {

		String uri = request.getHeader("Referer");
		if (!uri.contains("/loginView")) {
			request.getSession().setAttribute("prevPage",
					request.getHeader("Referer"));
		}

		return "member/loginForm";
	}

	//	@RequestMapping(value="login.do",method=RequestMethod.POST)
	//	public String login(Member m, Model model, HttpSession session) {
	//		Member loginUser = mService.loginMember(m);
	//		System.out.println(m.getUser_pwd() +" || " + loginUser.getUser_pwd());
	//		System.out.println(bcryptPasswordEncoder.matches(m.getUser_pwd(), loginUser.getUser_pwd()));
	//		if(loginUser != null && bcryptPasswordEncoder.matches(m.getUser_pwd(), loginUser.getUser_pwd())) {
	//			model.addAttribute("loginUser",loginUser);
	//			return "redirect:home.do";
	//		}else {
	//			model.addAttribute("msg","로그인에 실패하셨습니다. 아이디 혹은 비밀번호를 확인해주세요.");
	//			return "common/errorPage";
	//		}
	//	}

	//	@RequestMapping("/page")
	//	public String toJoinForm1() {
	//		return "/page";
	//	}
	//	@RequestMapping("/user/page")
	//	public String toJoinForm2() {
	//		return "/user/page";
	//	}
	//	@RequestMapping("/member/page")
	//	public String toJoinForm3() {
	//		return "/member/page";
	//	}
	//	@RequestMapping("/admin/page")
	//	public String toJoinForm4() {
	//		return "/admin/page";
	//	}

	@RequestMapping(value="login.do",method=RequestMethod.POST)
	public String memberLogin(Member m, Model model, HttpSession session) {

		Member loginUser = mService.loginMember(m);
		// 어노테이션에따라서 model의 scope가 달라짐
		//System.out.println("m의 비밀번호 인코드 : "+bcryptPasswordEncoder.encode(m.getUser_pwd()));
		//System.out.println("login의 비밀번호 인코드 : "+bcryptPasswordEncoder.encode(loginUser.getUser_pwd()));
		System.out.println("m 비밀번호 : "+m.getUser_pwd() +" || login 비밀번호 :  "+ loginUser.getUser_pwd());
		//		System.out.println("matches 결과 : "+bcryptPasswordEncoder.matches(m.getUser_pwd(),loginUser.getUser_pwd()));

		//Profile 불러오기
		MemberProfile memberProfile = mService.getMemberProfile(loginUser); 

		if(loginUser != null && bcryptPasswordEncoder.matches(m.getUser_pwd(),loginUser.getUser_pwd())) {
			model.addAttribute("loginUser",loginUser);
			System.out.println("memberProfile : " + memberProfile);
			session.setAttribute("memberProfile", memberProfile);
			return "redirect:home.do";
		}else {
			model.addAttribute("msg","로그인 실패!");
			return "common/errorPage";
		}
	}


	@RequestMapping("logout.do")
	public String logout(SessionStatus status, HttpSession session) {
		status.setComplete();
		session.invalidate();
		return "redirect:home.do";
	}

	@RequestMapping("joinForm.do")
	public String toJoinForm() {
		return "member/joinForm";
	}

	// 회원 가입
	@RequestMapping("memberJoin.do")
	public String insertMember(Member m, Model model,MemberProfile profile) {

		System.out.println(m);

		System.out.println(bcryptPasswordEncoder.encode(m.getUser_pwd()));
		String encPwd = bcryptPasswordEncoder.encode(m.getUser_pwd());
		m.setUser_pwd(encPwd);

		if(!m.getSample4_postcode().equals("")) {
			m.setAddress(m.getSample4_postcode()+", "+m.getSample4_roadAddress()+", "+m.getSample4_jibunAddress()+", "+m.getSample4_detailAddress());
		}

		System.out.println(m);

		System.out.println("처음 비밀번호 : "+m.getUser_pwd());

		int result = mService.insertMember(m);
		Member getM = mService.loginMember(m);
		System.out.println("로그인 후 비밀번호 : "+m.getUser_pwd());
		int result2 = 0;
		profile.setUser_sq(getM.getUser_sq());
		System.out.println("로그인 후 비밀번호2 : "+m.getUser_pwd());

		if(result > 0) {
			result2 = mService.insertProfile(profile);	
			System.out.println("로그인 후 비밀번호3 : "+m.getUser_pwd());
		}

		if(result>0 && result2 >0) {
			//		if(result>0) {
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

	@RequestMapping("myInfoUpdateForm.do")
	public String myInfoUpdateForm() {
		return "member/myInfoUpdate";
	}

	@RequestMapping("myInfoUpdate.do")
	public String myInfoUpdate(Member m,Model model,MemberProfile profile,
			@RequestParam("sample4_postcode") String post
			,@RequestParam("sample4_roadAddress") String address1
			,@RequestParam("sample4_jibunAddress") String address2
			,@RequestParam("sample4_detailAddress") String address3) {

		Member loginUser = mService.loginMember(m);
		if(!post.equals("")) {
			m.setAddress(post+", "+address1+", "+address2+", "+address3);
		}

		System.out.println("loginUser result : "+loginUser);
		System.out.println("m result : "+m);
		System.out.println("boolean : "+bcryptPasswordEncoder.matches(m.getUser_pwd(),loginUser.getUser_pwd()));
		if(loginUser != null && bcryptPasswordEncoder.matches(m.getUser_pwd(),loginUser.getUser_pwd())) {
			int result1 = mService.updateMember(m);
			int result2 = mService.updateProfile(profile);
			if(result1 >0) {
				model.addAttribute("loginUser",m);
				return "redirect:home.do";
			}else {
				model.addAttribute("msg","비밀번호를 다시 확인해주세요.");
				return "common/errorPage";
			}
		}else {
			model.addAttribute("msg","비밀번호를 다시 확인해주세요.");
			return "common/errorPage";
		}
	}

	@RequestMapping("findId.do")
	public String findId() {
		return "member/findId";
	}

	@RequestMapping("findPwd.do")
	public String findPwd() {
		return "member/findPwd";
	}

	@RequestMapping("updatePwdForm.do")
	public String updatePwdForm() {
		return "member/updatePwd";
	}

	@RequestMapping("updatePwd.do")
	public String updatePwd(Model model,Member m,@RequestParam String user_pwd_up) {
		//		System.out.println("updatePwd의 m : "+m);
		Member loginUser = mService.loginMember(m);
		//		System.out.println("login result : "+loginUser);
		//		System.out.println("login pwd : "+loginUser.getUser_pwd());
		//		System.out.println("pwd_up result : "+user_pwd_up);
		if(loginUser != null && bcryptPasswordEncoder.matches(m.getUser_pwd(),loginUser.getUser_pwd())) {
			String newPwd = bcryptPasswordEncoder.encode(user_pwd_up);
			//			System.out.println("pwd_up encode result : "+newPwd);
			//			System.out.println("pwd_up encode result2 : "+newPwd);
			loginUser.setUser_pwd(newPwd);
			//			System.out.println("login after pwd : "+loginUser.getUser_pwd());
			int result = mService.updateMemberPwd(loginUser);
			if(result >0) {
				model.addAttribute("loginUser",loginUser);
				return "redirect:home.do";
			}else {
				model.addAttribute("msg","비밀번호를 다시 확인해주세요.");
				return "common/errorPage";
			}
		}else {
			model.addAttribute("msg","비밀번호를 다시 확인해주세요.");
			return "common/errorPage";
		}
	}

	@RequestMapping("userProfile.do")
	public String userProfile() {
		return "member/userProfile";
	}

	@RequestMapping("sellList.do")
	public String sellList() {
		return "member/sellList";
	}

	@ResponseBody // string형태, 즉 json형태. but 단순 string일경우는 type:json안해도됨
	@RequestMapping("idCheck.do")
	public String idCheck(String user_id){

		int result = mService.idCheck(user_id);

		if(result > 0) {
			return "fail";
		}else {
			return "ok";
		}

	}
	@ResponseBody // string형태, 즉 json형태. but 단순 string일경우는 type:json안해도됨
	@RequestMapping(value="updateProfilePhoto.do",produces="text/json; charset=UTF-8",method=RequestMethod.POST)
	public String profileFileUpload(
//			@RequestParam(name="profile_sq", required=false) String profile_sq,
			@RequestBody MemberProfile profile,
//			@RequestBody Member loginUser,
//			@RequestParam String fileName,
			HttpSession session,
			HttpServletRequest request){
	
		System.out.println("profile : "+profile);
		System.out.println(session);
		System.out.println(session.getAttribute("memberProfile"));
		
		MemberProfile mp = (MemberProfile) session.getAttribute("memberProfile");
		System.out.println(mp);
		
		mp.setProfile_photo(profile.getProfile_photo());
		
		int result = mService.updateMemberPhoto(mp);

		
		JSONObject job = new JSONObject();
		job.put("fileName", "good");
		if(result > 0) {
			session.setAttribute("memberProfile", mp);
			return job.toJSONString();
		}else {
			return "알 수 없는 에러가 발생했습니다. 고객센터에 문의해주세요.";
		}

	}


	@ResponseBody // string형태, 즉 json형태. but 단순 string일경우는 type:json안해도됨
	@RequestMapping(value="profileFileUpload.do",produces="text/json; charset=UTF-8",method=RequestMethod.POST)
	public String profileFileUpload(
//			@RequestParam(name="profile_sq", required=false) String profile_sq,
//			 @RequestBody MemberProfile profile,
//			@RequestParam(name="profile_sq", required=false) MemberProfile profile,
//			MemberProfile profile,
			@RequestParam(name="profileFile",required=false) MultipartFile file,
//			@RequestParam(name="profile_sq",required=false) MultipartFile file2,
			HttpServletRequest request){
		//@RequestBody 받아오는법, 및 객체 받아오는 법.
		// String과 file 두개 같이 가져오기
		System.out.println("file : "+file.getOriginalFilename());
//		System.out.println("file : "+file2.getOriginalFilename());
//		System.out.println("profile : "+profile);
		
		
		
		// 기존 프로필 사진 삭제
//		if(!profile.getProfile_photo().equals("")&& !file.isEmpty()) {
//			deleteFile(profile.getProfile_photo(),request);
//		}
		// 새로운 파일 이름 변경
		String renameFile = saveFile(file,request);
		// 변경된 파일 이름으로 profile.setUser_photo
//		profile.setProfile_photo(renameFile);
		// profile_sq와 user_photo 두개의 정보만으로 user_tb 수정 
//		int result = mService.updateMemberPhoto(profile);

		
		JSONObject job = new JSONObject();
//		job.put("fileName", file.getOriginalFilename());
		job.put("fileName", renameFile);
//		job.put("profile_sq", profile);
		if(1 > 0) {
//			return profile.getProfile_photo();
			return job.toJSONString();
		}else {
			return "알 수 없는 에러가 발생했습니다. 고객센터에 문의해주세요.";
		}

	}


	private String saveFile(MultipartFile file, HttpServletRequest request) {
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		String folderPath = root+File.separator+"profilePhotos";
		File folder = new File(folderPath);
		if(!folder.exists()) {
			folder.mkdir();
		}
		String originalFileName = file.getOriginalFilename();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		
		String renameFile = sdf.format(new java.sql.Date(System.currentTimeMillis()))+
		originalFileName.substring(originalFileName.lastIndexOf(".")-1);
		
		String renamePath = folder+File.separator+renameFile;
		
		try {
			file.transferTo(new File(renamePath));
		} catch (IllegalStateException | IOException e) {
			System.out.println("파일전송에러"+e.getMessage());
		}
		
		return renameFile;
	}
	
	private void deleteFile(String fileName, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String folderPath = root+File.separator+"profilePhotos";
		String filePath = folderPath+File.separator+fileName;
		File file = new File(filePath);
		if(file.exists()) {
			file.delete();
		}
	}
	
	

	//	@RequestMapping("error.do")
	//	public String errorPage() {
	//		return "common/error";
	//	}

}
