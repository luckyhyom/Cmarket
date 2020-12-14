package com.cmarket.spring.board.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cmarket.spring.board.model.dao.BoardDao;
import com.cmarket.spring.board.model.vo.Board;
import com.cmarket.spring.board.model.vo.BoardContent;
import com.cmarket.spring.board.model.vo.Dips;
import com.cmarket.spring.board.model.vo.FileBoard;
import com.cmarket.spring.member.model.vo.MemberProfile;

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

	@Override
	public Board getBoard2(Board board) {
		return bDao.getBoard2(board);
	}

	@Override
	public ArrayList<FileBoard> getFiles(int board_content_sq) {
		return bDao.getFiles(board_content_sq);
	}

	@Override
	public int upViews(Board b) {
		return bDao.upViews(b);
	}

	@Override
	public int deletePB(Board board) {
		return bDao.deletePB(board);
	}

	@Override
	public Dips checkDips(Dips d) {
		return bDao.checkDips(d);
	}

	@Override
	public int dipsCount(Dips d) {
		return bDao.dipsCount(d);
	}

	@Override
	public int deleteDips(Dips d) {
		return bDao.deleteDips(d);
	}

	@Override
	public int dipsBoard(Dips d) {
		return bDao.dipsBoard(d);
	}

	@Override
	public int updateBoardDips(Board b) {
		return bDao.updateBoardDips(b);
	}
	
	

}
