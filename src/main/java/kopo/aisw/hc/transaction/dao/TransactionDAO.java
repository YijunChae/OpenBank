package kopo.aisw.hc.transaction.dao;

import java.util.List;

import kopo.aisw.hc.account.vo.AccountVO;
import kopo.aisw.hc.transaction.vo.TransactionVO;

public interface TransactionDAO {
	//이체
	public TransactionVO transfer(TransactionVO VTran) throws Exception;
	
	//입금
	public boolean deposit(TransactionVO dbTran);
	//출금
	public boolean withdraw(TransactionVO dbTran);
	
	//개설 시 입금
	public boolean depositForOpenAcc(AccountVO account) throws Exception;
	
	//거래내역
	public List<TransactionVO> getTransactionList(long accNum);

	public List<TransactionVO> getTransactionListByDate(TransactionVO t);

	public long getSumByDate(TransactionVO t);
		
}