package com.cmarket.spring.board.model.service;

import java.util.ArrayList;

import com.cmarket.spring.board.model.vo.Board;
import com.cmarket.spring.board.model.vo.BoardContent;
import com.cmarket.spring.board.model.vo.FileBoard;

public interface BoardService {

	ArrayList<Board> getBoardList();

	int insertPB(Board board);

	Board getBoard(Board board);

	int insertContent(BoardContent content);

	BoardContent getContent(int pBSq);

	int insertFile(FileBoard file01);

	Board getBoard2(Board board);

	ArrayList<FileBoard> getFiles(int board_content_sq);
	
	

}
