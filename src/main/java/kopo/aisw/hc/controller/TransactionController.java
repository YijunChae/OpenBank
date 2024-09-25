package kopo.aisw.hc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import jakarta.servlet.http.HttpSession;
import kopo.aisw.hc.account.service.AccountService;
import kopo.aisw.hc.account.vo.AccountVO;
import kopo.aisw.hc.member.kakao.KakaoVO;
import kopo.aisw.hc.member.vo.MemberVO;
import kopo.aisw.hc.transaction.service.TransactionService;
import kopo.aisw.hc.transaction.vo.TransactionVO;
import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
@RequestMapping("/transaction/")
public class TransactionController {
	
	@Autowired
	AccountService as;
	
	@Autowired
	TransactionService ts;
	
	
	//계좌이체
	@GetMapping("transfer")
	public String transfer(Model model, HttpSession session) {
		//(로그인 확인용 intercept 추가 완료 - 5/28 (applicationContext.xml참조))
		//세션정보 끌어오기
		MemberVO userVO = (MemberVO) session.getAttribute("userVO");
		List<AccountVO> list = as.getAccountList(userVO);
		model.addAttribute("accList", list);
		
		TransactionVO t = new TransactionVO();
		model.addAttribute("t", t);
		return "transaction/transfer";
	}
	
	@RequestMapping(value="transfer", method = RequestMethod.POST )
	public String transfer(@ModelAttribute("t")TransactionVO t, 
			Model model, HttpSession session) {
		try {
			MemberVO userVO = (MemberVO) session.getAttribute("userVO");
			log.info("Transaction start: "+userVO.getCustomerId()+" - "+t);
			//로그인중인 유저와 출금하려는 계좌 소유주가 같은지 확인
			AccountVO a = as.getAccount(t.getWithdrawAcc()+"");
			if(a.getCustomerId()!=userVO.getCustomerId()) {
				//아님
				log.fatal("Transaction end(error) : 이체 로직 체크 요망 - 통장 번호, 소유자: "+a.getAccNum()+", "+a.getCustomerId()+"/ 요청자 ID:"+userVO.getCustomerId());
				return "redirect:/member/logout";
			}
			
			//보내는사람 이름 세팅안됐을떄
			if(t.getDepositName().length()==0||t.getDepositName()==null) {
				t.setDepositName(userVO.getName());
			}
			
			//잔액체크
			long balance = a.getBalance()-t.getAmount();
			if(balance<0) {
				log.info("Transaction end(잔액부족): "+userVO.getCustomerId()+" - "+t);
				model.addAttribute("transactionError", "잔액이 부족합니다.");
				return "transaction/result";
			}else {
				//여기까지 문제없다면 잔액 세팅
				t.setWAfterBalance(balance);
				t.setDAfterBalance(t.getAmount()+as.getBalance(t.getDepositAcc()));
			}
	        
			//이체 실행
			t = ts.transfer(t);
			model.addAttribute("transactionError", "이체가 완료되었습니다. \n잔액: "+t.getWAfterBalance());
			log.info("Transaction end: "+t);
			
		}catch(Exception e){
			model.addAttribute("transactionError", "이체 실패. 관리자에게 연락주세요.");
			log.error("Transaction Error - "+e.toString());
			e.printStackTrace();
		}
		return "transaction/result";
	}
}