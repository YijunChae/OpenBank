package kopo.aisw.hc.member.kakao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import kopo.aisw.hc.member.dao.MemberDAO;
import kopo.aisw.hc.member.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class KakaoService {
	
    private final String KAUTH_TOKEN_URL_HOST="https://kauth.kakao.com";
    private final String KAUTH_USER_URL_HOST= "https://kapi.kakao.com";

    @Autowired
    MemberDAO mDao;
    
    @Autowired
    HttpCallService httpCallService;
    
    public KakaoVO getAccessTokenFromKakao(String code, String clientId) {
        log.info(code+"\t"+clientId);
    	RestTemplate restTemplate = new RestTemplate();
        String url = KAUTH_TOKEN_URL_HOST + "/oauth/token";

        HttpHeaders headers = new HttpHeaders();
        headers.set("Content-Type", "application/x-www-form-urlencoded");

        String requestBody = String.format(
            "grant_type=authorization_code&client_id=%s&code=%s", 
            clientId, 
            code
        );
        HttpEntity<String> request = new HttpEntity<>(requestBody, headers);

        ResponseEntity<KakaoVO> response = restTemplate.exchange(
            url, 
            HttpMethod.POST, 
            request, 
            KakaoVO.class
        );

        KakaoVO kakaoRes = response.getBody();

        log.info(" [Kakao Service] Access Token ------> {}", kakaoRes.getAccessToken());
        log.info(" [Kakao Service] Refresh Token ------> {}", kakaoRes.getRefreshToken());
        log.info(" [Kakao Service] Id Token ------> {}", kakaoRes.getIdToken());
        log.info(" [Kakao Service] Scope ------> {}", kakaoRes.getScope());

        return getKakaoUserCode(kakaoRes);
    }
    
    public KakaoVO getKakaoUserCode(KakaoVO KToken) {
        String url = KAUTH_USER_URL_HOST+"/v2/user/me";
        HttpHeaders headers = new HttpHeaders();
        headers.set("Authorization", "Bearer "+KToken.getAccessToken());
        HttpEntity<String> request = new HttpEntity<>(headers);
        
        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<KakaoVO> response = restTemplate.exchange(
            url, 
            HttpMethod.POST, 
            request, 
            KakaoVO.class
        );
        KakaoVO kakaoRes = response.getBody();
        httpCallService.CallwithToken("GET", url, KToken.getAccessToken());
        return kakaoRes;
    }
    
    //회원가입처리용
    public MemberVO kakaoToMember(KakaoVO kakaouser) {
    	MemberVO m = new MemberVO();
    	m.setUserId(kakaouser.getId()+"");
    	//수정되어야 할 로직
    	m.setPassword(mDao.Hashing(m.getUserId()));
    	
    	m.setName(kakaouser.getKakaoAccount().getName());
    	m.setEmail(kakaouser.getKakaoAccount().getEmail());
    	m.setPhoneNum("0"+kakaouser.getKakaoAccount().getPhoneNumber().substring(4).replace("-",""));
    	int gender;
    	if(kakaouser.getKakaoAccount().getGender().equals("female"))
    		gender = 2;
    	else
    		gender = 1;
    	if(Integer.parseInt(kakaouser.getKakaoAccount().getBirthyear())>1999)
    		gender++;
    	
    	m.setRrn(kakaouser.getKakaoAccount().getBirthyear().substring(2)
    			+kakaouser.getKakaoAccount().getBirthday()
    			+gender);
    	
    	//address not null 에러방지용 로직
    	m.setAddress("-");
    	m.setAddressDetail("-");
    	System.out.println(m);
    	return m;
    }
    
//	@Autowired
//	public HttpCallService httpCallService;
//	
//
//	private String REST_API_KEY;
//	
//	private String REDIRECT_URI;	
//	
//	private String AUTHORIZE_URI;		
//	
//	public String TOKEN_URI;			
//	
//	private String CLIENT_SECRET;	
//	
//	private String KAKAO_API_HOST;	
//	
//	
//	public RedirectView goKakaoOAuth() {
//       return goKakaoOAuth("");
//	}
//	
//	public RedirectView goKakaoOAuth(String scope) {
//	   
//	   String uri = AUTHORIZE_URI+"?redirect_uri="+REDIRECT_URI+"&response_type=code&client_id="+REST_API_KEY;
//	   if(!scope.isEmpty()) uri += "&scope="+scope;
//			   
//       return new RedirectView(uri);
//	}	
//	
//	public RedirectView loginCallback(String code, String token, HttpSession httpSession) {	
//		String param = "grant_type=authorization_code&client_id="+REST_API_KEY+"&redirect_uri="+REDIRECT_URI+"&client_secret="+CLIENT_SECRET+"&code="+code;
//		String rtn = httpCallService.Call("POST", token, "", param);
//        httpSession.setAttribute("token", Trans.token(rtn, new JsonParser()));     		
//		return new RedirectView("/index.html");
//	}
//			
//	public String getProfile() {	
//		String uri = KAKAO_API_HOST + "/v2/user/me";
//		return httpCallService.CallwithToken(Const.GET, uri, httpSession.getAttribute("token").toString());
//	}
//	
//	public String getFriends() {	
//		String uri = KAKAO_API_HOST + "/v1/api/talk/friends";
//		return httpCallService.CallwithToken(Const.GET, uri, httpSession.getAttribute("token").toString());
//	}	
//	
//	public String message() {	
//		String uri = KAKAO_API_HOST + "/v2/api/talk/memo/default/send";
//		return httpCallService.CallwithToken(Const.POST, uri, httpSession.getAttribute("token").toString(), Trans.default_msg_param);
//	}		
//	
//	public String friendMessage(String uuids) {	
//		String uri = KAKAO_API_HOST + "/v1/api/talk/friends/message/default/send";
//		return httpCallService.CallwithToken(Const.POST, uri, httpSession.getAttribute("token").toString(), Trans.default_msg_param+"&receiver_uuids=["+uuids+"]");
//	}	
//	
//	public String logout() {	
//		String uri = KAKAO_API_HOST + "/v1/user/logout";
//		return httpCallService.CallwithToken(Const.POST, uri, httpSession.getAttribute("token").toString(), Trans.default_msg_param);
//	}	
    
}
