package kopo.aisw.hc.transaction.vo;

import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
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
public class TransactionVO {
	
	private int transactionId;
	private String transactionType;
	private String transactionDate;
	@Min(value = 500, message="500원 이상부터 송금 가능합니다")
	@Max(value = 999999999, message="1000000000원 이상은 송금할 수 없습니다.")
	private long amount; //출력시 이쪽이 잔액
	
	//출력시 w라인이 출력부
	@Min(value=1)
	private long withdrawAcc;
	@Size(max=7, message="현재 거래가 불가능한 계좌입니다.")
	private String withdrawName;
	
	//입금계좌/입금자명
	@NotNull(message="필수 항목입니다")
	private long depositAcc;
	@Size(max=7, message="이름은 7자 이하로 정해주세요")
	@Pattern(regexp = "^[ㅏ-ㅣㄱ-ㅎ가-힣a-zA-Z]{0,7}$", message="한글, 영어 대소문자만 가능합니다")
	private String depositName;

	//현재잔액
	private long wAfterBalance; 
	private long dAfterBalance;
}