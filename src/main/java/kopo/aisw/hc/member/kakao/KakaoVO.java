package kopo.aisw.hc.member.kakao;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

import kopo.aisw.hc.member.vo.MemberVO;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
@NoArgsConstructor
@JsonIgnoreProperties(ignoreUnknown = true)
public class KakaoVO {
	/**
	 * 카카오 개발자문서 양식을 따름
	 * https://developers.kakao.com/docs/latest/ko/kakaologin/rest-api#request-token
	 * 
	 */
	
	    @JsonProperty("token_type")
	    public String tokenType;
	    
	    @JsonProperty("access_token")
	    public String accessToken;
	    
	    @JsonProperty("id_token")
	    public String idToken;
	    
	    @JsonProperty("expires_in")
	    public Integer expiresIn;
	    
	    @JsonProperty("refresh_token")
	    public String refreshToken;
	    
	    @JsonProperty("refresh_token_expires_in")
	    public Integer refreshTokenExpiresIn;
	    
	    @JsonProperty("scope")
	    public String scope;
	    
	    @JsonProperty("id")
	    public long id;

	    @JsonProperty("connected_at")
	    public String connectedAt;

	    @JsonProperty("synched_at")
	    public String synchedAt;

	    @JsonProperty("kakao_account")
	    public KakaoProfile kakaoAccount;
	    
	    public MemberVO kakaoVOToMemberVO(KakaoVO kakao) {
	    	MemberVO m = new MemberVO();
	    	m.setCustomerId(0);
	    	return m;
	    }
	    
}
@Getter
@Setter
@ToString
class KakaoProfile{
	@JsonProperty("phone_number")
	public String phoneNumber;
	
	@JsonProperty("name")
	public String name;
	
	@JsonProperty("email")
	public String email;

	@JsonProperty("gender")
	public String gender;
	
	@JsonProperty("birthyear")
	public String birthyear;

	@JsonProperty("birthday")
	public String birthday;

	@JsonProperty("birthday_type") // SOLAR / LUNAR
	public String birthdayType;
}