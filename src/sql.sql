--CREATE TABLE TEST_EMPLOYEE(
--	EMPLOYEE_ID NUMBER PRIMARY KEY --직원번호
--	, BANK_ADMIN_ID VARCHAR2(20) UNIQUE --온라인뱅크 관리자ID
--	, PASSWORD VARCHAR2(256) 
--	, NAME VARCHAR2(13) NOT NULL
--	, EMAIL VARCHAR2(30) NOT NULL
--	, PHONE_NUM VARCHAR2(13) NOT NULL UNIQUE
--	, HIRE_DATE DATE DEFAULT sysdate NOT NULL
----	, JOB_ID VARCHAR2(15) NOT NULL
--);


CREATE TABLE TEST_CUSTOMER(
	CUSTOMER_ID NUMBER PRIMARY KEY
	, BANK_ID VARCHAR2(512) UNIQUE
	, PASSWORD VARCHAR2(512) 
	, CREDIT_PASSWORD VARCHAR2(512) 
	, NAME VARCHAR2(18) NOT NULL
	, PHONE_NUM VARCHAR2(13) NOT NULL UNIQUE
	, EMAIL VARCHAR2(30) NOT NULL UNIQUE
	, ZIP_CODE NUMBER(5)
	, ADDRESS VARCHAR2(300)
	, ADDRESS_DETAIL VARCHAR2(300)
	, RRN VARCHAR2(13) NOT NULL
	, CUSTOMER_TYPE NUMBER(3) NOT NULL
	, AVAILABLE_BALANCE	NUMBER(15) NOT NULL
	, reg_date date NOT NULL
--	, CONSTRAINT FK_CUSTOMER_TYPE FOREIGN KEY(CUSTOMER_TYPE) REFERENCES TEST_CUSTOMER_TYPE(CUSTOMER_TYPE)
);
CREATE TABLE TEST_PRODUCT_LIST(
	PRODUCT_NUM NUMBER(3) PRIMARY KEY
--	, PRODUCT_TYPE VARCHAR2(30) NOT NULL --예적금/대출 >> 예금/대출을 같은 테이블에서 관리 불가
	, PRODUCT_TARGET NUMBER(1) NOT NULL --가입대상 개인 및 법인(단체)
	, PRODUCT_NAME VARCHAR2(30) NOT NULL --상품명
	, DESCRIPTION VARCHAR2(600) NOT NULL --상품설명
	, INTEREST_RATE NUMBER(5,4) NOT NULL --금리
	, INITIAL_DEPOSIT NUMBER(15) NOT NULL --가입금액 또는 대출한도 >> 가입금액
	, DATE_OF_DEPOSIT NUMBER(2) NOT NULL --가입기간
--	, AVAILABLE DATE DEFAULT sysdate NOT NULL --신규가입 한도일자
	, AVAILABLE NUMBER(1) NOT NULL --신규가입 가능여부
	);
CREATE SEQUENCE test_customer_seq;
CREATE TABLE CB_ACCOUNT(
	ACC_NUM NUMBER PRIMARY KEY
	, ACC_NAME VARCHAR2(21) NOT NULL
	, PRODUCT_NUM NUMBER(2) NOT NULL
	, CUSTOMER_ID NUMBER NOT NULL
	, INTEREST_RATE NUMBER(5,4) NOT NULL
	, REG_DATE DATE DEFAULT sysdate NOT NULL
	, RET_DATE DATE NOT NULL
	, BALANCE NUMBER NOT NULL
	, AVALIABLE NUMBER(1) NOT NULL
	, FOREIGN KEY(CUSTOMER_ID) REFERENCES TEST_CUSTOMER(CUSTOMER_ID)
	, FOREIGN KEY(PRODUCT_NUM) REFERENCES TEST_PRODUCT_LIST(PRODUCT_NUM)
	);
