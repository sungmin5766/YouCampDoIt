-- 회원정보 수정용 쿼리문
UPDATE MEMBER
   SET BIRTH_DATE = #{birthDate}
     , PHONE = #{phone}
     , ADDRESS = #{address}
 WHERE MEMBER_NO = #{memberNo}
   AND STATUS = 'Y'

---------------------------------------------------------------
-- 1. 장바구니 목록 조회용 쿼리문
SELECT M.MEMBER_NO
     , C.CART_NO
     , C.QUANTITY
     , C.PRICE AS CART_PRICE
     , C.ADDED_AT
     , G.GOODS_NO
     , G.CATEGORY
     , G.GOODS_NAME
     , G.GOODS_THUMBNAIL
     , G.PRICE AS GOODS_PRICE
  FROM CART C
  JOIN MEMBER M ON C.MEMBER_NO = M.MEMBER_NO
  JOIN GOODS G ON C.GOODS_NO = G.GOODS_NO
 WHERE M.MEMBER_NO = 1
 
 commit
 

  
-- 2. 장바구니 추가용 쿼리문
INSERT INTO CART(CART_NO
               , QUANTITY
               , PRICE
               , ADDED_AT
               , MEMBER_NO
               , GOODS_NO)
          VALUES(CART_SEQ.NEXTVAL
               , ?
               , ? * (SELECT PRICE FROM GOODS WHERE GOODS_NO = ?)
               , SYSDATE
               , ?
               , ?)

-- 장바구니 중복확인
SELECT COUNT(*) AS COUNT
  FROM CART
 WHERE GOODS_NO = ?
            
-- 장바구니 삭제용 쿼리문
DELETE
  FROM CART
 WHERE CART_NO = ?
 
-- 장바구니 수량변경+-버튼으로 수량변경 쿼리문
UPDATE CART
   SET QUANTITY = ?
      , PRICE = (
                SELECT PRICE 
                  FROM GOODS 
                 WHERE GOODS_NO = (
                            SELECT GOODS_NO 
                              FROM CART 
                             WHERE CART_NO = ?
                             )
                  ) * ?
      , ADDED_AT = SYSDATE
WHERE MEMBER_NO = ?
  AND CART_NO = ?
  
-- 결제 완료 후 orderNo 기준으로 장바구니 삭제
-- orderNo > orderDetail테이블 > goodsNo > 카트 삭제
DELETE FROM CART
 WHERE GOODS_NO 
    IN (SELECT GOODS_NO
          FROM ORDER_DETAIL
         WHERE ORDER_NO = ?)
 
 
------------------------------------------
-- 주문 insert
INSERT INTO GOODS_ORDER(ORDER_NO
                      , PAYMENT_ID
                      , TOTAL_PRICE
                      , CREATED_DATE
                      , PAYMENT_METHOD
                      , PAYMENT_STATUS
                      , UPDATED_DATE
                      , MEMBER_NO) 
                VALUES (ORDER_SEQ.NEXTVAL
                      , NULL
                      , ?
                      , SYSDATE
                      , NULL
                      , 'CREATED'
                      , NULL
                      , ?)
-- 주문상세 insert
INSERT INTO ORDER_DETAIL(ORDER_DETAIL_NO
                       , QUANTITY
                       , PRICE
                       , TOTAL_PRICE
                       , GOODS_NO
                       , ORDER_NO)
                  VALUES(ORD_DETAIL_SEQ.NEXTVAL
                       , ?
                       , (SELECT PRICE FROM GOODS WHERE GOODS_NO = ?)
                       , ?
                       , ?
                       , ?)
                       


-- 주문화면 및 결제하기 위한 order 조회
SELECT *
  FROM GOODS_ORDER
 WHERE ORDER_NO = ?
-- 주문화면 및 결제하기 위한 orderDetail 
-- goodsName goodsInfo 조회해가야함
SELECT OD.*
     , G.GOODS_NAME
     , G.GOODS_INFO
     , G.GOODS_THUMBNAIL
  FROM ORDER_DETAIL OD
  JOIN GOODS G ON (OD.GOODS_NO = G.GOODS_NO)
 WHERE ORDER_NO = ?

UPDATE GOODS_ORDER
   SET PAYMENT_ID = ?
     , PAYMENT_METHOD = ?
     , PAYMENT_STATUS = 'PAID'
     , UPDATED_DATE = SYSDATE
 WHERE ORDER_NO = ?
  
---------------------------------------------




























----------------------------------------------

-- 대여용품 더미데이터

INSERT INTO GOODS (GOODS_NO, CATEGORY, GOODS_NAME, GOODS_THUMBNAIL, GOODS_CONTENT, GOODS_INFO, MARK, PRICE, DISCOUNT, VIEWS, ENROLL_DATE, TOTAL_STOCK, REMAIN_STOCK, STATUS) VALUES
( 1, '텐트', '캠핑용 4인용 텐트', NULL, '4인 가족이 사용할 수 있는 넉넉한 캠핑 텐트.', '4인용 텐트', NULL, 80000, 0, 0, SYSDATE, 10, 10, 'Y');

