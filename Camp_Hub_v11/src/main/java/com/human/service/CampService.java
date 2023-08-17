package com.human.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.human.VO.CTypeNameVO;
import com.human.VO.CTypeVO;
import com.human.VO.CampVO;
import com.human.VO.FiledataVO;
import com.human.VO.NoticeVO;
import com.human.VO.ReplyVO;
import com.human.VO.ReviewVO;
import com.human.VO.RoomSelectVO;
import com.human.VO.RoomVO;
import com.human.dao.IF_CTypeDAO;
import com.human.dao.IF_CTypeNameDAO;
import com.human.dao.IF_CampDAO;
import com.human.dao.IF_FiledataDAO;
import com.human.dao.IF_MarkingDAO;
import com.human.dao.IF_NoticeDAO;
import com.human.dao.IF_ReviewDAO;
import com.human.dao.IF_RoomDAO;

@Service
public class CampService implements IF_CampService {
	@Inject
	private IF_CampDAO campdao;

	@Inject
	private IF_CTypeDAO ctypedao;

	@Inject
	private IF_CTypeNameDAO ctypeNamedao;

	@Inject
	private IF_NoticeDAO noticedao;

	@Inject
	private IF_RoomDAO roomdao;

	@Inject
	private IF_ReviewDAO reviewdao;

	@Inject
	private IF_MarkingDAO markingdao;

	@Inject
	private IF_FiledataDAO filedao;

	@Override
	public List<CTypeNameVO> checkType() throws Exception {
		return ctypeNamedao.checkType();
	}

	@Override
	public List<CTypeVO> camp_type_check(int c_num) throws Exception {
		return ctypedao.camp_type_check(c_num);
	}
	
	@Override
	public List<CampVO> campSelectList() throws Exception {
		return campdao.campSelectList();
	}

	@Override
	public List<CampVO> campSearchList(HashMap<String, String> hmap) throws Exception {
		return campdao.campSearchList(hmap);
	}

	@Override
	public boolean markingChk(HashMap<Object, Object> hmap) {
		return markingdao.markingChk(hmap);
	}

	@Override
	public CampVO campSelectOne(int num) {
		return campdao.campSelectOne(num);
	}

	@Override
	public List<ReviewVO> reviewSelectList(int num) {
		return reviewdao.reviewSelectList(num);
	}

	@Override
	public ReviewVO reviewInsert(ReviewVO rvo) throws Exception {
		int num = reviewdao.reviewSelectSeq();
		rvo.setNum(num);
		reviewdao.reviewInsert(rvo);
		return reviewdao.reviewInsertReturn(num);
	}

	@Override
	public void markingInsert(HashMap<Object, Object> hmap) {
		markingdao.markingInsert(hmap);
	}

	@Override
	public void markingDelete(HashMap<Object, Object> hmap) {
		markingdao.markingDelete(hmap);
	}

	@Override
	public int camp_site_seq() throws Exception {
		return campdao.camp_site_seq();
	}

	@Override
	public void camp_site_save(CampVO cvo) throws Exception {
		campdao.camp_site_save(cvo);
	}

	@Override
	public void camp_file_save(CampVO cvo) throws Exception {
		HashMap<Object, Object> hmap = new HashMap<Object, Object>();
		String[] saveFile = cvo.getCamp_filename();
		for (int i = 0; i < saveFile.length; i++) {
			if (saveFile[i] != null) {
				hmap.put("c_num", cvo.getNum());
				hmap.put("filename", saveFile[i]);
				filedao.fileInsert(hmap);
				hmap.clear();
			}
		}
	}

	@Override
	public void camp_notice_save(NoticeVO nvo) throws Exception {
		noticedao.camp_notice_save(nvo);
	}

	@Override
	public void camp_type_save(CTypeVO ctvo) throws Exception {
		ctypedao.camp_type_save(ctvo);
	}

	@Override
	public void camp_room_save(RoomVO rvo) throws Exception {
		HashMap<Object, Object> hmap = new HashMap<Object, Object>();
		HashMap<Object, Object> hmap2 = new HashMap<Object, Object>();
		String[] saveFile = rvo.getRoom_filename();
		for (int i = 0; i < rvo.getR_name().length; i++) {
			int num = roomdao.camp_room_seq();
			hmap2.put("num", num);
			hmap2.put("c_num", rvo.getC_num());
			hmap2.put("r_name", rvo.getR_name()[i]);
			hmap2.put("max_cnt", rvo.getMax_cnt()[i]);
			hmap2.put("basic_cnt", rvo.getBasic_cnt()[i]);
			hmap2.put("r_price", rvo.getR_price()[i]);
			roomdao.camp_room_save(hmap2);

			if (saveFile[i] != null) {
				hmap.put("c_num", rvo.getC_num());
				hmap.put("r_num", num);
				hmap.put("filename", saveFile[i]);
				filedao.fileInsert(hmap);
				hmap.clear();
			}

		}

	}

	@Override
	public List<CampVO> markingList(String id) {
		return markingdao.markingList(id);
	}

	@Override
	public List<RoomSelectVO> roomSelectList(int num) {
		return roomdao.roomSelectList(num);
	}

	@Override
	public List<CampVO> campSearchByType(HashMap<Object, Object> hmap) {
		return campdao.campSearchByType(hmap);
	}

	@Override
	public List<CampVO> mycampList(String id) {
		return campdao.mycampList(id);
	}

	@Override
	public List<FiledataVO> fileList() throws Exception {
		return filedao.fileList();
	}

	@Override
	public void campsiteStar(int c_num) throws Exception {
		campdao.campsiteStar(c_num);
	}
	
	@Override
	public List<FiledataVO> campFileList(int c_num) throws Exception {
		return filedao.campFileList(c_num);
	}
	
	@Override
	public NoticeVO campNoticeList(int c_num) throws Exception {
		return noticedao.campNoticeSelect(c_num);
	}
	
	
	@Override
	public void camp_mod(int c_num, CampVO cvo, NoticeVO nvo) throws Exception {
		campdao.camp_mod(cvo);
		ctypedao.camp_type_mod(c_num);
		filedao.camp_file_mod(c_num);
		nvo.setC_num(c_num);
		noticedao.camp_notice_mod(nvo);
		roomdao.camp_room_mod(c_num);
	}

	@Override
	public void camp_del(int num) throws Exception {
		campdao.camp_del(num);
	}

}
