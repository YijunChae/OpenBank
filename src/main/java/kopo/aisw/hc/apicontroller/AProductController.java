package kopo.aisw.hc.apicontroller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import jakarta.servlet.http.HttpSession;
import kopo.aisw.hc.controller.ProductController;
import kopo.aisw.hc.member.service.MemberService;
import kopo.aisw.hc.member.vo.MemberVO;
import kopo.aisw.hc.product.service.ProductService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/product/")
public class AProductController {
	@Autowired
	ProductService ps;
	
	
	// 신규 사용자 추이 데이터 제공 엔드포인트
    @GetMapping("admin/dashboard/userTrends")
    public Map<String, Object> getUserTrends() {
        try {
            System.out.println(ps.getNewUserTrends());
            return ps.getNewUserTrends().get(0);
        } catch (Exception e) {
            // log.error("실패 ㅠㅠ", e);
            return new HashMap<>();
        }
    }
}
