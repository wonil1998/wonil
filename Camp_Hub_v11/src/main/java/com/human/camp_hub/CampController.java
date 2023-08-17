package com.human.camp_hub;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.human.VO.CTypeNameVO;
import com.human.VO.CTypeVO;
import com.human.VO.CampVO;
import com.human.VO.FiledataVO;
import com.human.VO.NoticeVO;
import com.human.VO.ReviewVO;
import com.human.VO.RoomSelectVO;
import com.human.VO.RoomVO;
import com.human.service.IF_CampService;
import com.human.service.IF_MemberService;
import com.human.util.FileDataUtil;

@Controller
public class CampController {
	@Inject
	FileDataUtil filedatautil;
	@Inject
	IF_CampService campsrv;
	
	@Inject
	IF_MemberService membersrv;
	
	
	@RequestMapping(value = "/camp_list", method = RequestMethod.GET)
	public String camp_list(Model model) throws Exception {
		List<CTypeNameVO> ct = campsrv.checkType();
		model.addAttribute("ct", ct);
		List<CampVO> clist = campsrv.campSelectList();
		List<FiledataVO> flist = campsrv.fileList();

		for (FiledataVO file : flist) {
			for (CampVO camp : clist) {
				if (file.getC_num() == camp.getNum()) {
					camp.setFilename(file.getFilename());
					;
					break;
				}
			}
		}

		model.addAttribute("clist", clist);
		return "camp_list";
	}

	@RequestMapping(value = "/marking_list", method = RequestMethod.GET)
	public String marking_list(Locale locale, Model model, HttpSession session) throws Exception {
		String id = session.getAttribute("id").toString();
		List<CampVO> mclist = campsrv.markingList(id);
		if(mclist!=null || mclist.size() !=0) {
			List<FiledataVO> flist = campsrv.fileList();
			for (FiledataVO file : flist) {
				for (CampVO camp : mclist) {
					if (file.getC_num() == camp.getNum()) {
						camp.setFilename(file.getFilename());
						;
						break;
					}
				}
			}
		}
		model.addAttribute("mclist", mclist);
		return "marking_list";
	}

	@RequestMapping(value = "/mycamp_list", method = RequestMethod.GET)
	public String mycamp_list(Locale locale, Model model, HttpSession session) throws Exception {
		String id = session.getAttribute("id").toString();
		List<CampVO> mclist = campsrv.mycampList(id);
		if(mclist!=null || mclist.size() !=0) {
			List<FiledataVO> flist = campsrv.fileList();
			for (FiledataVO file : flist) {
				for (CampVO camp : mclist) {
					if (file.getC_num() == camp.getNum()) {
						camp.setFilename(file.getFilename());
						;
						break;
					}
				}
			}
		}
		
		
		model.addAttribute("mclist", mclist);
		return "mycamp_list";
	}

	// 캠핑장 지도 검색하기
	@RequestMapping(value = "/camp_search", method = RequestMethod.GET)
	public String camp_search(Locale locale, Model model) {

		return "camp_search";
	}

	// 캠핑장 시 도 검색하기
	@RequestMapping(value = "/campSearchList", method = RequestMethod.POST)
	@ResponseBody
	public List<CampVO> campSearchList(@RequestParam("addr_do") String addr_do, @RequestParam("addr_si") String addr_si)
			throws Exception {

		HashMap<String, String> hmap = new HashMap<String, String>();
		if (addr_do != null) {
			hmap.put("addr_do", addr_do);
		}
		if (addr_si != null) {
			hmap.put("addr_si", addr_si);
		}

		List<CampVO> clist = campsrv.campSearchList(hmap);
		if(clist!=null || clist.size() !=0) {
			List<FiledataVO> flist = campsrv.fileList();
			for (FiledataVO file : flist) {
				for (CampVO camp : clist) {
					if (file.getC_num() == camp.getNum()) {
						camp.setFilename(file.getFilename());
						;
						break;
					}
				}
			}
		}

		return clist;
	}

	// 캠핑장 검색하기
	@RequestMapping(value = "/campSearchWord", method = RequestMethod.POST)
	@ResponseBody
	public List<CampVO> campSearchWord(@RequestParam("c_name") String c_name) throws Exception {

		HashMap<String, String> hmap = new HashMap<String, String>();
		if (c_name != null) {
			hmap.put("c_name", c_name);
		}

		List<CampVO> clist = campsrv.campSearchList(hmap);
		if(clist!=null || clist.size() !=0) {
			List<FiledataVO> flist = campsrv.fileList();
			for (FiledataVO file : flist) {
				for (CampVO camp : clist) {
					if (file.getC_num() == camp.getNum()) {
						camp.setFilename(file.getFilename());
						;
						break;
					}
				}
			}
		}
		
		return clist;

	}

