package com.human.camp_hub;

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

import com.human.VO.BoardVO;
import com.human.VO.FiledataVO;
import com.human.VO.NoticeVO;
import com.human.VO.ReplyVO;
import com.human.VO.ReviewVO;
import com.human.service.IF_BoardService;
import com.human.service.IF_MemberService;
import com.human.util.FileDataUtil;

@Controller
public class BoardController {
	@Inject
	FileDataUtil filedatautil;

	@Inject 
	IF_BoardService boardsrv;
	
	@Inject 
	IF_MemberService membersrv;
	
	
	@ResponseBody
	@RequestMapping(value = "/review_mod", method = RequestMethod.POST)
	public HashMap<Object,Object> review_mod(Locale locale, Model model, @ModelAttribute("") ReviewVO rvo) throws Exception {
		HashMap<Object,Object> hmap = new HashMap<Object,Object>();
		boardsrv.review_mod(rvo);
		hmap.put("rv_con", rvo.getRv_con());
		return hmap;
	}
	@ResponseBody
	@RequestMapping(value = "/review_del", method = RequestMethod.POST)
	public void review_del(Locale locale, Model model, @RequestParam("num") int num) throws Exception {
		boardsrv.review_del(num);
	}
	
	
	@RequestMapping(value = "/myboard_list", method = RequestMethod.GET)
	public String myBoard(Locale locale, Model model, HttpSession session) throws Exception {
		String id = session.getAttribute("id").toString();
		List<BoardVO> mblist = boardsrv.myboardSelectList(id);
		model.addAttribute("mblist", mblist);
		return "myboard_list";
	}
	
	@RequestMapping(value = "/myreply_list", method = RequestMethod.GET)
	public String myReply(Locale locale, Model model, HttpSession session) throws Exception {
		String id = session.getAttribute("id").toString();
		List<ReplyVO> rplist = boardsrv.myreplySelectList(id);
		model.addAttribute("rplist", rplist);
		return "myreply_list";
	}
	
	@RequestMapping(value = "/myreview_list", method = RequestMethod.GET)
	public String myReview(Locale locale, Model model, HttpSession session) throws Exception {
		String id = session.getAttribute("id").toString();
		List<ReviewVO> relist = boardsrv.myreviewSelectList(id);
		model.addAttribute("relist", relist);
		
		return "myreview_list";
	}
	

	@RequestMapping(value = "/board_list", method = RequestMethod.GET)
	public String board_list(Locale locale, Model model,@RequestParam("b_type")String b_type) throws Exception {

		List<BoardVO> blist = boardsrv.boardSelectList(b_type); 
		model.addAttribute("blist", blist);
		model.addAttribute("b_type", b_type);

		return "board_list";
	}

	@RequestMapping(value = "/board_form", method = RequestMethod.POST)
	public String board_form(Locale locale, Model model,@RequestParam("b_type")String b_type) {

		model.addAttribute("b_type", b_type);
		return "board_form";
	}

	@RequestMapping(value = "/board_save", method = RequestMethod.POST)
	public String board_save(Locale locale, Model model,
			@ModelAttribute("") BoardVO bvo,
			HttpSession session,
			MultipartFile[] file) throws Exception{
		// 첨부파일 저장
		if(file!=null) {
			String[] newName=filedatautil.fileUpload(file);
			bvo.setFilename(newName);
		}
		// 게시판 글 저장
		bvo.setM_id(session.getAttribute("id").toString());
		boardsrv.boardInsertOne(bvo);
		membersrv.boardWritePoint(session.getAttribute("nick_name").toString());
		model.addAttribute("b_type", bvo.getB_type());
		return "redirect:/board_list";
	}

	@RequestMapping(value = "/board_detail", method = RequestMethod.GET)
	public String board_detail(Locale locale, Model model, @RequestParam("b_num") int b_num) throws Exception {
		HashMap<String,Integer> hmap = new HashMap<String,Integer>(); 
		hmap.put("b_num",b_num);
		boardsrv.boardUpdateViewCnt(b_num);
		model.addAttribute("bvo",boardsrv.boardSelectOne(b_num));
		model.addAttribute("flist",boardsrv.fileSelectList(hmap));
		model.addAttribute("replist",boardsrv.replySelectList(b_num));
		hmap.clear();
		return "detailBoard";
	}

	@ResponseBody
	@RequestMapping(value = "/input_reply", method = RequestMethod.POST)
	public ReplyVO input_reply(Locale locale, Model model, @ModelAttribute("") ReplyVO rvo
			,HttpSession session) throws Exception {
		rvo.setM_id(session.getAttribute("id").toString());
		membersrv.replyWritePoint(session.getAttribute("nick_name").toString());
		return boardsrv.replyInsert(rvo);
	}

	@ResponseBody
	@RequestMapping(value = "/reply_mod", method = RequestMethod.POST)
	public HashMap reply_mod(Locale locale, Model model, @ModelAttribute("") ReplyVO rvo) throws Exception {
		HashMap<Object,Object> hmap = new HashMap<Object,Object>();
		hmap.put("con", boardsrv.reply_mod(rvo));
		return hmap;
	}
	@ResponseBody
	@RequestMapping(value = "/reply_del", method = RequestMethod.POST)
	public void reply_modReturn(Locale locale, Model model, @RequestParam("num") int num) throws Exception {
		boardsrv.reply_del(num);
	}

