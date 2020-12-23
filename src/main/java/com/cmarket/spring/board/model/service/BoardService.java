package com.cmarket.spring.board.model.service;

import java.util.ArrayList;

import com.cmarket.spring.board.model.vo.Board;
import com.cmarket.spring.board.model.vo.BoardContent;
import com.cmarket.spring.board.model.vo.Dips;
import com.cmarket.spring.board.model.vo.FileBoard;
import com.cmarket.spring.member.model.vo.Follow;
import com.cmarket.spring.member.model.vo.MemberProfile;

public interface BoardService {

	ArrayList<Board> getBoardList();

	int insertPB(Board board);

	Board getBoard(Board board);

	int insertContent(BoardContent content);

	BoardContent getContent(int pBSq);

	int insertFile(FileBoard file01);

	Board getBoard2(Board board);

	ArrayList<FileBoard> getFiles(int board_content_sq);

	int upViews(Board b);

	int deletePB(Board board);

	Dips checkDips(Dips d);

	int dipsCount(Dips d);

	int deleteDips(Dips d);

	int dipsBoard(Dips d);

	int updateBoardDips(Board b);

	ArrayList<Dips> getUserDips(Dips dips);

	ArrayList<Board> searchBoard(String words);

	ArrayList<Board> areaBoard(Board board);

//	ArrayList<Follow> getUserFollowList(int profileNum);

	
	

}
