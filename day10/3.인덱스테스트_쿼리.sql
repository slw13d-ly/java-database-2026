-- 인덱스 테스트 시작!
SELECT count(*) FROM ORDERS_BIG;

-- 오라클 옵티마이저 갱신 설정 = 통계 갱신: 어떤 실행계획이 가장 빠른지 판단 위해 필요! 옵티마이저 갱신을 하지 않으면 틀린 판단
BEGIN 
	DBMS_STATS.GATHER_TABLE_STATS(
		ownname => USER,
		tabname => 'ORDERS_BIG',
		CASCADE => TRUE
	);
END;


/*
 * ORDER_ID에 PK 제약조건, ORDER_ID에만 인덱스 자동 생성
 * 나머지 NOT_NULL 제약조건
 * */
SELECT * FROM ORDERS_BIG;

-- 인덱스가 없는 상태 조회 -- 대략 0.2s 소요
SELECT count(*)
  FROM orders_big
 WHERE customer_id = 12345;

-- 실행계획(Execution Plen) 확인
-- 중급 이상 DB개발자즐이 확인하는 기능
explain plan FOR
SELECT count(*)
  FROM orders_big
 WHERE customer_id = 12345;

SELECT * FROM table(DBMS_XPLAN.DISPLAY);
-- 위 실행계획에서 가장 유심히 볼 것 → TABLE ACCESS FULL(FULL TABLE SCAN) => 튜닝의 시작점
-- 300만건을 전부 읽어 12345를 찾는 것

-- CUSTOMER_IN에 인덱스 생성
CREATE INDEX IDX_ORDERS_BIG_CUSTOMER_ID
    ON ORDERS_BIG(CUSTOMER_ID);

-- 오라클 옵티마이저 재갱신 설정
BEGIN 
	DBMS_STATS.GATHER_TABLE_STATS(
		ownname => USER,
		tabname => 'ORDERS_BIG',
		CASCADE => TRUE
	);
END;

-- 인덱스가 없는 상태 조회 --0.003s 소요!!!! 50배 속도 개선. 겁내 빠름
SELECT count(*)
  FROM orders_big
 WHERE customer_id = 12345;

-- 실행계획(Execution Plen) 재확인
explain plan FOR
SELECT count(*)
  FROM orders_big
 WHERE customer_id = 12345;

SELECT * FROM table(DBMS_XPLAN.DISPLAY);
-- TABLE ACCESS FULL이 INDEX RANGE SCAN으로 변경
-- 전체 COST가 5641정도에서 3으로 대폭 축소 → 성능 개선

/* 인덱스 효과가 별로 없는 컬럼*/
-- STATUS 컬럼 - READY(준비), PAID(결제), SHIPPED(배송중), DONE(배송완료), CANCEL(취소)
SELECT count(*)
  FROM orders_big
 WHERE status = 'PAID';

-- 실행계획
explain plan FOR
SELECT count(*)
  FROM orders_big
 WHERE status = 'PAID';

SELECT * FROM table(DBMS_XPLAN.DISPLAY);

-- STATUS 칼럼 인덱스 부여
CREATE INDEX IDX_ORDERS_BIG_STATUS
    ON ORDERS_BIG(STATUS);
    
-- 재실행
SELECT count(*)
  FROM orders_big
 WHERE status = 'PAID';

explain plan FOR
SELECT count(*)
  FROM orders_big
 WHERE status = 'PAID';

SELECT * FROM table(DBMS_XPLAN.DISPLAY);

-- 검색하는데 데이터가 전체의 20% 정도이므로 
-- INDEX RANGE SCAN을 해도 비용이 많이 줄지 않음


/* 복합 인덱스, 여러 칼럼에 인덱스 부여*/
SELECT * 
  FROM ORDERS_BIG
 WHERE CUSTOMER_ID BETWEEN 1234 AND 23456
   AND ORDER_DATE BETWEEN '2024-01-01' AND '2024-12-31';

-- 실행계획
explain plan FOR
SELECT * 
  FROM ORDERS_BIG
 WHERE CUSTOMER_ID BETWEEN 1234 AND 23456
   AND ORDER_DATE BETWEEN '2024-01-01' AND '2024-12-31';

SELECT * FROM table(DBMS_XPLAN.DISPLAY);

-- 복합인덱스 적용
CREATE INDEX IDX_ORDERS_CUST_DATE
    ON ORDERS_BIG(CUSTOMER_ID, ORDER_DATE);

-- 인덱스 적용후 재실행
SELECT *
  FROM ORDERS_BIG
WHERE CUSTOMER_ID BETWEEN 12345 AND 23456
  AND ORDER_DATE BETWEEN '2024-01-01' AND '2024-12-31';

-- 실행계획
-- 인덱스는 만들어졌는데 옵티마이저가 FULL TABLE SCAN이 더 빠르다고 판단. 
EXPLAIN PLAN FOR
SELECT *
  FROM ORDERS_BIG
WHERE CUSTOMER_ID BETWEEN 12345 AND 23456
  AND ORDER_DATE BETWEEN '2024-01-01' AND '2024-12-31';

SELECT * FROM table(DBMS_XPLAN.DISPLAY);

-- BETWEEN AND 쿼리는 인덱스의 도움을 못받을 수 있음
EXPLAIN PLAN FOR
SELECT *
  FROM ORDERS_BIG
WHERE CUSTOMER_ID = 23456
  AND ORDER_DATE BETWEEN '2024-01-01' AND '2024-12-31';

SELECT * FROM table(DBMS_XPLAN.DISPLAY);

-- 인덱스 확인 쿼리
SELECT *
  FROM USER_INDEXES
 WHERE TABLE_NAME = 'ORDERS_BIG';