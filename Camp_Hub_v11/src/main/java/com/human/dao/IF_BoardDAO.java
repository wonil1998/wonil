package com.human.dao;

import java.util.List;

import com.human.VO.BoardVO;

public interface IF_BoardDAO {
	public List<BoardVO> boardSelectList(String b_type) throws Exception;
	public void boardInsertOne(BoardVO bvo) throws Exception;
	public int board_seq() throws Exception;
	public void boardUpdateViewCnt(int num) throws Exception;
	public BoardVO boardSelectOne(int num) throws Exception;
	
	
	public void detailBoard_love(int num) throws Exception;
	public int detailBoard_love_return(int num) throws Exception;
	
	public void boardDeleteOne(int num)throws Exception;
	public void boardUpdate(BoardVO bvo)throws Exception;
	public List<BoardVO> myboardSelectList(String id) throws Exception;
	
}
