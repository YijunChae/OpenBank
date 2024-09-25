package kopo.aisw.hc.member.dao;

import java.security.MessageDigest;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kopo.aisw.hc.member.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class MemberDAOImpl implements MemberDAO{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	/*
	@Override
	public MemberVO signIn(MemberVO m) throws Exception {
		MemberVO in = sqlSession.selectOne("dao.MemberDAO.signIn", m);
		return in;
	}
	*/
	@Override
    public MemberVO signIn(MemberVO m) throws Exception {
        // DB에서 사용자 정보 조회
        MemberVO in = sqlSession.selectOne("dao.MemberDAO.signIn", m);
        
        // 비밀번호 비교
        if ((in != null) && m.getPassword().equals(in.getPassword())) {
            return in;
        } else {
            return null;
        }
    }

	@Override
	public boolean signUp(MemberVO m) {
		try {
			sqlSession.insert("dao.MemberDAO.signUp", m);
			return true;
		}catch(Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean idDoubleCheck(String userId) {
		MemberVO idChk = sqlSession.selectOne("dao.MemberDAO.idDoubleCheck", userId);
		return idChk!=null;
	}

	@Override
	public MemberVO humanDoubleCheck(MemberVO m) {
		m = sqlSession.selectOne("dao.MemberDAO.humanDoubleCheck", m);
		if(m==null) m = new MemberVO();
		return m;
	}
	
	@Override
	public int quitMember(MemberVO m) {
		int i = sqlSession.update("dao.MemberDAO.quitMember", m);
		return i;
	}


	@Override
	public boolean mailDoubleCheck(String email) {
		MemberVO mailChk = sqlSession.selectOne("dao.MemberDAO.mailDoubleCheck", email);
		return mailChk!=null;
	}

	@Override
	public boolean phoneDoubleCheck(String phoneNum) {
		MemberVO phoneChk = sqlSession.selectOne("dao.MemberDAO.phoneDoubleCheck", phoneNum);
		return phoneChk!=null;
	}

	@Override
	public boolean edit(MemberVO userVO) {
		int i = sqlSession.update("dao.MemberDAO.updateProfile", userVO);
		return i!=0;
	}

	@Override
	public MemberVO getProfile(MemberVO userVO) {
		userVO = sqlSession.selectOne("dao.MemberDAO.profile", userVO.getCustomerId());
		return userVO;
	}

	@Override
	public boolean updateBankId(MemberVO m) {
		int i = sqlSession.update("dao.MemberDAO.updateBankId", m);
		return i!=0;
	}

	//
	@Override
	public MemberVO getPwd(MemberVO m) {
		m = sqlSession.selectOne("dao.MemberDAO.getPwd", m.getCustomerId()); 
		return m;
	}

	@Override
	public boolean checkCreditPwd(MemberVO userVO) {
		userVO = sqlSession.selectOne("dao.MemberDAO.checkCreditPwd", userVO);
		return userVO!=null;
	}
		
	@Override
    public List<MemberVO> selectAllMembers() {
        return sqlSession.selectList("dao.MemberDAO.selectAllMembers");
    }

    @Override
    public MemberVO getMemberById(int customerId) {
        return sqlSession.selectOne("dao.MemberDAO.getMemberById", customerId);
    }

    @Override
    public List<MemberVO> searchMembers(Map<String, String> paramMap) {
        return sqlSession.selectList("dao.MemberDAO.searchMembers", paramMap);
    }
    
	@Override
	public String Hashing(String password) {
		// SHA-256 해시함수를 사용 
		MessageDigest md;
		try {
			md = MessageDigest.getInstance("SHA-256");
			for(int i = 0; i < 10000; i++) {
				md.update(password.getBytes());						// temp 의 문자열을 해싱하여 md 에 저장해둔다 
				password = byteToString(md.digest());							// md 객체의 다이제스트를 얻어 password 를 갱신한다 
			}
			
			return password;
		} catch (Exception e) {
			log.error("MemberDAOImpl.Hashing(byte[], String) Error");
			return null;
		}
	}
	private String byteToString(byte[] temp){
		StringBuilder sb = new StringBuilder();
		for(byte a : temp) {
			sb.append(String.format("%02x", a));
		}
		return sb.toString();
	}
	
	@Override
	public boolean checkBirth(MemberVO m) {
		return m.getPassword().equals(sqlSession.selectOne("dao.MemberDAO.checkBirth",m));
	}
}