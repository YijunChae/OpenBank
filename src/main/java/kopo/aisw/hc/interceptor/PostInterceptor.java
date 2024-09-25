package kopo.aisw.hc.interceptor;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.HandlerInterceptor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
/**
 * https://docs.spring.io/spring-framework/reference/web/webmvc/mvc-config/interceptors.html
 * interceptor를 쓰고싶었던 흔적
 * @author User
 *
 * 삭제시 applicationContext.xml -> interceptor 제거
 */
@Configuration
public class PostInterceptor implements HandlerInterceptor {

	@Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        // preHandle에서 HTTP 응답 코드 확인
        int statusCode = response.getStatus();
        if (statusCode == HttpServletResponse.SC_BAD_REQUEST) {
            // 400 코드가 오면 다른 화면으로 리다이렉트
            response.sendRedirect("/ob/"); 
            return false; 
        }
        return true; 
    }
}