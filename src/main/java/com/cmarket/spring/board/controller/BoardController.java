package com.cmarket.spring.board.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.cmarket.spring.board.model.service.BoardService;
import com.cmarket.spring.board.model.vo.Board;
import com.cmarket.spring.board.model.vo.BoardContent;
import com.cmarket.spring.board.model.vo.Category;
import com.cmarket.spring.board.model.vo.Dips;
import com.cmarket.spring.board.model.vo.FileBoard;
import com.cmarket.spring.member.model.service.MemberService;
import com.cmarket.spring.member.model.vo.Follow;
import com.cmarket.spring.member.model.vo.Member;
import com.cmarket.spring.member.model.vo.MemberProfile;

@Controller
public class BoardController {

	@Autowired
	BoardService bService;
	
	@Autowired
	MemberService mService;

	@RequestMapping("pbList.do")
	public String pbList(Model m,HttpSession session,Dips dips,Board board) {

		//전체 게시물
		ArrayList<Board> boardList = bService.getBoardList();
		
		//로그인 유저
		MemberProfile user = (MemberProfile) session.getAttribute("memberProfile");
		// dips 객체에 로그인유저의 프로필 인덱스 등록.
		dips.setProfile_sq(user.getProfile_sq());
		// 로그인 유저의 찜목록, jsp에서 찜목록을 반복문으로 돌려서 board_sq가 동일한것은 찜표시.
		ArrayList<Dips> dipsList = bService.getUserDips(dips);
		

		m.addAttribute("pbList",boardList);
		m.addAttribute("title","전체 게시글");
		m.addAttribute("dipsList",dipsList);
		
		return "productBoard/pbList";
	}
	
	@RequestMapping("search.do")
	public String search(Model m,HttpSession session,@RequestParam(name="words",required=false) String words,Dips dips) {
		
		ArrayList<Board> boardList = bService.searchBoard(words);
		
		//로그인 유저
		MemberProfile user = (MemberProfile) session.getAttribute("memberProfile");
		// dips 객체에 로그인유저의 프로필 인덱스 등록.
		dips.setProfile_sq(user.getProfile_sq());
		// 로그인 유저의 찜목록, jsp에서 찜목록을 반복문으로 돌려서 board_sq가 동일한것은 찜표시.
		ArrayList<Dips> dipsList = bService.getUserDips(dips);
		

		m.addAttribute("pbList",boardList);
		m.addAttribute("title","'"+words+"' "+"검색 결과");
		m.addAttribute("dipsList",dipsList);		
		
		return "productBoard/pbList";
	}
	
	
	@RequestMapping("areaBoard.do")
	public String areaBoard(Model m,HttpSession session,Member member,Board board,Dips dips) {

		String address = member.getSample4_jibunAddress().substring(0, member.getSample4_jibunAddress().lastIndexOf('동')+1);
		// 구~동 자르기. 0도 안되고 1도 안되고 2가 되네
		address = address.substring(address.lastIndexOf(" ", 2));
		//공백제거
		address = address.replaceAll("(^\\p{Z}+|\\p{Z}+$)", "");
		board.setBoard_address(address);
		
		ArrayList<Board> boardList = bService.areaBoard(board);

		//로그인 유저
		MemberProfile user = (MemberProfile) session.getAttribute("memberProfile");
		// dips 객체에 로그인유저의 프로필 인덱스 등록.
		dips.setProfile_sq(user.getProfile_sq());
		// 로그인 유저의 찜목록, jsp에서 찜목록을 반복문으로 돌려서 board_sq가 동일한것은 찜표시.
		ArrayList<Dips> dipsList = bService.getUserDips(dips);
		
		m.addAttribute("pbList",boardList);
		m.addAttribute("title","내 지역 게시글");
		m.addAttribute("dipsList",dipsList);		
		
		return "productBoard/pbList";
	}
	
	@SuppressWarnings("null")
	@RequestMapping("toDips.do")
	public String dipsList(Model m,HttpSession session,
						   ArrayList<Board> boardList, Board board,Dips dips) {
		
		MemberProfile user = (MemberProfile) session.getAttribute("memberProfile");
		dips.setProfile_sq(user.getProfile_sq());
		
		ArrayList<Dips> dipsList = bService.getUserDips(dips);
		
		for(Dips d:dipsList) {
			board.setBoard_sq(d.getBoard_sq());
			Board b = bService.getBoard2(board);
			System.out.println("d : " + d);
			System.out.println("b : " + b);
			if(b != null) {
				boardList.add(b);
				
			}
		}
		
		m.addAttribute("pbList",boardList);
		m.addAttribute("title","찜 목록");
		m.addAttribute("dipsList",dipsList);	
		
		return "productBoard/pbList";
	}
	