INSERT INTO GOODS (GOODS_NO, CATEGORY, GOODS_NAME, GOODS_THUMBNAIL, GOODS_CONTENT, GOODS_INFO, MARK, PRICE, DISCOUNT, VIEWS, ENROLL_DATE, TOTAL_STOCK, REMAIN_STOCK, STATUS) VALUES
( 2, '텐트', '2인용 초경량 텐트', NULL, '2인용 초경량 텐트로 가볍고 설치가 쉬움.', '초경량 2인용 텐트', NULL, 50000, 0, 0, SYSDATE, 15, 15, 'Y');

INSERT INTO GOODS (GOODS_NO, CATEGORY, GOODS_NAME, GOODS_THUMBNAIL, GOODS_CONTENT, GOODS_INFO, MARK, PRICE, DISCOUNT, VIEWS, ENROLL_DATE, TOTAL_STOCK, REMAIN_STOCK, STATUS) VALUES
( 3, '타프', '대형 타프', NULL, '햇빛을 차단할 수 있는 대형 타프.', '캠핑용 대형 타프', NULL, 40000, 0, 0, SYSDATE, 8, 8, 'Y');

INSERT INTO GOODS (GOODS_NO, CATEGORY, GOODS_NAME, GOODS_THUMBNAIL, GOODS_CONTENT, GOODS_INFO, MARK, PRICE, DISCOUNT, VIEWS, ENROLL_DATE, TOTAL_STOCK, REMAIN_STOCK, STATUS) VALUES
( 11, '체어', '폴딩 캠핑 체어', NULL, '편안한 캠핑용 접이식 의자.', '접이식 캠핑 체어', NULL, 15000, 0, 0, SYSDATE, 30, 30, 'Y');

INSERT INTO GOODS (GOODS_NO, CATEGORY, GOODS_NAME, GOODS_THUMBNAIL, GOODS_CONTENT, GOODS_INFO, MARK, PRICE, DISCOUNT, VIEWS, ENROLL_DATE, TOTAL_STOCK, REMAIN_STOCK, STATUS) VALUES
( 5, '테이블', '접이식 캠핑 테이블', NULL, '다목적 접이식 테이블, 4인용.', '4인용 캠핑 테이블', NULL, 30000, 0, 0, SYSDATE, 20, 20, 'Y');

INSERT INTO GOODS (GOODS_NO, CATEGORY, GOODS_NAME, GOODS_THUMBNAIL, GOODS_CONTENT, GOODS_INFO, MARK, PRICE, DISCOUNT, VIEWS, ENROLL_DATE, TOTAL_STOCK, REMAIN_STOCK, STATUS) VALUES
( 6, '텐트', '6인용 대형 텐트', NULL, '대형 가족 캠핑에 적합한 6인용 텐트.', '대형 가족 텐트', NULL, 120000, 0, 0, SYSDATE, 5, 5, 'Y');

INSERT INTO GOODS (GOODS_NO, CATEGORY, GOODS_NAME, GOODS_THUMBNAIL, GOODS_CONTENT, GOODS_INFO, MARK, PRICE, DISCOUNT, VIEWS, ENROLL_DATE, TOTAL_STOCK, REMAIN_STOCK, STATUS) VALUES
( 7, '체어', '캠핑 리클라이너 체어', NULL, '편안한 캠핑 리클라이너 체어.', '리클라이너 캠핑 체어', NULL, 35000, 0, 0, SYSDATE, 25, 25, 'Y');

INSERT INTO GOODS (GOODS_NO, CATEGORY, GOODS_NAME, GOODS_THUMBNAIL, GOODS_CONTENT, GOODS_INFO, MARK, PRICE, DISCOUNT, VIEWS, ENROLL_DATE, TOTAL_STOCK, REMAIN_STOCK, STATUS) VALUES
( 8, '테이블', '롤업 캠핑 테이블', NULL, '간편히 접을 수 있는 롤업 테이블.', '롤업 테이블', NULL, 45000, 0, 0, SYSDATE, 15, 15, 'Y');

INSERT INTO GOODS (GOODS_NO, CATEGORY, GOODS_NAME, GOODS_THUMBNAIL, GOODS_CONTENT, GOODS_INFO, MARK, PRICE, DISCOUNT, VIEWS, ENROLL_DATE, TOTAL_STOCK, REMAIN_STOCK, STATUS) VALUES
( 9, '조명', 'LED 랜턴', NULL, '밝고 오래 지속되는 캠핑용 LED 랜턴.', '캠핑용 LED 랜턴', NULL, 20000, 0, 0, SYSDATE, 30, 30, 'Y');

INSERT INTO GOODS (GOODS_NO, CATEGORY, GOODS_NAME, GOODS_THUMBNAIL, GOODS_CONTENT, GOODS_INFO, MARK, PRICE, DISCOUNT, VIEWS, ENROLL_DATE, TOTAL_STOCK, REMAIN_STOCK, STATUS) VALUES
( 10, '쿨러', '휴대용 캠핑 쿨러', NULL, '음식을 신선하게 보관할 수 있는 캠핑 쿨러.', '휴대용 쿨러', NULL, 55000, 0, 0, SYSDATE, 10, 10, 'Y');

