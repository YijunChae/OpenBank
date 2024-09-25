package kopo.aisw.hc.api;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;

//@Component
//@ComponentScan(value = "application-API-KEY.properties")
@Configuration
@PropertySource("classpath:application-API-KEY.properties")
@ComponentScan(basePackages ={"kopo.aisw.hc",
							"kopo.aisw.hc.member.kakao"})
public class ApiConfig {
	
	@Value("${JUSO}")
	private String juso;
	
	@Value("${KAKAO-REST}")
	private String kakaoRest;
	
	@Value("${KAKAO-JS}")
	private String kakaoJs;
	
	@Bean
	public Api api() {
		Api api = new Api();
		api.setJuso(juso);
		api.setKakaoRest(kakaoRest);
		api.setKakaoJs(kakaoJs);
		return api;
	}
	
}