	@RequestMapping("followList.do")
	public String followList(Model m,HttpSession session,
			   ArrayList<Board> boardList,ArrayList<Board> result,ArrayList<Integer> arr, Board board,Follow follow, Dips dips){
		
		MemberProfile user = (MemberProfile) session.getAttribute("memberProfile");
		int profileNum = user.getProfile_sq();
		ArrayList<Follow> followList = bService.getUserFollowList(profileNum);
		
		for(Follow f:followList) {
			// 리더의 시퀀스넘버로 게시글목록을 불러온다.
			ArrayList<Board> boardList2 = bService.getBoardListByProfileSq(f.getLeader());
			for(Board b:boardList2) {
				// 불러온 게시글들 총합 리스트에 담는다.
				//boardList.add(b);
				
				// sq 뽑아오기
				arr.add(b.getBoard_sq());
			}
		}
		// sq 뽑아오기
		//for(Board b:boardList) {
			//arr.add(Integer.toString(b.getBoard_sq()));
			//arr.add(b.getBoard_sq());
		//}
		// sq 내림차순 정렬
		Collections.sort(arr,Collections.reverseOrder());
		// 정렬된 기준으로 보드 다시 불러오기, 아니면 가지고있는 list로 반복에 반복문을 돌리는게 났나..?
		for(Integer i:arr) {
			board.setBoard_sq(i);
			Board b = bService.getBoard2(board);
			boardList.add(b);
		}
		
		// 찜 표시
		dips.setProfile_sq(user.getProfile_sq());
		// 로그인 유저의 찜목록, jsp에서 찜목록을 반복문으로 돌려서 board_sq가 동일한것은 찜표시.
		ArrayList<Dips> dipsList = bService.getUserDips(dips);
		
		m.addAttribute("pbList",boardList);
		m.addAttribute("title","모아보기");
		m.addAttribute("dipsList",dipsList);	
		
		return "productBoard/pbList";
	}

	@RequestMapping("PBDetail.do")
	public String pbDetail(Model m, Board board, HttpSession session, Dips dips,HttpServletRequest request,HttpServletResponse response) {
		

		
		Board b = bService.getBoard2(board);
		
		MemberProfile writer = mService.getMemberProfile2(b.getProfile_sq());
		MemberProfile visitor = (MemberProfile) session.getAttribute("memberProfile");
		
		if(visitor.getProfile_sq() != writer.getProfile_sq()) {
			int upViews = bService.upViews(b);
			if(upViews<=0) {
				m.addAttribute("msg", "페이지 에러 입니다. 고객센터에 문의해주세요.");
				return "common/errorPage";
			}
		}
		
		BoardContent c = bService.getContent(b.getBoard_sq());
		
		ArrayList<FileBoard> files = bService.getFiles(c.getBoard_content_sq());

		dips.setProfile_sq(visitor.getProfile_sq());
		dips.setBoard_sq(board.getBoard_sq());
		
		Dips d = bService.checkDips(dips);
		
		
		m.addAttribute("b", b);
		m.addAttribute("c", c);
		m.addAttribute("d",d);
		m.addAttribute("files", files);
		m.addAttribute("writer", writer);
		
		return "productBoard/pbDetail";
	}
	
	@RequestMapping("toPbWrite.do")
	public String pbWrite(Model m,Board board) {
		return "productBoard/pbWrite";
	}
	
	@RequestMapping("deletePB.do")
	public String deletePB(Model m,Board board) {
		
		int result = bService.deletePB(board);
		
		if(result>0) {
			return "redirect:pbList.do";
		}else {
			m.addAttribute("msg", "삭제 실패, 관리자에게 문의해주세요.");
			return "common/errorPage";
		}
		
	}
	