	@ResponseBody
	@RequestMapping(value = "/detailBoard_love", method = RequestMethod.POST)
	public int detailBoard_love(Locale locale, Model model, 
			@RequestParam("num") int num,
			@RequestParam("nick_name")String nick_name) throws Exception {
		membersrv.lovePlus(nick_name);
		return boardsrv.detailBoard_love(num);
	}

	@ResponseBody
	@RequestMapping(value = "/reply_love", method = RequestMethod.POST)
	public int reply_love(Locale locale, Model model, 
			@RequestParam("num") int num,
			@RequestParam("nick_name")String nick_name) throws Exception {
		membersrv.lovePlus(nick_name);
		return boardsrv.reply_love(num);
	}

	@RequestMapping(value = "/detailBoard_del", method = RequestMethod.GET)
	public String detailBoard_del(Locale locale, Model model,
			@RequestParam("num")int num,
			@RequestParam("b_type")String b_type) throws Exception {
		HashMap<String,Integer> hmap = new HashMap<String,Integer>();
		hmap.put("b_num",num);
		List<FiledataVO> flist=boardsrv.fileSelectList(hmap);
		boardsrv.boardDeleteOne(num);

		for(int i=0;i<flist.size();i++) {
			filedatautil.fileDeleteOne(flist.get(i).getFilename());
		}
		model.addAttribute("b_type", b_type);
		return "redirect:/board_list";
	}

	@RequestMapping(value = "/detailBoard_mod_form", method = RequestMethod.POST)
	public String detailBoard_mod_form(Locale locale, Model model,
			@ModelAttribute("")BoardVO bvo) throws Exception {
		HashMap<String,Integer> hmap = new HashMap<String,Integer>();
		hmap.put("b_num",bvo.getNum());

		model.addAttribute("bvo", bvo);
		model.addAttribute("flist", boardsrv.fileSelectList(hmap));
		return "board_mod_form";
	}

	@RequestMapping(value = "/detailBoard_mod", method = RequestMethod.POST)
	public String detailBoard_mod(Locale locale, Model model,
			@ModelAttribute("")BoardVO bvo,
			@RequestParam("file")MultipartFile[] file,
			@RequestParam("deleteFilename")String [] delFile,
			@RequestParam("deleteNum")int[] delNum) throws Exception {
		for(int i=0;i<delFile.length;i++) {
			if(!delFile[i].equals("") && !delFile[i].equals(null)) {
				boardsrv.filedataDelete(delNum[i]);
				filedatautil.fileDeleteOne(delFile[i]);
			}
		}
		
		fileAttach(bvo,file);
		boardsrv.boardUpdate(bvo);
		model.addAttribute("b_num", bvo.getNum());
		return "redirect:/board_detail";
	}

	@RequestMapping(value = "/filedata_del", method = RequestMethod.GET)
	@ResponseBody
	public FiledataVO filedata_del(Locale locale, Model model,
			@RequestParam("num")int num,
			@RequestParam("filename")String filename) throws Exception {
		boardsrv.filedataDelete(num);
		filedatautil.fileDeleteOne(filename);
		return null;
	}	

	// 첨부파일 저장
	private void fileAttach(BoardVO bvo, MultipartFile [] file) throws Exception {

		if(file!=null) {
			String[] newName=filedatautil.fileUpload(file);
			bvo.setFilename(newName);
			boardsrv.fileInsert(bvo);
		}
	}

	@RequestMapping(value = "/notice_list", method = RequestMethod.GET)
	public String notice_list(Locale locale, Model model) throws Exception {
		List<NoticeVO> nlist = boardsrv.noticeSelectList(); 
		model.addAttribute("nlist", nlist);
		return "notice_list";
	}

	@RequestMapping(value = "/notice_form", method = RequestMethod.POST)
	public String notice_form(Locale locale, Model model) {
		return "notice_form";
	}

	@RequestMapping(value = "/notice_save", method = RequestMethod.POST)
	public String notice_save(Locale locale, Model model,
			@ModelAttribute("") NoticeVO nvo,
			HttpSession session
			) throws Exception{
		if(session.getAttribute("grade").equals("admin")) {
			nvo.setC_num(0);// 관리자의 c_num은 0 이다.
		}else if(session.getAttribute("grade").equals("owner")) {

		}
		boardsrv.noticeInsertOne(nvo);
		return "redirect:/notice_list";
	}

	@RequestMapping(value = "/notice_detail", method = RequestMethod.GET)
	public String notice_detail(Locale locale, Model model, @RequestParam("n_num")int num) throws Exception {
		model.addAttribute("nvo", boardsrv.noticeSelectOne(num));
		return "detailNotice";
	}

	@RequestMapping(value = "/notice_mod_form", method = RequestMethod.POST)
	public String notice_mod_form(Locale locale, Model model,
			@ModelAttribute("")NoticeVO nvo) throws Exception {

		model.addAttribute("nvo", nvo);
		return "notice_mod_form";
	}

	@RequestMapping(value = "/notice_mod", method = RequestMethod.POST)
	public String notice_mod(Locale locale, Model model,
			@ModelAttribute("")NoticeVO nvo) throws Exception {
		boardsrv.noticeUpdate(nvo);
		model.addAttribute("n_num", nvo.getNum());
		return "redirect:/notice_detail";
	}

	@RequestMapping(value = "/notice_del", method = RequestMethod.GET)
	public String notice_del(Locale locale, Model model,
			@RequestParam("num")int num) throws Exception {
		boardsrv.noticeDeleteOne(num);
		return "redirect:/notice_list";
	}






}
