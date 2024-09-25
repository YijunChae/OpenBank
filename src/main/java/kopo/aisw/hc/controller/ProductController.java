package kopo.aisw.hc.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.validation.Valid;
import kopo.aisw.hc.product.service.ProductService;
import kopo.aisw.hc.product.vo.ProductVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/product/")
public class ProductController {
    
    @Autowired
    private ProductService productService;

    // 관리자용 상품 목록 조회
    @GetMapping("admin/list")
    public String productList(Model model) {
        try {
            model.addAttribute("p", productService.selectAllProducts());
            return "product/list";
        } catch (Exception e) {
            model.addAttribute("message", "목록을 불러오는데 실패했습니다.");
            return "error";
        }
    }

    // 관리자용 상품 상세정보 조회
    @GetMapping("admin/detail/{productNum}")
    public String productDetail(@PathVariable("productNum") int productNum, Model model) {
        try {
            model.addAttribute("p", productService.selectProduct(productNum));
            return "product/detail";
        } catch (Exception e) {
            model.addAttribute("message", "상품 정보를 불러오는데 실패했습니다.");
            return "error";
        }
    }
    
    // 상품 등록 페이지 이동
    @GetMapping("register")
    public String productRegisterForm(Model model) {
        model.addAttribute("p", new ProductVO());
        return "product/register";
    }
    
    // 상품 등록 처리
    @PostMapping("register")
    public String productRegister(@Valid @ModelAttribute("p") ProductVO productVO, BindingResult result, Model model) {
        if (result.hasErrors()) {
            return "product/register";
        }
        try {
            productService.insertProduct(productVO);
            return "redirect:/product/admin/list";  // URL 변경
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("message", "상품 등록에 실패했습니다.");
            return "error";
        }
    }
    
    // 상품 수정 페이지 이동
    @GetMapping("edit/{productNum}")
    public String productEditForm(@PathVariable("productNum") int productNum, Model model) {
        try {
            model.addAttribute("p", productService.selectProduct(productNum));
            return "product/edit";
        } catch (Exception e) {
            model.addAttribute("message", "상품 정보를 불러오는데 실패했습니다.");
            return "error";
        }
    }
    
    // 상품 수정 처리
    @PostMapping("edit")
    public String productEdit(@Valid @ModelAttribute("p") ProductVO productVO, BindingResult result) {
        if (result.hasErrors()) {
            return "product/edit";
        }
        try {
            productService.updateProduct(productVO);
            return "redirect:/product/admin/list";  // URL 변경
        } catch (Exception e) {
            return "error";
        }
    }
    
    // 상품 비활성화 처리
    @GetMapping("delete/{productNum}")
    public String productDelete(@PathVariable("productNum") int productNum, Model model) {
        try {
            productService.deleteProduct(productNum);
            return "redirect:/product/admin/list";  // URL 변경
        } catch (Exception e) {
            model.addAttribute("message", "상품 비활성화에 실패했습니다.");
            return "error";
        }
    }
    
    // 회원용 상품 목록 조회
    @GetMapping("view")
    public String viewProductList(Model model) {
        try {
            model.addAttribute("products", productService.selectAllProducts());
            return "product/viewList";
        } catch (Exception e) {
            model.addAttribute("message", "목록을 불러오는데 실패했습니다.");
            return "error";
        }
    }

    // 회원용 상품 상세정보 조회
    @GetMapping("view/{productNum}")
    public String viewProductDetail(@PathVariable("productNum") int productNum, Model model) {
        try {
            model.addAttribute("product", productService.selectProduct(productNum));
            return "product/viewDetail";
        } catch (Exception e) {
            model.addAttribute("message", "상품 정보를 불러오는데 실패했습니다.");
            return "error";
        }
    }
    

 // 관리자용 대시보드
    @GetMapping("admin/dashboard")
    public String productDashboard(Model model) {
        try {
            List<Map<String, Object>> stats = productService.getProductStatistics();
            List<Map<String, Object>> userTrends = productService.getNewUserTrends();
            int totalUsers = productService.getTotalUsers();
            int newSubscribers = productService.getNewSubscribers();
            long totalDeposits = productService.getTotalDeposits();
            long totalWithdrawals = productService.getTotalWithdrawals();

            /*
            for(Map<String, Object> map: stats) {
            	Set<String> keys = map.keySet();
            	for(String key : keys) {
            		System.out.println(key + " : " + map.get(key));
            	}
            }
            */
            
            System.out.println(userTrends);
            
            model.addAttribute("stats", stats);
            model.addAttribute("userTrends", userTrends);
            model.addAttribute("totalUsers", totalUsers);
            model.addAttribute("newSubscribers", newSubscribers);
            model.addAttribute("totalDeposits", totalDeposits);
            model.addAttribute("totalWithdrawals", totalWithdrawals);
            
            System.out.println(stats);
            
            return "product/dashboard";
            //return "product/exam";
        } catch (Exception e) {
            log.error("Failed to load dashboard data", e);
            model.addAttribute("message", "관리자용 대시보드를 불러오는데 실패했습니다.");
            return "error";
        }
    }
    
    
    /*
 // 관리자용 대시보드
    @GetMapping("admin/dashboard")
    public String productDashboard(Model model) {
        try {
            List<Map<String, Object>> stats = productService.getProductStatistics();
            List<Map<String, Object>> userTrends = productService.getNewUserTrends();
            int totalUsers = productService.getTotalUsers();
            int newSubscribers = productService.getNewSubscribers();
            long totalDeposits = productService.getTotalDeposits();
            long totalWithdrawals = productService.getTotalWithdrawals();

            model.addAttribute("stats", stats);
            model.addAttribute("userTrends", userTrends);
            model.addAttribute("totalUsers", totalUsers);
            model.addAttribute("newSubscribers", newSubscribers);
            model.addAttribute("totalDeposits", totalDeposits);
            model.addAttribute("totalWithdrawals", totalWithdrawals);
            return "product/dashboard";
        } catch (Exception e) {
            model.addAttribute("message", "관리자용 대시보드를 불러오는데 실패했습니다.");
            return "error";
        }
    }
    */
    
    
}