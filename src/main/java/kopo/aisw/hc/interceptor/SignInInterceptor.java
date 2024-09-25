package kopo.aisw.hc.interceptor;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.HandlerInterceptor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kopo.aisw.hc.member.vo.MemberVO;
/**
 * https://docs.spring.io/spring-framework/reference/web/webmvc/mvc-config/interceptors.html
 * interceptor를 쓰고싶었던 흔적
 * @author User
 *
 * 삭제시 applicationContext.xml -> interceptor 제거
 */
@Configuration
@SessionAttributes({"preUrl"})
public class SignInInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res,
			Object obj) throws Exception {
		HttpSession session = req.getSession();
		MemberVO userVO = (MemberVO) session.getAttribute("userVO");

		if(userVO!=null) {
			return true;
		}else{
			String previousUrl = req.getRequestURI();
	        req.getSession().setAttribute("preUrl", previousUrl);
	        res.sendRedirect("/ob/member/signIn");
			return false;
		}
	}
}