CREATE SEQUENCE cb_tran_seq;
CREATE TABLE CB_TRANSACTION(
  TRANSACTION_ID NUMBER DEFAULT cb_tran_seq.nextval PRIMARY KEY 
	, TRANSACTION_TYPE VARCHAR2(8) NOT NULL
	, TRANSACTION_DATE TIMESTAMP DEFAULT systimestamp NOT NULL
	, ACC_NUM NUMBER NOT NULL
	, TRAN_NAME VARCHAR2(21) NOT NULL
	, AMOUNT NUMBER(9) NOT NULL
	, AFTER_BALANCE NUMBER(9) DEFAULT 555 -- 추후 지워야할것
	, CONSTRAINT FK_ACC_NUM FOREIGN KEY(ACC_NUM) REFERENCES CB_ACCOUNT(ACC_NUM)
);
insert into test_customer values(1, 'admin', 'admin', '0000', '하다현', '01011119296', '2303110264@office.kopo.ac.kr',
00000, ' ', ' ', '123456', 1, 0, sysdate);
insert into test_customer values(202, 'k202', '', '0000', '하다현', '01026539296', 'ruhyeon_j@daum.net',
00000, ' ', '주소 미제공', 'RRN 미제공', 1, 0, sysdate);
insert into test_product_list
values(1, 1, 'Hi정기예금', '<b>제1조 은행의 책임</b><br>은행은 통장에 기록된 금액을 고객에게 현물로 지급하지 않는다.<br><br><b>제2조 개인정보 이용</br>은행은 고객의 개인정보가 유출되지 않도록 주의한다. 실수로 유출되었을 경우 고객은 은행에게 손해배상을 청구할 수 없다.', 4.5, 10000, 6, 1);
insert into test_product_list
values(2, 1, '내일부터적금', '<b>제1조 은행의 책임</b><br>은행은 통장에 기록된 금액을 고객에게 현물로 지급하지 않는다.<br><br><b>제2조 개인정보 이용</br>은행은 고객의 개인정보가 유출되지 않도록 주의한다. 실수로 유출되었을 경우 고객은 은행에게 손해배상을 청구할 수 없다.', 3.2, 100000, 12, 1);
insert into test_product_list
values(3, 1, '오예금', '<b>제1조 은행의 책임</b><br>은행은 통장에 기록된 금액을 고객에게 현물로 지급하지 않는다.<br><br><b>제2조 개인정보 이용</br>은행은 고객의 개인정보가 유출되지 않도록 주의한다. 실수로 유출되었을 경우 고객은 은행에게 손해배상을 청구할 수 없다.', 3.9, 50000, 6, 1);
insert into cb_account values(1234, '테스트통장', 1, 1, 4.5, sysdate, sysdate+100, 1);
insert into cb_account values(444444, '테스트통장2', 1, 1, 3.0, sysdate, sysdate+200, 1);
INSERT INTO CB_TRANSACTION(TRANSACTION_TYPE, acc_num, tran_name, amount) values('입금', 1234, '생활비', 500000);
INSERT INTO CB_TRANSACTION(TRANSACTION_TYPE, acc_num, tran_name, amount) values('출금', 1234, '책', 20000);
INSERT INTO CB_TRANSACTION(TRANSACTION_TYPE, acc_num, tran_name, amount) values('출금', 1234, '술', 30000);
INSERT INTO CB_TRANSACTION(TRANSACTION_TYPE, acc_num, tran_name, amount) values('빚', 1234, '술값', 5000);

INSERT INTO CB_TRANSACTION(TRANSACTION_TYPE, acc_num, tran_name, amount) values('출금', 444444, '책', 20000);
INSERT INTO CB_TRANSACTION(TRANSACTION_TYPE, acc_num, tran_name, amount) values('출금', 444444, '책', 20000);
INSERT INTO CB_TRANSACTION(TRANSACTION_TYPE, acc_num, tran_name, amount) values('출금', 444444, '책', 20000);
INSERT INTO CB_TRANSACTION(TRANSACTION_TYPE, acc_num, tran_name, amount) values('출금', 444444, '책', 20000);
COMMIT;


DROP TABLE CB_TRANSACTION ;
DROP TABLE CB_ACCOUNT ;
DROP TABLE TEST_PRODUCT_LIST ;
DROP TABLE TEST_CUSTOMER ;
DROP SEQUENCE CB_TRAN_SEQ;
DROP SEQUENCE test_customer_seq;