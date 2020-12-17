package com.cmarket.spring.board.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cmarket.spring.board.model.vo.Board;
import com.cmarket.spring.board.model.vo.BoardContent;
import com.cmarket.spring.board.model.vo.Dips;
import com.cmarket.spring.board.model.vo.FileBoard;
import com.cmarket.spring.member.model.vo.MemberProfile;

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

	public Board getBoard2(Board board) {
		return sqlSession.selectOne("boardMapper.getBoard2",board);
	}

	public ArrayList<FileBoard> getFiles(int board_content_sq) {
		return (ArrayList) sqlSession.selectList("boardMapper.getFiles",board_content_sq);
	}

	public int upViews(Board b) {
		return sqlSession.update("boardMapper.upViews",b);
	}

	public int deletePB(Board board) {
		return sqlSession.update("boardMapper.deletePB",board);
	}

	public Dips checkDips(Dips d) {
		return sqlSession.selectOne("boardMapper.checkDips",d);
	}

	public int dipsCount(Dips d) {
		return sqlSession.selectOne("boardMapper.dipsCount",d);
	}

	public int deleteDips(Dips d) {
		return sqlSession.delete("boardMapper.deleteDips",d);
	}

	public int dipsBoard(Dips d) {
		return sqlSession.insert("boardMapper.dipsBoard",d);
	}

	public int updateBoardDips(Board b) {
		return sqlSession.update("boardMapper.updateBoardDips",b);
	}

	public ArrayList<Dips> getUserDips (Dips dips) {
		return (ArrayList) sqlSession.selectList("boardMapper.getUserDips",dips);
	}

	public ArrayList<Board> searchBoard(String words) {
		return (ArrayList) sqlSession.selectList("boardMapper.searchBoard",words);
	}

	public ArrayList<Board> areaBoard(Board board) {
		return (ArrayList) sqlSession.selectList("boardMapper.areaBoard",board);
	}
}
