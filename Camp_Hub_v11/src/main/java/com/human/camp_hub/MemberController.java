package com.human.camp_hub;

import java.util.HashMap;
import java.util.Locale;
import java.util.Random;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.human.VO.MemberVO;
import com.human.service.IF_MemberService;

@Controller
public class MemberController {
	@Autowired
	private JavaMailSender mailSender;
	
	@Inject
	IF_MemberService membersrv;
	
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join_form(Model model) {
		
		return "join";
	}
	
	@RequestMapping(value = "/join_save", method = RequestMethod.POST)
	public String join_save(Model model,@ModelAttribute("") MemberVO mvo) throws Exception {
		membersrv.memberInsert(mvo);
		return "home";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Model model) throws Exception {
		return "login";
	}
	@RequestMapping(value = "/login_chk", method = RequestMethod.POST)
	public String login_chk(Model model,HttpSession session,@ModelAttribute("") MemberVO mvo) throws Exception {
		mvo =  membersrv.loginChk(mvo);
		if(mvo==null) {
			model.addAttribute("notLogin","로그인 정보가 없습니다");
			return "login";
		}else {
			session.setAttribute("id", mvo.getId());
			session.setAttribute("mname", mvo.getMname());
			session.setAttribute("nick_name", mvo.getNick_name());
			session.setAttribute("point", mvo.getPoint());
			session.setAttribute("grade", mvo.getGrade());
			session.setAttribute("indate", mvo.getIndate());
		}
		return "home";
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(Model model,HttpSession session){
		
		session.invalidate();
		return "home";
	}
	
	@RequestMapping(value = "/delete_account", method = RequestMethod.GET)
	public String delete_account(Model model,HttpSession session) throws Exception{
		String id = (String) session.getAttribute("id");
		membersrv.delete_account(id);
		session.invalidate();
		return "home";
	}
	
	@RequestMapping(value = "/myInfo", method = RequestMethod.GET)
	public String myInfo(Model model,HttpSession session) throws Exception {
		MemberVO mvo = new MemberVO();
		String id = (String) session.getAttribute("id");
		mvo.setId(id);
		mvo =  membersrv.loginChk(mvo);
		session.setAttribute("nick_name", mvo.getNick_name());
		session.setAttribute("point", mvo.getPoint());
		session.setAttribute("grade", mvo.getGrade());
		return "myInfo";
	}
	// 아이디 중복체크
	   @RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	   @ResponseBody
	   public int idCheck(@RequestParam("id") String id) throws Exception {
	      int cnt = membersrv.idCheck(id);
	      return cnt;
	   }

	@RequestMapping(value = "/pw_update", method = RequestMethod.POST)
	@ResponseBody
	public String pw_update(Model model, HttpSession session,@RequestParam("pw") String pw) throws Exception {
		
		String id = (String) session.getAttribute("id");
		boolean pwChk = membersrv.memberPwCheck(id,pw);
	    return Boolean.toString(pwChk);
	}
	
	@RequestMapping(value = "/pw_mod", method = RequestMethod.GET)
	public String pw_mod(Model model,HttpSession session) {
		
		return "pw_mod";
	}
	
	@RequestMapping(value = "/nick_name_update", method = RequestMethod.POST)
	public String nick_name_update(Model model,HttpSession session,@RequestParam("nick_name") String nick_name) throws Exception {
		String id = (String)session.getAttribute("id");
		if(nick_name!=null || !nick_name.isEmpty()) {
			membersrv.memberUpdate_nick_name(id, nick_name);
			session.setAttribute("nick_name", nick_name);
		}
		return "redirect:/myInfo";
	}
	
	@RequestMapping(value = "/pw_mod_update", method = RequestMethod.POST)
	public String pw_mod_update(Model model,HttpSession session,@RequestParam("pw") String pw) throws Exception {
		String id = (String)session.getAttribute("id");
		if(pw!=null || !pw.isEmpty()) {
			membersrv.memberUpdate_pw(id, pw);
		}
		return "myInfo";
	}
	
	////////////////////////////////////////////////////////////
	@RequestMapping(value="/sendmail",method= RequestMethod.POST)
	@ResponseBody
	public String sendmail(Locale locale, Model model,
			@RequestParam("tomail")String tomail) throws Exception {
		
		String chkCode="code";
		
		// 랜덤한 본인인증 코드를 생성
		Random random = new Random();
		StringBuffer buf = new StringBuffer();
		for(int i=0;i<10;i++) {
			if(random.nextBoolean()) {
				buf.append((char)((int)(random.nextInt(26))+97));
			}else {
				buf.append(random.nextInt(10));
			}
		}
		chkCode=buf.toString(); 
		// 메일 정보 입력
        String from = "발신자 이메일 주소";
        String to = tomail;
        String subject = "캠핑 허브 가입 본인 인증 코드";
       
        String text = "다음을 입력하시오 : "+chkCode;

        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom(from);
        message.setTo(to);
        message.setSubject(subject);
        message.setText(text);

        try {
            mailSender.send(message);
        } catch (MailException ex) {
            System.err.println("이메일 전송 중 오류 발생: " + ex.getMessage());
        }
		return chkCode;
	}
	
	@RequestMapping(value = "/find_id_form", method = RequestMethod.GET)
	public String find_id_form(Model model,HttpSession session) throws Exception {

		return "find_id_form";
	}
	
	@RequestMapping(value = "/id_mailChk", method = RequestMethod.POST)
	@ResponseBody
	public int id_mailChk(Model model,HttpSession session,
			@RequestParam("tomail")String email,
			@RequestParam("mname")String mname) throws Exception {
		HashMap<String,String> hmap=new HashMap<String,String>();
		hmap.put("mname",mname);
		hmap.put("email",email);
		return membersrv.id_emailCheck(hmap);
	}
	
	@RequestMapping(value = "/find_id", method = RequestMethod.POST)
	@ResponseBody
	public String find_id(Model model,HttpSession session,
			@RequestParam("mname")String mname,
			@RequestParam("tomail")String email) throws Exception {
		HashMap<String,String> hmap=new HashMap<String,String>();
		hmap.put("mname",mname);
		hmap.put("email",email);
		return membersrv.findId(hmap);
	}
	
	@RequestMapping(value = "/find_pw_form", method = RequestMethod.GET)
	public String find_pw_form(Model model,HttpSession session) throws Exception {

		return "find_pw_form";
	}
	
	@RequestMapping(value = "/pw_mailChk", method = RequestMethod.POST)
	@ResponseBody
	public int pw_mailChk(Model model,HttpSession session,
			@RequestParam("tomail")String email,
			@RequestParam("id")String id) throws Exception {
		HashMap<String,String> hmap=new HashMap<String,String>();
		hmap.put("id",id);
		hmap.put("email",email);
		return membersrv.pw_emailCheck(hmap);
	}
	
	@RequestMapping(value = "/find_pw", method = RequestMethod.POST)
	@ResponseBody
	public String find_pw(Model model,HttpSession session,
			@RequestParam("id")String id,
			@RequestParam("tomail")String email) throws Exception {
		HashMap<String,String> hmap=new HashMap<String,String>();
		hmap.put("id",id);
		hmap.put("email",email);
		return membersrv.findPw(hmap);
	}

}
