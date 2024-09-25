package kopo.aisw.hc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpSession;
import kopo.aisw.hc.member.service.MemberService;
import kopo.aisw.hc.member.vo.MemberVO;
import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
public class BankController {
	
	@Autowired
	MemberService ms;
	
	@RequestMapping("/")
	public String bankMain() {
		log.info("Bank Start (L)");
		return "bankMain";
	}
	
	@RequestMapping("/about")
	public String about(){
		return "example/about";
	}
	@RequestMapping("/work")
	public String work(){
		return "example/work";
	}
	@RequestMapping("/work-single")
	public String workSingle(){
		return "example/work-single";
	}
	@RequestMapping("/pricing")
	public String pricing(){
		return "example/pricing";
	}
	@RequestMapping("/contact")
	public String contact(HttpSession session, Model m){
		MemberVO userVO = (MemberVO) session.getAttribute("userVO");
		userVO = ms.getProfile(userVO);
		m.addAttribute("profile", userVO);
		return "example/contact";
	}
	@RequestMapping("/testing")
	public String infScroll() {
		return "test";
	}
}
