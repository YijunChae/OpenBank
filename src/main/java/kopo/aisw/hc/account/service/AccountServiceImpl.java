package kopo.aisw.hc.account.service;

import java.util.List;

import org.sonatype.aether.spi.connector.Transfer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kopo.aisw.hc.account.dao.AccountDAO;
import kopo.aisw.hc.account.dao.AccountDAOImpl;
import kopo.aisw.hc.account.vo.AccountVO;
import kopo.aisw.hc.member.vo.MemberVO;
import kopo.aisw.hc.product.dao.ProductDAO;
import kopo.aisw.hc.product.vo.ProductVO;
import kopo.aisw.hc.transaction.dao.TransactionDAO;
import kopo.aisw.hc.transaction.vo.TransactionVO;


@Service
public class AccountServiceImpl implements AccountService {
	
	@Autowired
	private AccountDAO aDao;
	@Autowired
	private ProductDAO pDao;
	@Autowired
	private TransactionDAO tDao;
	
	//사전설정
	@Override
	public AccountVO preset(MemberVO member, int productNum) throws Exception {
		return aDao.preset(member, productNum);
	}

	//계좌 개설하기 (상품번호/고객고유번호/고객이름/계좌명)
	@Override
	public boolean openAnAccount(AccountVO account) throws Exception {
		ProductVO product = pDao.selectProduct(account.getProductNum());
		account = aDao.createAccNum(account);
		if(aDao.openAnAccount(account, product))
			return tDao.depositForOpenAcc(account);
		else
			return false;
	}

	//조회: 추후 accNum 대신 accId로 변경 예정
	//계좌 조회- 이름 체크
	@Override
	public String getOwnerName(long accNum) {
		return aDao.getOwnerName(accNum);
	}
	
	//계좌 조회- 잔액 조회
	@Override
	public long getBalance(long accNum) {
		return aDao.getBalance(accNum);
	}
	
	
	//계좌 이체
	@Override
	public boolean transfer(TransactionVO transaction) {
		//잔액부족
		if(aDao.getBalance(transaction.getWithdrawAcc())-transaction.getAmount()<0)
			return false;
		//입금 또는 출금실패
		return aDao.transfer(transaction);
	}
	
	//계좌 해지하기
	@Override
	public boolean closeAnAccount(Long wAcc, Long dAcc) {
		if(aDao.getBalance(wAcc)!=0) {
			try {
				TransactionVO tran = new TransactionVO();
				tran.setDepositAcc(dAcc);
				tran.setWithdrawAcc(wAcc);
				tran.setAmount(aDao.getBalance(wAcc));
				tran.setDAfterBalance(aDao.getBalance(dAcc)+tran.getAmount());
				tran.setDepositName("해지");
				tran.setWithdrawName("해지");
				tDao.transfer(tran);
			} catch (Exception e) {
				e.printStackTrace();
				return false;
			}
		}
		return aDao.closeAnAccount(wAcc);
	}

	//소유계좌조회
	@Override
	public List<AccountVO> getAccountList(MemberVO userVO) {
		return aDao.getAccList(userVO.getCustomerId());
	}

	
	//임시
	@Override
	public AccountVO getAccount(String accNum) {
		return aDao.getAccount(accNum);
	}

}