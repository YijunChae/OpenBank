package kopo.aisw.hc.account.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kopo.aisw.hc.account.vo.AccountVO;
import kopo.aisw.hc.member.vo.MemberVO;
import kopo.aisw.hc.transaction.vo.TransactionVO;
public interface AccountService {
	//개설 전 세팅
	public AccountVO preset(MemberVO member, int productNum) throws Exception;
	//계좌 개설하기
	public boolean openAnAccount(AccountVO account) throws Exception;

	//계좌 조회- 목록 조회
	public List<AccountVO> getAccountList(MemberVO userVO);
	//조회: 추후 accNum 대신 accId로 변경 예정
	//계좌 조회- 이름 체크
	public String getOwnerName(long accNum);
	//계좌 조회- 잔액 조회
	public long getBalance(long accNum);
	//계좌 이체
	public boolean transfer(TransactionVO transaction);

	//계좌 해지하기
	public boolean closeAnAccount(Long wAcc, Long dAcc);
	
	//임시
	public AccountVO getAccount(String accNum);
}