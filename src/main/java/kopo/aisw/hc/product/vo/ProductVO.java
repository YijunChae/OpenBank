package kopo.aisw.hc.product.vo;

import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class ProductVO {
    
    @NotNull(message = "상품 번호는 필수입니다.")
    private int productNum;
    
    @NotNull(message = "가입 대상은 필수입니다.")
    @Min(value = 0, message = "가입 대상 값은 0 또는 1이어야 합니다.") // 개인(0) 또는 법인(1)으로 가정했습니다.
    @Max(value = 1, message = "가입 대상 값은 0 또는 1이어야 합니다.")
    private int productTarget;
    
    @Size(min = 1, max = 100, message = "상품명은 1자 이상 100자 이하여야 합니다.")
    private String productName;
    
    @Size(min = 1, max = 500, message = "상품 설명은 1자 이상 500자 이하여야 합니다.")
    private String description;
    
    @NotNull(message = "금리는 필수입니다.")
    private float interestRate;
    
    @NotNull(message = "초기 가입금액은 필수입니다.")
    private long initialDeposit;
    
    @NotNull(message = "가입 기간은 필수입니다.")
    @Min(value = 1, message = "가입 기간은 최소 1개월 이상이어야 합니다") // 월 단위로 가정했습니다.
    private int dateOfDeposit;
    
    @NotNull(message = "신규 가입 가능 여부는 필수입니다.")
    private int available; // 신규 가입 가능(1), 불가능(0)으로 가정했습니다.
}