package com.human.service;

import java.util.HashMap;
import java.util.List;

import com.human.VO.CTypeNameVO;
import com.human.VO.CTypeVO;
import com.human.VO.CampVO;
import com.human.VO.FiledataVO;
import com.human.VO.NoticeVO;
import com.human.VO.ReplyVO;
import com.human.VO.ReviewVO;
import com.human.VO.RoomVO;
import com.human.VO.RoomSelectVO;

public interface IF_CampService {
	
	public List<CTypeNameVO> checkType() throws Exception;
	public List<CTypeVO> camp_type_check(int c_num) throws Exception;
	public List<CampVO> campSelectList() throws Exception;
	public List<CampVO> campSearchList(HashMap<String, String> hmap) throws Exception;
	public boolean markingChk(HashMap<Object, Object> hmap);
	public CampVO campSelectOne(int num)throws Exception;
	public List<ReviewVO> reviewSelectList(int num);
	public ReviewVO reviewInsert(ReviewVO rvo) throws Exception;
	public void markingInsert(HashMap<Object, Object> hmap);
	public void markingDelete(HashMap<Object, Object> hmap);
	
	
	public int camp_site_seq() throws Exception;
	public void camp_site_save(CampVO cvo) throws Exception;
	public void camp_notice_save(NoticeVO nvo) throws Exception;
	public void camp_type_save(CTypeVO ctvo) throws Exception; 
	public void camp_room_save(RoomVO rvo) throws Exception;
	public void camp_file_save(CampVO cvo) throws Exception;
	public List<CampVO> markingList(String id);
	public List<RoomSelectVO> roomSelectList(int num);
	public List<CampVO> campSearchByType(HashMap<Object, Object> hmap);

	public List<CampVO> mycampList(String id);

	public List<FiledataVO> fileList() throws Exception;

	public void campsiteStar(int c_num) throws Exception;
	
	public List<FiledataVO> campFileList(int c_num) throws Exception;
	public NoticeVO campNoticeList(int c_num) throws Exception;
	public void camp_mod(int c_num, CampVO cvo,NoticeVO nvo) throws Exception;
	public void camp_del(int num) throws Exception;
}
