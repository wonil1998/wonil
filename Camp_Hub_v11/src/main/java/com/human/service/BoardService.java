package com.human.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.human.VO.BoardVO;
import com.human.VO.FiledataVO;
import com.human.VO.NoticeVO;
import com.human.VO.ReplyVO;
import com.human.VO.ReviewVO;
import com.human.dao.FiledataDAO;
import com.human.dao.IF_BoardDAO;
import com.human.dao.IF_FiledataDAO;
import com.human.dao.IF_NoticeDAO;
import com.human.dao.IF_ReplyDAO;
import com.human.dao.IF_ReviewDAO;

@Service
public class BoardService implements IF_BoardService{
	@Inject
	private IF_BoardDAO boarddao;
	
	@Inject 
	private IF_ReplyDAO replydao;
	
	@Inject
	private IF_NoticeDAO noticedao;
	
	@Inject
	private IF_FiledataDAO filedao;
	
	@Inject 
	private IF_ReviewDAO reviewdao;
	

	@Override
	public void review_mod(ReviewVO rvo) throws Exception {
		reviewdao.review_mod(rvo);
	}
	@Override
	public void review_del(int num) throws Exception {
		reviewdao.review_del(num);
	}
	@Override
	public List<BoardVO> boardSelectList(String b_type) throws Exception {
		return boarddao.boardSelectList(b_type);
	}
	@Override
	public void boardInsertOne(BoardVO bvo) throws Exception {
		int b_num=boarddao.board_seq();
		bvo.setNum(b_num);
		boarddao.boardInsertOne(bvo);
		HashMap<Object,Object> hmap = new HashMap<Object,Object>();
		if(bvo.getFilename() !=null) {
			String[] saveFile=bvo.getFilename();
			
			for(int i=0;i<saveFile.length;i++) {
				if(saveFile[i]!=null) {
					hmap.put("b_num",b_num);
					hmap.put("filename",saveFile[i]);
					filedao.fileInsert(hmap);
					hmap.clear();
				}
			}
		}

	}
	@Override
	public BoardVO boardSelectOne(int b_num) throws Exception {
		return boarddao.boardSelectOne(b_num);
	}

	@Override
	public List<ReplyVO> replySelectList(int b_num) throws Exception {
		return replydao.replySelectList(b_num);
	}
	@Override
	public ReplyVO replyInsert(ReplyVO rvo) throws Exception {
		int num = replydao.replySelectSeq();
		rvo.setNum(num);
		replydao.replyInsert(rvo);
		return replydao.replyInsertReturn(num);
	}
	@Override
	public void boardUpdateViewCnt(int num) throws Exception {
		boarddao.boardUpdateViewCnt(num);
	}
	@Override
	public int detailBoard_love(int num) throws Exception {
		boarddao.detailBoard_love(num);
		return boarddao.detailBoard_love_return(num);
		
	}
	@Override
	public int reply_love(int num) throws Exception {
		replydao.reply_love(num);
		return replydao.reply_loveReturn(num);
	}
	@Override
	public String reply_mod(ReplyVO rvo) throws Exception {
		replydao.reply_mod(rvo);
		return replydao.reply_modReturn(rvo.getNum());
	}
	@Override
	public void reply_del(int num) throws Exception {
		replydao.reply_del(num);
	}
	@Override
	public List<FiledataVO> fileSelectList(HashMap<String, Integer> hmap) throws Exception{
		return filedao.fileSelectList(hmap);
	}
	@Override
	public void filedataDelete(int num) throws Exception {
		filedao.filedataDelete(num);
	}
	@Override
	public void fileInsert(BoardVO bvo) throws Exception {
		int b_num=bvo.getNum();
		HashMap<Object,Object> hmap = new HashMap<Object,Object>();
		if(bvo.getFilename() !=null) {
			String[] saveFile=bvo.getFilename();
			
			for(int i=0;i<saveFile.length;i++) {
				if(saveFile[i]!=null) {
					hmap.put("b_num",b_num);
					hmap.put("filename",saveFile[i]);
					filedao.fileInsert(hmap);
					hmap.clear();
				}
			}
		}
		
	}
	@Override
	public List<NoticeVO> noticeSelectList() throws Exception {
		// TODO Auto-generated method stub
		return noticedao.noticeSelectList();
	}
	@Override
	public void noticeInsertOne(NoticeVO nvo) throws Exception {
		noticedao.noticeInsertOne(nvo);
	}
	@Override
	public NoticeVO noticeSelectOne(int num) throws Exception {
		noticedao.noticeCntUpdate(num);
		return noticedao.noticeSelectOne(num);
	}
	@Override
	public void noticeUpdate(NoticeVO nvo) throws Exception {
		noticedao.noticeUpdate(nvo);		
	}
	@Override
	public void noticeDeleteOne(int num) throws Exception {
		noticedao.noticeDeleteOne(num);
	}
	@Override
	public void boardUpdate(BoardVO bvo) throws Exception {
		boarddao.boardUpdate(bvo);
	}
	@Override
	public void boardDeleteOne(int num) throws Exception {
		boarddao.boardDeleteOne(num);
		
	}
	
	@Override
	public List<ReviewVO> myreviewSelectList(String id) throws Exception {
		return reviewdao.myreviewSelectList(id);
	}
	@Override
	public List<BoardVO> myboardSelectList(String id) throws Exception {
		return boarddao.myboardSelectList(id);
	}
	@Override
	public List<ReplyVO> myreplySelectList(String id) throws Exception {
		return replydao.myreplySelectList(id);
	}
	

}
