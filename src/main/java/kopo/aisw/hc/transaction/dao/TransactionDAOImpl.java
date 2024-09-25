package kopo.aisw.hc.transaction.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kopo.aisw.hc.account.vo.AccountVO;
import kopo.aisw.hc.transaction.vo.TransactionVO;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@Repository
public class TransactionDAOImpl implements TransactionDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	@Transactional(rollbackOn = {Exception.class})
	public TransactionVO transfer(TransactionVO transaction) throws Exception {
		try {
			//transaction에 출금계좌의 afterbalance 채워야함
			sqlSession.update("dao.AccountDAO.withdraw", transaction);
			sqlSession.update("dao.AccountDAO.deposit", transaction);
			sqlSession.insert("dao.TransactionDAO.withdraw", transaction);
			sqlSession.insert("dao.TransactionDAO.deposit", transaction);
			log.info("거래 성공 - "+transaction);
		}catch(Exception e) {
			e.printStackTrace();
			log.error("거래 실패 - "+transaction);
			throw e;
		}
		return transaction;
	}

	@Override
	public boolean deposit(TransactionVO transaction) {
		return false;
	}

	@Override
	public boolean withdraw(TransactionVO transaction) {
		return false;
	}
 
	@Override
	public boolean depositForOpenAcc(AccountVO account) throws Exception {
		TransactionVO t=new TransactionVO();
		t.setAmount(1000000);
		t.setDAfterBalance(1000000);
		t.setDepositAcc(account.getAccNum());
		t.setDepositName("개설기념(베타)");
		int a = sqlSession.insert("dao.TransactionDAO.deposit", t);
		a+= sqlSession.update("dao.AccountDAO.deposit", t);
		
		return a==2;
	}

	@Override
	public List<TransactionVO> getTransactionList(long accNum) {
		List<TransactionVO> list = sqlSession.selectList("dao.TransactionDAO.transactionListByAcc", accNum);
		for(TransactionVO tran:list) {
			System.out.println(tran);
			System.out.println(tran.getWAfterBalance());
		}
		return list;
	}

	@Override
	public List<TransactionVO> getTransactionListByDate(TransactionVO t) {
		List<TransactionVO> list = sqlSession.selectList("dao.TransactionDAO.viewTranByDate", t);
		return list;
	}

	@Override
	public long getSumByDate(TransactionVO t) {
		return sqlSession.selectOne("dao.TransactionDAO.getSumByDate", t);
	}

	
}