	@RequestMapping("writePB")
	public String WritePB(Board board, BoardContent content, Category cate,
//			@RequestParam(name="imgFile1") MultipartFile file1,
//			@RequestParam(name="imgFile2",required=false) MultipartFile file2,
//			@RequestParam(name="imgFile3",required=false) MultipartFile file3,
			@RequestParam(name="files",required=false) String[] files,
			@RequestParam(name="files",required=false) String[] oriNames,
			HttpServletRequest request,
			HttpSession session,
			Model m,
			FileBoard file01,
			Member member
			) {

		String address = member.getSample4_jibunAddress().substring(0, member.getSample4_jibunAddress().lastIndexOf('동')+1);
		//address.lastIndexOf(" ", 1);
		System.out.println(address);
		// 구~동 자르기. 0도 안되고 1도 안되고 2가 되네
		address = address.substring(address.lastIndexOf(" ", 2));
		//공백제거
		address = address.replaceAll("(^\\p{Z}+|\\p{Z}+$)", "");
		
		System.out.println(files[0]);
		if(files == null) {
			m.addAttribute("msg","파일을 등록 해주세요.");
			return "common/errorPage";
		}
		
		System.out.println(board.getProfile_sq());
		
		MemberProfile visitMp = (MemberProfile) session.getAttribute("memberProfile");
		// board 셋팅 [cate]
		board.setBoard_category(cate.getCate_name());
		// [writer]
		board.setBoard_writer(visitMp.getProfile_nickname());
		// [thumbnail]
		//String oriName = file1.getOriginalFilename();
		//String renameFile = saveFile(file1,request);
		board.setBoard_img(files[0]);
		//
		board.setBoard_address(address);
		// 일단 file_tb에는 참조할 board_content_sq가 필요하므로, board를 먼저 만들고, board_content 만들어주자.
		int writePB = bService.insertPB(board);
		
		// *board 가져오기
		// 회원의 경우 insert 직후 동일한 비밀번호로 select해서 가져왔지만, board는 sq로 가져와야한다.
		// 하지만 inesrt와 동시에 sq를 받아올 수 없다.. 그러니 insert한 board의 모든 정보와 일치하는 것을 가져와야한다.
		// rename된 img파일명과 writer를 비교해서 board를 가져오자.
		Board writenPB = bService.getBoard(board);
		int pBSq = writenPB.getBoard_sq();
		
		// Insert Content
		content.setBoard_sq(pBSq);
		int insertContent = bService.insertContent(content);
		// board_sq로 content 불러오기
		BoardContent newContent = bService.getContent(pBSq);
		int cSq = newContent.getBoard_content_sq();
		
		// file_tb에 파일 정보를 등록해주자.
		for(int i=0; i<files.length; i++) {
			file01.setBoard_content_sq(cSq);
			file01.setFile_name(files[i]);
			file01.setFile_org_name(oriNames[i]);
			int save = bService.insertFile(file01);
			if(save<=0) {
				m.addAttribute("msg","파일을 등록 오류, 관리자에게 문의 바랍니다.");
				return "common/errorPage";
			}
		}
		
		
		// 1번 파일에 대한 기록을 file_tb에 저장해야한다. 객체에 꼭 담을 필요는 없지만, 담아야한다면 어떻게 객체를 생성해야할까?
		// 나중에 multifile을 배열로 받아보자
		//FileBoard file01 = new FileBoard();
//		file01.setBoard_content_sq(cSq);
//		file01.setFile_name(renameFile);
//		file01.setFile_org_name(oriName);
//		int save1 = bService.insertFile(file01);
		//int save1 = bService.insertFile(cSq,oriName,renameFile);
		
		// 2번 파일이 존재한다면 마찬가지로 file_tb에 저장해야한다. - file2.getOriginalFilename() != null 이게 안먹는다는건 null이 아니라 값이 비어있는 multifile객체가 들어오는건가. null떴잖아근데.
//		if(!file2.getOriginalFilename().equals("")) {
//			String oriName2 = file2.getOriginalFilename();
//			String renameFile2 = saveFile(file2,request);
//			FileBoard file02 = new FileBoard();
//			file02.setBoard_content_sq(cSq);
//			file02.setFile_name(renameFile2);
//			file02.setFile_org_name(oriName2);
//			int save2 = bService.insertFile(file02);
//			//int save2 = bService.insertFile(cSq,oriName2,renameFile2);
//		}
//		
//		if(!file3.getOriginalFilename().equals("")) {
//			String oriName3 = file3.getOriginalFilename();
//			String renameFile3 = saveFile(file3,request);
//			FileBoard file03 = new FileBoard();
//			file03.setBoard_content_sq(cSq);
//			file03.setFile_name(renameFile3);
//			file03.setFile_org_name(oriName3);
//			int save3 = bService.insertFile(file03);
//			//int save3 = bService.insertFile(cSq,oriName3,renameFile3);
//			
//		}

		return "redirect:pbList.do";
	}
	
	@RequestMapping("updatePB.do")
	public String updatePB() {
		
		
		return "productBoard/pbUpdate";
	}
	
	@ResponseBody // string형태, 즉 json형태. but 단순 string일경우는 type:json안해도됨
	@RequestMapping(value="uploadPBFile.do",produces="text/json; charset=UTF-8",method=RequestMethod.POST)
	public String profileFileUpload(
			@RequestParam(name="imgFile1",required=false) MultipartFile file,
			HttpServletRequest request){

		// String과 file 두개 같이 가져오기
		System.out.println("file : "+file.getOriginalFilename());
		
		// 새로운 파일 이름 변경
		String renameFile = saveFile(file,request);
		// 변경된 파일 이름으로 profile.setUser_photo
//		profile.setProfile_photo(renameFile);
		
		JSONObject job = new JSONObject();
		job.put("fileName", renameFile);
		job.put("oriName",file.getOriginalFilename());
		
		return job.toJSONString();

	}

