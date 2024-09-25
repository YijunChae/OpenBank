package kopo.aisw.hc.apicontroller;

import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.support.SessionStatus;

import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import jakarta.servlet.http.HttpSession;
import kopo.aisw.hc.member.service.MemberService;
import kopo.aisw.hc.member.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/member/")
public class AMemberController {
	@Autowired
	MemberService ms;
	
	@PostMapping(value="credit-password", produces="application/json; charset=utf8")
	public ResponseEntity<Boolean> checkPw(@RequestParam(value = "creditPassword") String cp,
			HttpSession session) {
		MemberVO userVO = (MemberVO) session.getAttribute("userVO");
		userVO.setCreditPassword(cp);
		boolean result = ms.checkCreditPwd(userVO);
		log.info("CreditPassword check : "+userVO.getCustomerId()+" - result:"+result);
		return new ResponseEntity<>(result, HttpStatus.OK);
	}
	
	@PostMapping(value="password", produces="application/json; charset=utf8")
	public ResponseEntity<Boolean> checkPwd(@RequestParam(value = "password") String p,
			HttpSession session) {
		MemberVO userVO = (MemberVO) session.getAttribute("userVO");
		userVO.setPassword(p);
		boolean result = ms.checkPwd(userVO);
		log.info("Password check : "+userVO.getCustomerId()+" - result:"+result);
		return new ResponseEntity<>(result, HttpStatus.OK);
	}
	
	@DeleteMapping(value = "quit", produces = "application/text; charset=utf8")
	public String quit(@RequestBody MemberVO m, HttpSession session, SessionStatus state){
		MemberVO userVO = (MemberVO) session.getAttribute("userVO");
		if(m.getCustomerId()!=userVO.getCustomerId()) return "잘못된 접근입니다.";
		if(userVO.getCustomerType()==1) return "관리자는 해당 경로로 탈퇴할 수 없습니다.";
		boolean bool = ms.checkBirth(m);
		if(bool) {
			int a = ms.quitMember(m);
			if(a>0) {
				state.setComplete();
				return "탈퇴 처리가 완료되었습니다.";
			}
		}else {
			return "비밀번호가 맞지 않습니다.";
		}
		return "탈퇴 실패. 다시 시도해주세요.";
	}
}