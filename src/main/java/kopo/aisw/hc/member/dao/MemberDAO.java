package kopo.aisw.hc.member.dao;

import java.util.List;
import java.util.Map;

import kopo.aisw.hc.member.vo.MemberVO;
import kopo.aisw.hc.member.vo.SearchParam;

public interface MemberDAO {
	public MemberVO signIn(MemberVO m) throws Exception;
	public boolean signUp(MemberVO m);
	public boolean idDoubleCheck(String userId);
	public MemberVO humanDoubleCheck(MemberVO m);
	public boolean mailDoubleCheck(String email);
	public boolean phoneDoubleCheck(String phoneNum);
	public boolean edit(MemberVO userVO);
	public MemberVO getProfile(MemberVO userVO);
	public boolean updateBankId(MemberVO m);
	public int quitMember(MemberVO m);
	
	//임시
	public MemberVO getPwd(MemberVO m);
	public boolean checkCreditPwd(MemberVO userVO);
	
	// 전체 회원 조회
    public List<MemberVO> selectAllMembers();

    // 회원 상세 조회
    public MemberVO getMemberById(int customerId);

    // 회원 검색
    public List<MemberVO> searchMembers(Map<String, String> paramMap);
  
	//비밀번호 암호화
	public String Hashing(String password);
	public boolean checkBirth(MemberVO m);
}
