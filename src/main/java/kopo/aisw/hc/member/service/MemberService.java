package kopo.aisw.hc.member.service;

import java.util.List;
import java.util.Map;

import kopo.aisw.hc.member.vo.MemberVO;
import kopo.aisw.hc.member.vo.SearchParam;

public interface MemberService {
	//로그인
	public MemberVO signIn(MemberVO m) throws Exception;
	//신규회원가입
	public boolean signUp(MemberVO m);
	//기존고객 회원가입
	public boolean updateBankId(MemberVO m);
	//고객 중복확인 1차필터 (중복 기준: 이름/전화번호/주민번호 -> 이후 id null확인)
	public MemberVO humanDoubleCheck(MemberVO m);
	//아이디 중복확인
	public boolean idDoubleCheck(String userId);
	//전화번호 중복확인
	public boolean phoneDoubleCheck(String phoneNum);
	//메일 중복확인
	public boolean mailDoubleCheck(String email);
	//프로필 업데이트
	public boolean edit(MemberVO userVO);
	//프로필 조회
	public MemberVO getProfile(MemberVO userVO);
	//회원탈퇴
	public int quitMember(MemberVO m);
	
	
	//비밀번호 로직(임시)
	public boolean checkPwd(MemberVO m);
	//결제비밀번호 로직
	public boolean checkCreditPwd(MemberVO userVO);
	
	// 전체 회원 조회
    public List<MemberVO> selectAllMembers();

    // 회원 상세 조회
    public MemberVO getMemberById(int customerId);

    // 회원 검색
    public List<MemberVO> searchMembers(Map<String, String> paramMap);

	
	//암호화(임시)
	public String Hashing(String password);
	public boolean checkBirth(MemberVO m);
}
