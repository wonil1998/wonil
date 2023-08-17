package com.human.dao;

import java.util.List;

import com.human.VO.ReplyVO;
import com.human.VO.ReviewVO;

public interface IF_ReviewDAO {

	List<ReviewVO> myreviewSelectList(String id);

	List<ReviewVO> reviewSelectList(int num);

	void reviewInsert(ReviewVO rvo);

	int reviewSelectSeq();

	ReviewVO reviewInsertReturn(int num);

	public void review_mod(ReviewVO rvo) throws Exception;
	public void review_del(int num) throws Exception;
	
	
}
