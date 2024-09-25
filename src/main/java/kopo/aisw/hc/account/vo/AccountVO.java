package kopo.aisw.hc.account.vo;

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
public class AccountVO {
	/**
	//추후구현
	ACC_ID VARCHAR2(12) PRIMARY KEY
	, ACC_NUM	NUMBER NOT NULL UNIQUE
	
	//현재
	ACC_NUM NUMBER PRIMARY KEY
	, ACC_NAME VARCHAR2(300) NOT NULL
	, PRODUCT_NUM NUMBER(2) NOT NULL
	, CUSTOMER_ID NUMBER(8) NOT NULL
	, INTEREST_RATE NUMBER(5,4) NOT NULL
	, BALANCE NUMBER(15) NOT NULL == 지워질수도있음.
	, INTEREST_RATE NUMBER(5,4) NOT NULL
	, REG_DATE DATE DEFAULT sysdate NOT NULL
	, RET_DATE DATE NOT NULL
	, AVALIABLE NUMBER(1) NOT NULL
	, CONSTRAINT FK_CUSTOMER_ID FOREIGN KEY(CUSTOMER_ID) REFERENCES TEST_CUSTOMER(CUSTOMER_ID)
	, CONSTRAINT FK_PRODUCT_NUM FOREIGN KEY(PRODUCT_NUM) REFERENCES TEST_PRODUCT_LIST(PRODUCT_NUM)
	);
	
  */
	//계좌아이디 추후구현
//	private String accId;
	
	private long accNum;
	@Size(max=7, message="통장 이름은 7자 이내로 작성해주세요.") //input
	private String accName;
	@NotNull(message="상품 번호를 불러오지 못했습니다. 다시 시도해주세요.")
	private int productNum;
	@NotNull(message="세션이 만료되었거나 계정 정보를 불러올 수 없습니다.")
	private long customerId;
	@NotNull(message="세션이 만료되었거나 계정 정보를 불러올 수 없습니다.")
	private String customerName;
	@NotNull(message="세션이 만료되었거나 상품 정보를 불러올 수 없습니다.")
	private double interestRate;
	private long balance;
	private String regDate;
	private String retDate;
	private String avaliable;
	
}