	// 캠핑장 검색하기
	@RequestMapping(value = "/campSearchByType", method = RequestMethod.POST)
	@ResponseBody
	public List<CampVO> campSearchByType(@RequestParam(value = "c_type[]", required = false) String[] c_type) throws Exception {
	    HashMap<Object, Object> hmap = new HashMap<Object, Object>();
	    
	    if (c_type != null) {
	        hmap.put("cTypes", c_type);
	        List<CampVO> clist = campsrv.campSearchByType(hmap);
	    	if(clist!=null || clist.size() !=0) {
				List<FiledataVO> flist = campsrv.fileList();
				for (FiledataVO file : flist) {
					for (CampVO camp : clist) {
						if (file.getC_num() == camp.getNum()) {
							camp.setFilename(file.getFilename());
							;
							break;
						}
					}
				}
			}
	        return clist;
	    } else {
	        return null;
	    }
	}

	@RequestMapping(value = "/detailCamp", method = RequestMethod.GET)
	public String detailCamp(Model model, HttpSession session, @RequestParam("num") int num) throws Exception {
		List<CTypeVO> ct = campsrv.camp_type_check(num);
		model.addAttribute("ct", ct);

		String id = session.getAttribute("id").toString();

		HashMap<Object, Object> hmap = new HashMap<Object, Object>();
		hmap.put("id", id);
		hmap.put("num", num);
		boolean mchk = campsrv.markingChk(hmap); // 내가 즐겨찾기 한 곳이면 true, 아니면 false
		List<ReviewVO> rlist = campsrv.reviewSelectList(num);
		List<RoomSelectVO> roomlist = campsrv.roomSelectList(num);

		model.addAttribute("mchk", mchk);
		model.addAttribute("cvo", campsrv.campSelectOne(num));
		model.addAttribute("rlist", rlist);
		model.addAttribute("reviewCnt", rlist.size());
		model.addAttribute("cflist",campsrv.campFileList(num));
		model.addAttribute("roomlist", roomlist);
		model.addAttribute("notice",campsrv.campNoticeList(num));

		return "detailCamp";
	}

	@ResponseBody
	@RequestMapping(value = "/input_review", method = RequestMethod.POST)
	public ReviewVO input_review(Locale locale, Model model, @ModelAttribute("") ReviewVO rvo
			,HttpSession session) throws Exception {
		rvo.setM_id(session.getAttribute("id").toString());
		ReviewVO ReRvo = campsrv.reviewInsert(rvo);
		campsrv.campsiteStar(rvo.getC_num());
		membersrv.reviewWritePoint(session.getAttribute("nick_name").toString());
		return ReRvo;
	}

	@ResponseBody
	@RequestMapping(value = "/insert_marking", method = RequestMethod.POST)
	public void insert_marking(Locale locale, Model model, @RequestParam("c_num") int c_num, HttpSession session)
			throws Exception {
		String id = session.getAttribute("id").toString();

		HashMap<Object, Object> hmap = new HashMap<Object, Object>();
		hmap.put("m_id", id);
		hmap.put("c_num", c_num);
		campsrv.markingInsert(hmap);

	}

	@ResponseBody
	@RequestMapping(value = "/delete_marking", method = RequestMethod.POST)
	public void delete_marking(Locale locale, Model model, @RequestParam("c_num") int c_num, HttpSession session)
			throws Exception {
		String id = session.getAttribute("id").toString();

		HashMap<Object, Object> hmap = new HashMap<Object, Object>();
		hmap.put("m_id", id);
		hmap.put("c_num", c_num);
		campsrv.markingDelete(hmap);

	}

	@RequestMapping(value = "/camp_form", method = RequestMethod.GET)
	public String camp_form(Model model) throws Exception {
		List<CTypeNameVO> ct = campsrv.checkType();

		model.addAttribute("ct", ct);

		return "camp_form";
	}