	private String saveFile(MultipartFile file, HttpServletRequest request) {

		String root = request.getSession().getServletContext().getRealPath("resources");
		String folderPath = root+File.separator+"board-imgs";
		File folder = new File(folderPath);
		if(!folder.exists()) {
			folder.mkdir();
		}
		String originalFileName = file.getOriginalFilename();

		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");

		String renameFile = sdf.format(new java.sql.Date(System.currentTimeMillis()))+
				originalFileName.substring(originalFileName.lastIndexOf("."));

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
	
	@ResponseBody // string형태, 즉 json형태. but 단순 string일경우는 type:json안해도됨
	@RequestMapping(value="deletePBFile.do",produces="text/json; charset=UTF-8",method=RequestMethod.POST)
	private String deleteFile2(
//			@RequestParam(name="imgFile1",required=false) String fileName,
			@RequestBody FileBoard fileName,
			HttpServletRequest request) {
		System.out.println("fileName : "+fileName);
		String root = request.getSession().getServletContext().getRealPath("resources");
		String folderPath = root+File.separator+"board-imgs";
		String filePath = folderPath+File.separator+fileName.getFile_name();
		File file = new File(filePath);
		if(file.exists()) {
			file.delete();
			return "good";
		}
		return "fail";
	}


	@RequestMapping("pbTopList.do")
	public String pbTopList() {
		return "productBoard/pbTopList";
	}
	
	@ResponseBody
	@RequestMapping(value="dips.do",produces="text/json; charset=UTF-8",method=RequestMethod.POST)
	public String dips(@RequestBody Dips d, HttpSession session,HttpServletRequest request, Board board) {
		
		// 사용자 profile가져오기
		MemberProfile p = (MemberProfile) session.getAttribute("memberProfile");
		
		// 게시글 정보 가져오기
		board.setBoard_sq(d.getBoard_sq());
		Board b = bService.getBoard2(board);
		
		// 찜 확인
		Dips checkDips = bService.checkDips(d);
		
		// 찜 등록 및 삭제
		if(checkDips != null) {
			// 삭제
			int deleteDips = bService.deleteDips(d);
			// 삭제 성공시
			if(deleteDips>0) {
				// 찜 DB에서 조회한 현재 게시글의 총 찜 갯수
				int dipsCount = bService.dipsCount(d);
				// 게시글 DB에 찜 갯수를 저장.
				b.setBoard_dips_cnt(dipsCount);
				int updateBoard = bService.updateBoardDips(b);
				//return Integer.toString(dipsCount);
				return Integer.toString(dipsCount);
			}else {
				return "error";
			}
		}else {
			int dipsBoard = bService.dipsBoard(d);
			if(dipsBoard>0) {
				int dipsCount = bService.dipsCount(d);
				b.setBoard_dips_cnt(dipsCount);
				int updateBoard = bService.updateBoardDips(b);
				//return Integer.toString(dipsCount);
				return Integer.toString(dipsCount);
			}else {
				return "error";
			}
			
		}
		
//		@ResponseBody
//		@RequestMapping(value="dips.do",produces="text/json; charset=UTF-8",method=RequestMethod.POST)
//		public String dips(@RequestBody Dips d, HttpSession session,HttpServletRequest request, Board board) {
//			
//			// 사용자 profile가져오기
//			MemberProfile p = (MemberProfile) session.getAttribute("memberProfile");
//			
//			// 게시글 정보 가져오기
//			board.setBoard_sq(d.getBoard_sq());
//			Board b = bService.getBoard2(board);
//			
//			// 찜 확인
//			Dips checkDips = bService.checkDips(d);
//			
//			// 찜 등록 및 삭제
//			if(checkDips != null) {
//				// 삭제
//				int deleteDips = bService.deleteDips(d);
//				// 삭제 성공시
//				if(deleteDips>0) {
//					// 찜 DB에서 조회한 현재 게시글의 총 찜 갯수
//					int dipsCount = bService.dipsCount(d);
//					// 게시글 DB에 찜 갯수를 저장.
//					b.setBoard_dips_cnt(dipsCount);
//					int updateBoard = bService.updateBoardDips(b);
//					//return Integer.toString(dipsCount);
//					return "good";
//				}else {
//					return "error";
//				}
//			}else {
//				int dipsBoard = bService.dipsBoard(d);
//				if(dipsBoard>0) {
//					int dipsCount = bService.dipsCount(d);
//					b.setBoard_dips_cnt(dipsCount);
//					int updateBoard = bService.updateBoardDips(b);
//					//return Integer.toString(dipsCount);
//					return "good";
//				}else {
//					return "error";
//				}
//				
//			}
		
//		result>0{
//			bService.deleteDips(b);
//			bService.downDipsCount(b);
//			}else{
//			bService.upDipsCount(b);
//			}

		
		
	}	

}
