package com.human.dao;

import java.util.List;

import com.human.VO.NoticeVO;

public interface IF_NoticeDAO {
	public List<NoticeVO> noticeSelectList() throws Exception;
	public void noticeInsertOne(NoticeVO nvo)throws Exception;
	public void noticeCntUpdate(int num) throws Exception;
	public NoticeVO noticeSelectOne(int num) throws Exception;
	public void noticeUpdate(NoticeVO nvo) throws Exception;
	public void noticeDeleteOne(int num) throws Exception;
	public void camp_notice_save(NoticeVO nvo) throws Exception;
	public NoticeVO campNoticeSelect(int c_num) throws Exception;
	public void camp_notice_mod(NoticeVO nvo) throws Exception;
}