	@RequestMapping(value = "/camp_save", method = RequestMethod.POST)
	public String camp_save(Model model, HttpSession session, @RequestParam("file1") MultipartFile[] file1,
			@RequestParam("file2") MultipartFile[] file2,
			@RequestParam(value = "c_type", required = false) String[] c_type, @ModelAttribute("") CampVO cvo,
			@ModelAttribute("") FiledataVO fvo, @ModelAttribute("") NoticeVO nvo, @ModelAttribute("") RoomVO rvo)
			throws Exception {

//		campsite 저장
		int c_num = campsrv.camp_site_seq();
		cvo.setNum(c_num);
		cvo.setM_id(session.getAttribute("id").toString());
		campsrv.camp_site_save(cvo);

//		캠핑장 filedata 저장 
		String[] newName = filedatautil.fileUpload(file1);
		cvo.setCamp_filename(newName);
		campsrv.camp_file_save(cvo);

//		notice 저장
		nvo.setC_num(c_num);
		campsrv.camp_notice_save(nvo);

//		camp_type 저장
		CTypeVO ctvo = new CTypeVO();
		if(c_type[0]!="" || c_type[0]!=null) {
			for (int i = 0; i < c_type.length; i++) {
				int idx = c_type[i].indexOf("/");
				ctvo.setC_num(c_num);
				ctvo.setC_type(c_type[i].substring(0, idx));
				ctvo.setC_group(c_type[i].substring(idx + 1));
				campsrv.camp_type_save(ctvo);
			}
		}
		

//		room 저장
		rvo.setC_num(c_num);
		if (file2 != null) {
			String[] newName2 = filedatautil.fileUpload(file2);
			rvo.setRoom_filename(newName2);
		}
		campsrv.camp_room_save(rvo);
		return "redirect:/camp_list";
	}

	@RequestMapping(value = "/camp_mod_form", method = RequestMethod.GET)
	public String camp_mod_form(Model model, @RequestParam("num") int num) throws Exception {
		List<FiledataVO> fvo = campsrv.campFileList(num);
		
		for(int i=0;i<5;i++) {
			if(i>=fvo.size()) {
				model.addAttribute("cflist"+i,null);
			}else {
				model.addAttribute("cflist"+i,fvo.get(i));
			}
		}
		
		model.addAttribute("cvo",campsrv.campSelectOne(num));
		model.addAttribute("notice",campsrv.campNoticeList(num));
		List<CTypeNameVO> ct = campsrv.checkType();
		model.addAttribute("ct", ct);
		List<RoomSelectVO> rsvo = campsrv.roomSelectList(num);
		model.addAttribute("roomlist",rsvo);
		return "camp_mod_form";
		
	}
	//캠프 수정
	@RequestMapping(value = "/camp_mod_save", method = RequestMethod.POST)
	public String camp_mod_save(Model model,HttpSession session,
			@RequestParam("file1") MultipartFile[] file1,
			@RequestParam("file2") MultipartFile[] file2,
			@RequestParam(value="c_type", required = false) String[] c_type,
			@ModelAttribute("") CampVO cvo, 
			@ModelAttribute("") FiledataVO fvo,
			@ModelAttribute("") NoticeVO nvo, 
			@ModelAttribute("") RoomVO rvo) throws Exception {
		int c_num=cvo.getNum();
		campsrv.camp_mod(c_num, cvo, nvo);
//		캠핑장 filedata 저장 
		if(file1!=null) {
			String[] newName=filedatautil.fileUpload(file1);
			cvo.setCamp_filename(newName);
			campsrv.camp_file_save(cvo);
		}
		
//		camp_type 저장
		CTypeVO ctvo = new CTypeVO();
		if(c_type[0]!=null ||c_type[0]!="" ) {
			for(int i=0;i<c_type.length;i++) {
				int idx = c_type[i].indexOf("/"); 
				ctvo.setC_num(c_num);
				ctvo.setC_type(c_type[i].substring(0,idx));
				ctvo.setC_group(c_type[i].substring(idx+1));
				campsrv.camp_type_save(ctvo);
			}
		}

//		room 저장
		rvo.setC_num(c_num);
		if(file2!=null||file2.length!=0) {
			String[] newName2=filedatautil.fileUpload(file2);
			rvo.setRoom_filename(newName2);
		}
		campsrv.camp_room_save(rvo);
		return "redirect:/camp_list";
	}
	//캠프 삭제
	@RequestMapping(value = "/camp_del", method = RequestMethod.GET)
	public String camp_del(Model model, @RequestParam("num") int num) throws Exception {
		campsrv.camp_del(num);
		
		return "redirect:/camp_list";
	}
}
