package com.cmarket.spring.board.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.cmarket.spring.board.model.service.BoardService;
import com.cmarket.spring.board.model.vo.Board;
import com.cmarket.spring.board.model.vo.BoardContent;
import com.cmarket.spring.board.model.vo.Category;
import com.cmarket.spring.board.model.vo.FileBoard;
import com.cmarket.spring.member.model.vo.MemberProfile;

@Controller
public class BoardController {

	@Autowired
	BoardService bService;

	@RequestMapping("pbList.do")
	public String pbList(Model m) {

		ArrayList<Board> boardList = bService.getBoardList();
		//		List<BoardContent> content = (ArrayList) bService.getContentList();
		//		List<Category> content = (ArrayList) bService.getCateList();

		m.addAttribute("pbList",boardList);
		return "productBoard/pbList";
	}

	@RequestMapping("pbDetail.do")
	public String pbDetail() {
		return "productBoard/pbDetail";
	}

	@RequestMapping("toPbWrite.do")
	public String pbWrite() {
		return "productBoard/pbWrite";
	}

	@RequestMapping("writePB")
	public String WritePB(Board board, BoardContent content, Category cate,
			@RequestParam(name="imgFile1") MultipartFile file1,
			@RequestParam(name="imgFile2",required=false) MultipartFile file2,
			@RequestParam(name="imgFile3",required=false) MultipartFile file3,
			HttpServletRequest request,
			HttpSession session,
			Model m,
			FileBoard file01
			) {

		if(file1.getOriginalFilename().equals("")) {
			m.addAttribute("msg","파일 업로드 에러");
			return "common/errorPage";
		}
		MemberProfile visitMp = (MemberProfile) session.getAttribute("memberProfile");
		System.out.println(cate);
		// board 셋팅
		board.setBoard_category(cate.getCate_name());
		//
		board.setBoard_writer(visitMp.getProfile_nickname());
		//
		String oriName = file1.getOriginalFilename();
		String renameFile = saveFile(file1,request);
		board.setBoard_img(renameFile);
		
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
		
		
		// 1번 파일에 대한 기록을 file_tb에 저장해야한다. 객체에 꼭 담을 필요는 없지만, 담아야한다면 어떻게 객체를 생성해야할까?
		// 나중에 multifile을 배열로 받아보자
		//FileBoard file01 = new FileBoard();
		file01.setBoard_content_sq(cSq);
		file01.setFile_name(renameFile);
		file01.setFile_org_name(oriName);
		int save1 = bService.insertFile(file01);
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

	@RequestMapping("pbUpdate.do")
	public String pbUpdate() {
		return "productBoard/pbUpdate";
	}

	@RequestMapping("pbTopList.do")
	public String pbTopList() {
		return "productBoard/pbTopList";
	}

}
