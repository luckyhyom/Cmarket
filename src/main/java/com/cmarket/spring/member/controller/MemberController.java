package com.cmarket.spring.member.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

import com.cmarket.spring.board.model.vo.Board;
import com.cmarket.spring.board.model.vo.Dips;
import com.cmarket.spring.member.model.service.MemberService;
import com.cmarket.spring.member.model.vo.Follow;
import com.cmarket.spring.member.model.vo.Member;
import com.cmarket.spring.member.model.vo.MemberProfile;
import com.cmarket.spring.member.model.vo.ProfileComment;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
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


	@RequestMapping(value="login.do",method=RequestMethod.POST)
	public String memberLogin(Member m, Model model, HttpSession session) {

		Member loginUser = mService.loginMember(m);
		// 어노테이션에따라서 model의 scope가 달라짐

		System.out.println("m 비밀번호 : "+m.getUser_pwd() +" || login 비밀번호 :  "+ loginUser.getUser_pwd());


		//Profile 불러오기
		MemberProfile memberProfile = mService.getMemberProfile(loginUser.getUser_sq()); 

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

		Member loginUser = mService.loginMember(m);

		if(loginUser != null && bcryptPasswordEncoder.matches(m.getUser_pwd(),loginUser.getUser_pwd())) {
			String newPwd = bcryptPasswordEncoder.encode(user_pwd_up);
			loginUser.setUser_pwd(newPwd);
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
			//			@RequestParam(name="profile_sq", required=false) String profile_sq, //받아지나 확인= 안받아짐.
			@RequestBody MemberProfile profile,
			//			@RequestBody Member loginUser,
			//			@RequestParam String fileName, //받아지나 확인
			HttpSession session,
			HttpServletRequest request){
		//System.out.println("profile : "+profile_sq);
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

	@RequestMapping(value="viewProfile.do")
	public String viewProfile(MemberProfile profile, Model m,HttpSession session,
			ArrayList<Board> boardList,ArrayList<Board> result,ArrayList<Integer> arr, Board board,Follow follow, Dips dips) {

		// when profile is Null

		MemberProfile user = (MemberProfile) session.getAttribute("memberProfile");

		MemberProfile mp = mService.getMemberProfile2(profile.getProfile_sq());
		System.out.println(mp.getProfile_sq());

		//Check overlap
		String checkOverlap = "no";

		int sumComments = 0;

		ArrayList<ProfileComment> pcList = mService.getCommentList(mp.getProfile_sq());
		for(ProfileComment pc :pcList) {
			if(pc.getCom_writer_sq()==user.getProfile_sq()) {
				checkOverlap = "yes";
			}
			sumComments++;
		}


		int profileNum = user.getProfile_sq();
		ArrayList<Follow> followList = mService.getUserFollowList(profileNum);

		String checkFollow = "no";
		for(Follow f:followList) {
			if(f.getLeader()==mp.getProfile_sq()) {
				checkFollow = "yes";
			}
		}


		System.out.println("pcList : "+pcList);
		m.addAttribute("p", mp);
		m.addAttribute("pcList",pcList);
		m.addAttribute("sumComments",sumComments);
		System.out.println("mp : "+mp);
		m.addAttribute("checkOverlap", checkOverlap);
		m.addAttribute("checkFollow", checkFollow);

		return "member/userProfile";
	}


	//	@ResponseBody
	@RequestMapping(value="writeComment.do")
	public String writeComment(ProfileComment comment, HttpSession session,Model m, @RequestParam(name="tempPoint") int tempPoint,HttpServletResponse response) {
		MemberProfile wrtierMp = (MemberProfile) session.getAttribute("memberProfile");
		comment.setCom_writer(wrtierMp.getProfile_nickname());
		comment.setCom_img(wrtierMp.getProfile_photo());
		comment.setCom_writer_sq(wrtierMp.getProfile_sq());

		//profile_sq로 평가받는 유저의 프로필 불러오기
		MemberProfile mp = mService.getMemberProfile2(comment.getProfile_sq());

		double sum=mp.getProfile_temperature();

		if(tempPoint == 1) {
			sum = mp.getProfile_temperature()+1*20;
			comment.setCom_judge("Y");
		}else if(tempPoint == -1) {
			sum = mp.getProfile_temperature()-1*20;
			comment.setCom_judge("N");
		}else {
			return errorPage("고객센터에 문의해주세요.",m);
		}

		mp.setProfile_temperature(sum);


		ArrayList<ProfileComment> pcList = mService.getCommentList(mp.getProfile_sq());

		// 댓글 중복 방지
		for(ProfileComment pc :pcList) {
			if(pc.getCom_writer_sq()==comment.getCom_writer_sq()) {
				m.addAttribute("msg", "이미 평가를 하셨어요.");
				return "common/errorPage";
				//				errorPage("이미 평가를 하셨어요.",m);
			}
		}

		int result = mService.writeComment(comment);
		int result2 =0;
		if(result>0) {
			result2 = mService.updateTemp(mp);
		}


		//viewProfile메소드 가능할시에 Model에 셋팅이 필요한지? -필요없다.
		//m.addAttribute("p", mp);
		//m.addAttribute("pcList",pcList);



		//왜 얘는 comment를 따로 안만들고 바로 집어넣어도 되는지 생각해보기 : 회원가입이랑 똑같음. 걍 집어넣는거임
		if(result>0 && result2 > 0) {
			// redirect로 메소드를 다시 실행시켜야한다. 새로고침효과도 얻음!, 새로고침되는 페이지의 정보를 model에 셋팅해주어야한다.
			//return "redirect:viewProfile.do";
			//return "member/userProfile";	   
			return viewProfile(mp,m,session);
		}else {
			//return "common/errorPage";
			m.addAttribute("msg", "고객센터에 문의해주세요.");
			return errorPage("고객센터에 문의해주세요.",m);
		}

	}

	@RequestMapping("deleteComment.do")
	public String deleteComment(ProfileComment comment,Model m,HttpSession session) {

		// 평가받는 유저의 프로필 불러오기
		MemberProfile mp = mService.getMemberProfile2(comment.getProfile_sq());

		// comment_sq를 이용하여 comment를 가져온 후에, judge의 상태를 확인한다.
		// profile_sq와 함께 비교하여 유저 임의로 다른 유저의 댓글을 삭제 시키는 것을 방지한다.
		ProfileComment realPc = mService.getComment(comment);
		if(realPc == null) {
			return errorPage("잘못된 접근입니다.",m);
		}

		// 댓글 삭제시 judge의 상태에 따라서 온도 초기화 값 설정
		double sum=mp.getProfile_temperature();
		if(realPc.getCom_judge().equals("Y")) {
			sum = mp.getProfile_temperature()-1*20;
		}else if(realPc.getCom_judge().equals("N")) {
			sum = mp.getProfile_temperature()+1*20;
		}else {
			return errorPage("고객센터에 문의해주세요.",m);
		}
		mp.setProfile_temperature(sum);


		// 댓글 삭제
		int result = mService.deleteComment(realPc);
		int result2 =0;

		// 댓글 삭제 성공하면 유저 온도 수정
		if(result>0) {
			result2 = mService.updateTemp(mp);
		}

		if(result>0 && result2>0) {
			return viewProfile(mp,m,session);
		}else {
			return errorPage("댓글 삭제 오류, 고객센터에 문의해주세요.",m);
		}

	}

	@RequestMapping
	public String errorPage(String msg,Model m) {
		m.addAttribute("msg",msg);
		return "common/errorPage";
	}

	//	@ResponseBody // string형태, 즉 json형태. but 단순 string일경우는 type:json안해도됨
	@RequestMapping(value="follow.do")
	public String follow(Follow follow,HttpSession session,Model m){

		MemberProfile mp = (MemberProfile) session.getAttribute("memberProfile");
		follow.setFollower(mp.getProfile_sq());
		int result = mService.insertFollow(follow);
		if(result>0) {
			return "redirect:home.do";
		}else {
			m.addAttribute("msg","친추실패");
			return "common/errorPage";
		}
	}

	@RequestMapping(value="unFollow.do")
	public String deleteFollow(Follow follow,HttpSession session,Model m){

		MemberProfile mp = (MemberProfile) session.getAttribute("memberProfile");
		follow.setFollower(mp.getProfile_sq());
		int result = mService.unFollow(follow);
		if(result>0) {
			return "redirect:home.do";
		}else {
			m.addAttribute("msg","친추실패");
			return "common/errorPage";
		}
	}


}
