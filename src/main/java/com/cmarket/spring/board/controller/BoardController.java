package com.cmarket.spring.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {
	
	@RequestMapping("pbList.do")
	public String pbList() {
		return "productBoard/pbList";
	}
	@RequestMapping("pbDetail.do")
	public String pbDetail() {
		return "productBoard/pbDetail";
	}
	@RequestMapping("pbWrite.do")
	public String pbWrite() {
		return "productBoard/pbWrite";
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
