package com.cmarket.spring.board.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cmarket.spring.board.model.vo.Board;
import com.cmarket.spring.board.model.vo.BoardContent;
import com.cmarket.spring.board.model.vo.FileBoard;

@Repository("bDao")
public class BoardDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	public ArrayList<Board> getBoardList() {
		return (ArrayList) sqlSession.selectList("boardMapper.getBoardList");
	}

	public int insertPB(Board board) {
		return sqlSession.insert("boardMapper.insertPB",board);
	}

	public Board getBoard(Board board) {
		return sqlSession.selectOne("boardMapper.getBoard",board);
	}

	public int insertContent(BoardContent content) {
		return sqlSession.insert("boardMapper.insertContent",content);
	}

	public BoardContent getContent(int pBSq) {
		return sqlSession.selectOne("boardMapper.getContent",pBSq);
	}

	public int insertFile(FileBoard file01) {
		return sqlSession.insert("boardMapper.insertFile",file01);
	}

}
