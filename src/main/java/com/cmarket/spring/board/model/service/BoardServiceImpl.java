package com.cmarket.spring.board.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cmarket.spring.board.model.dao.BoardDao;
import com.cmarket.spring.board.model.vo.Board;
import com.cmarket.spring.board.model.vo.BoardContent;
import com.cmarket.spring.board.model.vo.FileBoard;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardDao bDao;
	
	@Override
	public ArrayList<Board> getBoardList() {
		
		return bDao.getBoardList();
	}

	@Override
	public int insertPB(Board board) {
		return bDao.insertPB(board);
	}

	@Override
	public Board getBoard(Board board) {
		return bDao.getBoard(board);
	}

	@Override
	public int insertContent(BoardContent content) {
		return bDao.insertContent(content);
	}

	@Override
	public BoardContent getContent(int pBSq) {
		return bDao.getContent(pBSq);
	}

	@Override
	public int insertFile(FileBoard file01) {
		return bDao.insertFile(file01);
	}
	
	

}
