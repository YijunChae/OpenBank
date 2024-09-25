package kopo.aisw.hc.json;

import java.io.IOException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kopo.aisw.hc.member.vo.MemberVO;

public class JsonKeyFilter implements Filter {

	private static final String API_KEY_HEADER = "Authorization";
	private StringBuilder API_KEY_VALUE = new StringBuilder("CBKey ");
	private static final String ID = "customerId";
	
	public String getKey(HttpSession session) {
		String key = (String) session.getAttribute("CBKey");
		return key;
	}
	@Override
	public void doFilter(ServletRequest sRequest, ServletResponse sResponse,
						FilterChain chain) throws IOException, ServletException {

		HttpServletRequest request = (HttpServletRequest) sRequest;
        HttpServletResponse response = (HttpServletResponse) sResponse;

        HttpSession session = request.getSession(false); // 세션이 존재하지 않으면 null 반환
        MemberVO userVO = (session != null) ? (MemberVO) session.getAttribute("userVO") : null;
        if(userVO.getCustomerId()==0) {
        	response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
        	response.getWriter().write("Unauthorized");
        	return;
        };
        
        /**
        String header = request.getHeader(ID);
        if (header == null || !header.equals(API_KEY_VALUE.toString())) {
        }
        // 요청 헤더에서 Authorization 헤더 값을 가져옴
        header = request.getHeader(API_KEY_HEADER);

        // Authorization 헤더가 없거나 값이 일치하지 않으면 접근 금지
        if (header == null || !header.equals(API_KEY_VALUE.toString())) {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            response.getWriter().write("Unauthorized");
            return;
        }
         */

        // 위 조건에 걸리지 않으면 요청을 계속 처리
        chain.doFilter(request, response);


	}

}
