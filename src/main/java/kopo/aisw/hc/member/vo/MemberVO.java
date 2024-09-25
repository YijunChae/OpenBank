package kopo.aisw.hc.member.vo;

import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class MemberVO {
	/*
	사용자식별코드 CUSTOMER_ID VARCHAR2(100)
	사용자 ID	USER_ID	VARCHAR2(20)
	비밀번호	PASSWORD	VARCHAR2(256)
	결제 비밀번호	CREDIT_PASSWORD	VARCHAR2(256)
	이름	NAME	VARCHAR2(18)
	휴대폰번호	PHONE_NUM	VARCHAR2(13)
	이메일	EMAIL	VARCHAR2(40)
	우편번호	ZIP_CODE	NUMBER(5)
	주소	ADDRESS	VARCHAR2(300)
	주민번호	RRN	NUMBER(13)
	고객 유형	CUSTOMER_TYPE	NUMBER(3)
	일일이체한도	NUMBER(15) NOT NULL
	 
	 */
	private long customerId;
	
	@Size(min=6, max=16, message="아이디는 6~16자 사이로 입력해주세요")
	@Pattern(regexp = "^[\\w-]{0,30}$", 
	message="아이디는 영어와 숫자, 특수문자 -또는 _로만 이루어져야 합니다")
	private String userId;
	
	@Size(min=8, max=50, message="비밀번호는 8~20자 사이로 입력해주세요")
	@Pattern(regexp ="^(?=.*[a-z])(?=.*\\d)(?=.*[~!@#$%^&*()+|=])[a-z\\d~!@#$%^&*()+|=]{0,30}$", 
	message = "영문 소문자, 숫자, 특수문자(~!@#$%^&*()+|=])가 모두 포함되어야 합니다")
	private String password;
	
	@Size(min=6, max=6, message="결제 비밀번호를 입력해주세요")
	private String creditPassword;
	
	@Size(min=1, max=6, message="이름을 입력해주세요(최대 6자)")
	private String name;
	
	@Pattern(regexp="^[\\d]{10,11}$", message = "전화번호를 입력해주세요")
	private String phoneNum;
	
	@Pattern(regexp="^[\\w\\.-]+@[\\w\\.-]+\\.[a-zA-Z]{2,}$", message = "메일 형식이 아닙니다.")
	private String email;
	
	private int zipCode;
	private String address;
	private String addressDetail; //상세주소
	
	@Size(min=7, max=7, message="앞에서부터 7자리만 입력해주세요")
	private String rrn;
	
	//0: 일반 사용자, 1: 관리자, 999:거래정지
	private int customerType;
	private int availableBalance;
	private String regDate;
}
