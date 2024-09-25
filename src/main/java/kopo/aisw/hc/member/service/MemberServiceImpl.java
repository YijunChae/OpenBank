package kopo.aisw.hc.member.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kopo.aisw.hc.member.dao.MemberDAO;
import kopo.aisw.hc.member.vo.MemberVO;
import kopo.aisw.hc.member.vo.SearchParam;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberDAO mDao;
	
	@Override
	public MemberVO signIn(MemberVO m) throws Exception {
		return mDao.signIn(m);
	}
	
	@Override
	public boolean signUp(MemberVO m){
		return mDao.signUp(m);
	}
	
	@Override
	public boolean idDoubleCheck(String userId) {
		return mDao.idDoubleCheck(userId);
	}

	@Override
	public MemberVO humanDoubleCheck(MemberVO m) {
		return mDao.humanDoubleCheck(m);
	}

	@Override
	public boolean phoneDoubleCheck(String phoneNum) {
		return mDao.phoneDoubleCheck(phoneNum);
	}

	@Override
	public boolean mailDoubleCheck(String email) {
		return mDao.mailDoubleCheck(email);
	}

	@Override
	public boolean edit(MemberVO userVO) {
		return mDao.edit(userVO);
	}

	@Override
	public MemberVO getProfile(MemberVO userVO) {
		return mDao.getProfile(userVO);
	}

	@Override
	public boolean updateBankId(MemberVO m) {
		return mDao.updateBankId(m);
	}
	
	//임시
	@Override
	public boolean checkPwd(MemberVO m) {
		m.setPassword(m.getPassword());
        MemberVO userVO = mDao.getPwd(m);
		if (userVO != null && m!=null) {
			return m.getPassword().equals(userVO.getPassword());     
		}
		return false;
	}

	@Override
	public int quitMember(MemberVO m) {
		return mDao.quitMember(m);
	}

	@Override
	public boolean checkCreditPwd(MemberVO userVO) {
		return mDao.checkCreditPwd(userVO);
	}
	
	@Override
    public List<MemberVO> selectAllMembers() {
        return mDao.selectAllMembers();
    }

    @Override
    public MemberVO getMemberById(int customerId) {
        return mDao.getMemberById(customerId);
    }

    @Override
    public List<MemberVO> searchMembers(Map<String, String> paramMap) {
        return mDao.searchMembers(paramMap);
    }
	
    @Override
	public String Hashing(String password) {
		return mDao.Hashing(password);
	}
	
	@Override
	public boolean checkBirth(MemberVO m) {
		return mDao.checkBirth(m);
	}
}