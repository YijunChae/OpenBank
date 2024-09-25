package kopo.aisw.hc.transaction.service;

import java.util.List;

import kopo.aisw.hc.transaction.vo.TransactionVO;

public interface TransactionService {
	
	//거래내역 추가
	public TransactionVO transfer(TransactionVO transaction) throws Exception;
	
	//입금
	public TransactionVO deposit(TransactionVO transaction) throws Exception;
	//출금
	public TransactionVO withdraw(TransactionVO transaction) throws Exception;
	
	//거래내역 출력
	public List<TransactionVO> getTransactionList(long accNum);

	public List<TransactionVO> getTransactionListByDate(TransactionVO t);

	public long getSumByDate(TransactionVO t);
	
}
