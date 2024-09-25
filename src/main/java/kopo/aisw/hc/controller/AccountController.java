package kopo.aisw.hc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import kopo.aisw.hc.account.service.AccountService;
import kopo.aisw.hc.account.vo.AccountVO;
import kopo.aisw.hc.member.service.MemberService;
import kopo.aisw.hc.member.vo.MemberVO;
import kopo.aisw.hc.product.service.ProductService;
import kopo.aisw.hc.product.vo.ProductVO;
import kopo.aisw.hc.transaction.service.TransactionService;
import kopo.aisw.hc.transaction.vo.TransactionVO;
import lombok.extern.slf4j.Slf4j;

// git push origin localBranch:gitBranch 
@Slf4j
@Controller
@RequestMapping("/account/")
public class AccountController {
	
	@Autowired
	private AccountService as;
	@Autowired
	private MemberService ms;
	@Autowired
	private ProductService ps;
	@Autowired
	private TransactionService ts;

	
	//계좌생성
	@GetMapping("openAcc/{productNum}")
	public String openAnAcc(@PathVariable(value = "productNum") int productNum, Model model,
							HttpSession session) throws Exception {
		MemberVO userVO = (MemberVO) session.getAttribute("userVO");
		//고객정보 가져오기(패스워드 제외)
		userVO = ms.getProfile(userVO);
		ProductVO p = ps.selectProduct(productNum);
		//상품번호, 고객고유번호, 고객이름 세팅
		AccountVO openAcc = as.preset(userVO, productNum);
		
		model.addAttribute("product", p);
		model.addAttribute("openAcc", openAcc);
		return "account/open";
	}
	@PostMapping("openAcc/{productNum}")
	public String openAnAcc(@PathVariable(value = "productNum") int productNum,
			@Valid @ModelAttribute("openAcc")AccountVO openAcc,
			BindingResult res, HttpSession session, Model model) throws Exception {
		boolean b;
		ProductVO p = ps.selectProduct(productNum);
		//상품번호, 고객고유번호, 고객이름 세팅
		model.addAttribute("product", p);
		model.addAttribute("openAcc", openAcc);
		if(res.hasErrors()) return "account/open";
		try {
			MemberVO m = (MemberVO) session.getAttribute("userVO");
			//임시
			b = as.openAnAccount(openAcc);
			log.info("Try -[customer:"+m.getCustomerId()+"] open account : "+openAcc.toString());
			
			//계좌번호 생성 및 등록
			//model.addAttribute("openAnAcc", true);
			log.info(b+" -[customer:"+m.getCustomerId()+"] open account : "+openAcc.toString());
			return "redirect:/account/";
		}catch(Exception e) {
			//model.addAttribute("openAnAcc", false);
			e.printStackTrace();
			return "redirect:/product/view/"+productNum;
		}
		
	}
	
	
	
	//계좌목록
	@GetMapping("")
	public String accountList(Model model, HttpSession session) {
		MemberVO userVO = (MemberVO) session.getAttribute("userVO");
		List<AccountVO> list = as.getAccountList(userVO);
		model.addAttribute("accList", list);
		return "account/list";
	}
	@PostMapping("")
	public String accountList(Model model, HttpSession session, @RequestParam("accNum")String accNum) {
		MemberVO userVO = (MemberVO) session.getAttribute("userVO");
		List<TransactionVO> transaction = ts.getTransactionList(Long.parseLong(accNum));
		AccountVO account = as.getAccount(accNum);
		if(userVO.getCustomerId()!=account.getCustomerId()) return "redirect:/account/";
		session.setAttribute("account", account);
		model.addAttribute("transaction", transaction);
		
		List<AccountVO> list = as.getAccountList(userVO);
		model.addAttribute("accList", list);
		return "account/detail";
	}
	
	//계좌해지
	@PostMapping("/close")
	public String accountClose(Model model, @RequestParam("withdrawAcc") Long wAcc,
			@RequestParam("depositAcc") Long dAcc, HttpSession session) {
		MemberVO userVO = (MemberVO) session.getAttribute("userVO");
		if(as.getAccount(wAcc+"").getCustomerId()!=userVO.getCustomerId()) return "redirect:/account/";
		model.addAttribute("result", as.closeAnAccount(wAcc, dAcc));
		return "account/result";
	}
}