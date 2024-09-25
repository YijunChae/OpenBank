package kopo.aisw.hc.transaction.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kopo.aisw.hc.account.vo.AccountVO;
import kopo.aisw.hc.transaction.dao.TransactionDAO;
import kopo.aisw.hc.transaction.vo.TransactionVO;

@Service
public class TransactionServiceImpl implements TransactionService{

	@Autowired
	TransactionDAO tDao;
	
	@Override
	public TransactionVO transfer(TransactionVO transaction) throws Exception {
		//출금통장 잔액확인
		
		return tDao.transfer(transaction);
	}

	@Override
	public TransactionVO deposit(TransactionVO transaction) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public TransactionVO withdraw(TransactionVO transaction) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<TransactionVO> getTransactionList(long accNum) {
		return tDao.getTransactionList(accNum);
	}

	@Override
	public List<TransactionVO> getTransactionListByDate(TransactionVO t) {
		return tDao.getTransactionListByDate(t);
	}

	@Override
	public long getSumByDate(TransactionVO t) {
		return tDao.getSumByDate(t);
	}
	


}