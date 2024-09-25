package kopo.aisw.hc.account.dao;

import java.util.List;

import kopo.aisw.hc.account.vo.AccountVO;
import kopo.aisw.hc.member.vo.MemberVO;
import kopo.aisw.hc.product.vo.ProductVO;
import kopo.aisw.hc.transaction.vo.TransactionVO;

public interface AccountDAO {
	//계좌 개설- 사전세팅
	public AccountVO preset(MemberVO member, int productNum) throws Exception;
	//계좌 개설- 계좌번호 생성-자동 (수동은 추후 업데이트 예정)
	public AccountVO createAccNum(AccountVO account);
	//계좌 개설-등록
	public boolean openAnAccount(AccountVO account, ProductVO product);
	
	//계좌목록 조회- customerId
	public List<AccountVO> getAccList(long customerId);
	//추후 accNum 대신 accId로 조회할 예정
	//계좌 조회- 이름 체크
	public String getOwnerName(long accNum);
	//계좌 조회- 잔액 조회
	public long getBalance(long accNum);
	//입금
	public boolean deposit(TransactionVO transaction);
	//출금
	public boolean withdraw(TransactionVO transaction);
	//이체
	public boolean transfer(TransactionVO transaction);
	
	//계좌 해지하기
	public boolean closeAnAccount(Long wAcc);
	
	//임시-계좌조회
	public AccountVO getAccount(String accNum);
	
}