INSERT INTO GOODS (GOODS_NO, CATEGORY, GOODS_NAME, GOODS_THUMBNAIL, GOODS_CONTENT, GOODS_INFO, MARK, PRICE, DISCOUNT, VIEWS, ENROLL_DATE, TOTAL_STOCK, REMAIN_STOCK, STATUS) VALUES
( 11, '소모품', '캠핑용 장작', NULL, '건조된 장작으로 화력이 강하고 오래 타는 장작.', '캠핑용 장작', NULL, 10000, 0, 0, SYSDATE, 50, 50, 'Y');

INSERT INTO GOODS (GOODS_NO, CATEGORY, GOODS_NAME, GOODS_THUMBNAIL, GOODS_CONTENT, GOODS_INFO, MARK, PRICE, DISCOUNT, VIEWS, ENROLL_DATE, TOTAL_STOCK, REMAIN_STOCK, STATUS) VALUES
( 12, '소모품', '이소가스', NULL, '휴대용 가스버너와 함께용하는 이소가스.', '캠핑용 이소가스', NULL, 5000, 0, 0, SYSDATE, 100, 100, 'Y');

INSERT INTO GOODS (GOODS_NO, CATEGORY, GOODS_NAME, GOODS_THUMBNAIL, GOODS_CONTENT, GOODS_INFO, MARK, PRICE, DISCOUNT, VIEWS, ENROLL_DATE, TOTAL_STOCK, REMAIN_STOCK, STATUS) VALUES
( 13, '소모품', '캠핑용 일회용 접시', NULL, '캠핑에서 사용할 수 있는 가벼운 일회용 접시.', '일회용 접시', NULL, 3000, 0, 0, SYSDATE, 200, 200, 'Y');

INSERT INTO GOODS (GOODS_NO, CATEGORY, GOODS_NAME, GOODS_THUMBNAIL, GOODS_CONTENT, GOODS_INFO, MARK, PRICE, DISCOUNT, VIEWS, ENROLL_DATE, TOTAL_STOCK, REMAIN_STOCK, STATUS) VALUES
( 14, '소모품', '캠핑용 휴대용 물통', NULL, '물을 보관할 수 있는 캠핑용 휴대용 물통.', '휴대용 물통', NULL, 8000, 0, 0, SYSDATE, 50, 50, 'Y');

INSERT INTO GOODS (GOODS_NO, CATEGORY, GOODS_NAME, GOODS_THUMBNAIL, GOODS_CONTENT, GOODS_INFO, MARK, PRICE, DISCOUNT, VIEWS, ENROLL_DATE, TOTAL_STOCK, REMAIN_STOCK, STATUS) VALUES
( 15, '소모품', '캠핑용 손난로', NULL, '추운 날씨에 적합한 휴대용 손난로.', '휴대용 손난로', NULL, 4000, 0, 0, SYSDATE, 100, 100, 'Y');
commit
--------------------------------------------------------------
--
-- CART 더미데이터

INSERT INTO CART (CART_NO, QUANTITY, PRICE, ADDED_AT, MEMBER_NO, GOODS_NO) VALUES
(1, 2, 160000, SYSDATE, 1, 1);

INSERT INTO CART (CART_NO, QUANTITY, PRICE, ADDED_AT, MEMBER_NO, GOODS_NO) VALUES
(2, 1, 50000, SYSDATE, 1, 2);

INSERT INTO CART (CART_NO, QUANTITY, PRICE, ADDED_AT, MEMBER_NO, GOODS_NO) VALUES
(3, 3, 120000, SYSDATE, 1, 3);

INSERT INTO CART (CART_NO, QUANTITY, PRICE, ADDED_AT, MEMBER_NO, GOODS_NO) VALUES
(4, 1, 15000, SYSDATE, 1, 4);

INSERT INTO CART (CART_NO, QUANTITY, PRICE, ADDED_AT, MEMBER_NO, GOODS_NO) VALUES
(5, 2, 60000, SYSDATE, 1, 5);

INSERT INTO CART (CART_NO, QUANTITY, PRICE, ADDED_AT, MEMBER_NO, GOODS_NO) VALUES
(6, 1, 120000, SYSDATE, 1, 6);

INSERT INTO CART (CART_NO, QUANTITY, PRICE, ADDED_AT, MEMBER_NO, GOODS_NO) VALUES
(7, 98, 105000, SYSDATE, 1, 7);

INSERT INTO CART (CART_NO, QUANTITY, PRICE, ADDED_AT, MEMBER_NO, GOODS_NO) VALUES
(8, 2, 90000, SYSDATE, 1, 8);

INSERT INTO CART (CART_NO, QUANTITY, PRICE, ADDED_AT, MEMBER_NO, GOODS_NO) VALUES
(9, 99, 60000, SYSDATE, 1, 9);

INSERT INTO CART (CART_NO, QUANTITY, PRICE, ADDED_AT, MEMBER_NO, GOODS_NO) VALUES
(10, 1, 55000, SYSDATE, 1, 10);
commit;
