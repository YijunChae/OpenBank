package kopo.aisw.hc.apicontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import kopo.aisw.hc.account.service.AccountService;
import kopo.aisw.hc.account.vo.AccountVO;
import kopo.aisw.hc.member.service.MemberService;
import kopo.aisw.hc.member.vo.MemberVO;
import kopo.aisw.hc.product.service.ProductService;
import kopo.aisw.hc.product.vo.ProductVO;
import kopo.aisw.hc.transaction.service.TransactionService;
import kopo.aisw.hc.transaction.vo.TransactionResponseVO;
import kopo.aisw.hc.transaction.vo.TransactionVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/api/account/")
public class AAccountController {
	
	@Autowired
	private AccountService as;
	@Autowired
	private MemberService ms;
	@Autowired
	private ProductService ps;
	@Autowired
	private TransactionService ts;
	
	// 계좌 거래내역 출력
	@GetMapping("transaction")
	public TransactionResponseVO getTransaction(@RequestParam(value = "accNum") String accNum
			,@RequestParam(value="startDate") String stD
			,@RequestParam(value="endDate") String enD
			,@RequestParam(value="page") int page
			,HttpSession session){
		
		TransactionResponseVO tResVO = new TransactionResponseVO();
		MemberVO userVO = (MemberVO) session.getAttribute("userVO");
		AccountVO acc = as.getAccount(accNum);
		if(acc.getCustomerId()!=userVO.getCustomerId())
			return tResVO;
		else {
			TransactionVO t = new TransactionVO();
			t.setWithdrawAcc(Long.parseLong(accNum));
			t.setTransactionType(stD);
			t.setTransactionDate(enD);
			t.setTransactionId(page);
			List<TransactionVO> list = ts.getTransactionListByDate(t);
			tResVO.setTransaction(list);
			tResVO.setSize(list.size());
			tResVO.setAmount(ts.getSumByDate(t));
			tResVO.setMember(userVO);
			tResVO.setPage(page);
	        return tResVO;
		}
	}

	// 계좌 생성 사전 설정 정보
	@GetMapping("openAcc/{productNum}")
	public ResponseEntity<?> openAnAccPreset(@PathVariable(value = "productNum") int productNum, HttpSession session) throws Exception {
		MemberVO userVO = (MemberVO) session.getAttribute("userVO");
		if (userVO == null) {
			return new ResponseEntity<>("잘못된 접근입니다.", HttpStatus.UNAUTHORIZED);
		}
		// 고객정보 가져오기(패스워드 제외)
		userVO = ms.getProfile(userVO);
		ProductVO p = ps.selectProduct(productNum);
		// 상품번호, 고객고유번호, 고객이름 세팅
		AccountVO openAcc = as.preset(userVO, productNum);

		return new ResponseEntity<>(new Object[] { p, openAcc }, HttpStatus.OK);
	}

	// 계좌 생성
	@PostMapping("openAcc/{productNum}")
	public ResponseEntity<?> openAnAcc(@PathVariable(value = "productNum") int productNum,
			@Valid @RequestBody AccountVO openAcc, BindingResult res, HttpSession session) throws Exception {
		if (res.hasErrors()) {
			return new ResponseEntity<>(res.getAllErrors(), HttpStatus.BAD_REQUEST);
		}

		try {
			MemberVO m = (MemberVO) session.getAttribute("userVO");
			if (m == null) {
				return new ResponseEntity<>("잘못된 접근입니다.", HttpStatus.UNAUTHORIZED);
			}

			boolean b = as.openAnAccount(openAcc);
			//log.info("Try -[customer:" + m.getCustomerId() + "] open account : " + openAcc.toString());

			//log.info(b + " -[customer:" + m.getCustomerId() + "] open account : " + openAcc.toString());
			return new ResponseEntity<>(b, HttpStatus.OK);
		} catch (Exception e) {
			//log.error("Account opening failed", e);
			return new ResponseEntity<>("계좌 개설에 실패했습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	// 계좌 목록 조회
	@GetMapping("")
	public ResponseEntity<List<AccountVO>> accountList(HttpSession session) {
		MemberVO userVO = (MemberVO) session.getAttribute("userVO");
		if (userVO == null) {
			return new ResponseEntity<>(HttpStatus.UNAUTHORIZED);
		}
		List<AccountVO> list = as.getAccountList(userVO);
		return new ResponseEntity<>(list, HttpStatus.OK);
	}

	// 계좌 상세 조회
	@PostMapping("detail")
	public ResponseEntity<?> accountDetail(HttpSession session, @RequestParam("accNum") String accNum) {
		MemberVO userVO = (MemberVO) session.getAttribute("userVO");
		AccountVO account = as.getAccount(accNum);
		if (userVO == null||userVO.getCustomerId() != account.getCustomerId()) {
			return new ResponseEntity<>("잘못된 접근입니다.", HttpStatus.UNAUTHORIZED);
		}
		List<TransactionVO> transaction = ts.getTransactionList(Long.parseLong(accNum));
		return new ResponseEntity<>(new Object[] { account, transaction }, HttpStatus.OK);
	}
	
	@GetMapping("accCheck")
	public String accCheck(@RequestParam("accNum") long accNum, HttpSession session) {
		if(session==null) return "잘못된 접근입니다.";
		MemberVO userVO = (MemberVO) session.getAttribute("userVO");
		log.info(userVO.getCustomerId()+" => "+accNum);
		return as.getOwnerName(accNum);
	}
	
	@GetMapping("info") //지금은 세션으로 체크하지만 ㅠㅠ 나중에는 헤더값 받아오고싶음
	public AccountVO accInfo(HttpSession session, @RequestParam("accNum") String accNum) {
		MemberVO userVO = (MemberVO) session.getAttribute("userVO");
		AccountVO acc = as.getAccount(accNum);
		if(acc.getCustomerId()!=userVO.getCustomerId()) return null;
		return acc;
	}
	
}