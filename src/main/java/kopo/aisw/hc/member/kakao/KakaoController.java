package kopo.aisw.hc.member.kakao;

import java.io.IOException;
import java.time.ZoneId;
import java.time.ZonedDateTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;

import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kopo.aisw.hc.api.Api;
import kopo.aisw.hc.member.service.MemberService;
import kopo.aisw.hc.member.vo.MemberVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@SessionAttributes({"userVO"})
@RequiredArgsConstructor
@RequestMapping("/member")
public class KakaoController {
	@Autowired
	private Api api;
	
	@Autowired
	private KakaoService ks;

	@Autowired
	private MemberService ms;
	
    @GetMapping("/kakao-login")
    public void callback(Model m, @RequestParam("code") String code,
    					HttpSession session, HttpServletResponse response) {
    	KakaoVO accessToken = ks.getAccessTokenFromKakao(code, api.getKakaoRest());
    	MemberVO member = ks.kakaoToMember(accessToken);
    	String preUrl = (String) session.getAttribute("preUrl");
    	
    	try {
    		// 기존 회원 체크 - 이름/주민번호/전화번호
    		// 회원이 아니면 가입절차 후 로그인
    		if(ms.humanDoubleCheck(member).getName()==null) ms.signUp(member);
    		else if(ms.humanDoubleCheck(member).getUserId()==null) ms.updateBankId(member);
	    	member = ms.signIn(member);
	    	
	    	ZonedDateTime nowSeoul = ZonedDateTime.now(ZoneId.of("Asia/Seoul"));
			if(member==null) {
				m.addAttribute("loginChk", false);
				log.info("Login fail : "+nowSeoul+"-"+member);
			}else {
				member.setPassword(null);
				log.info("Login Success : "+nowSeoul+"-"+member);
				m.addAttribute("userVO", member);
			}
			
			if(preUrl!=null)
				response.sendRedirect(preUrl);
			else
				response.sendRedirect("/ob/");
    	}catch(Exception e) {
    		try {
	    	    response.getWriter().println("<script type='text/javascript'>");
	    	    response.getWriter().println("alert('카카오 로그인에 실패했습니다. \n문제가 반복될 시 관리자에게 문의주세요.');");
	    	    response.getWriter().println("window.location.href='"+preUrl+"';");
	    	    response.getWriter().println("</script>");
	
	    	    // 응답 플러시
				response.getWriter().flush();
			} catch (IOException e1) {
				e1.printStackTrace();
				log.error("??: 이 오류는 대체 왜 나는 거니. 머리는 모자를 쓰라고 있는 게 아니야.");
			}
    	}
    }
//    @GetMapping("/test")
//    public String testing() {
//    	// autowired테스트
//    	System.out.println(ks!=null);
//    	return "oldIndex";
//    }
}