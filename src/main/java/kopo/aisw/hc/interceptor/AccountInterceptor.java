package kopo.aisw.hc.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kopo.aisw.hc.account.vo.AccountVO;
import kopo.aisw.hc.member.vo.MemberVO;

public class AccountInterceptor implements HandlerInterceptor {

	@Override
    public void afterCompletion(HttpServletRequest req, HttpServletResponse res, Object handler, Exception ex) throws Exception {
		if ("POST".equalsIgnoreCase(req.getMethod())) {
			HttpSession session = req.getSession();
			MemberVO userVO = (MemberVO) session.getAttribute("userVO");
			AccountVO acc = (AccountVO) session.getAttribute("account");
	
			if(userVO.getCustomerId()!=acc.getCustomerId()&&!acc.getAvaliable().equals("1")) {
				res.sendRedirect("/ob/account/");
			}
			return;
		}
    }
	
}