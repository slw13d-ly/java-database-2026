-- 품목 전체 열 조회 1 - 최초 조회
SELECT * 
  FROM product;

-- 품목 전체 열 조회 2 - 실제 작업 시
SELECT prod_id, prod_name, price FROM product;

-- 품목 열 이름 변경 / 별명
-- alias 1
SELECT prod_id AS "품목아이디"
	 , prod_name AS "품목명"
	 , price AS "가격"
  FROM product;

-- alias 2 - AS 키워드 생략 가능
SELECT prod_id "품목아이디"
	 , prod_name "품목명"
	 , price "가격"
  FROM product;

-- alias 3 - 테이블명을 동일하게 쓰면 `테이블명. `으로 컬럼을 지정해도 되고, 안해도 됨
SELECT product.prod_id "품목아이디"
	 , product.prod_name "품목명"
	 , price "가격"
  FROM product; 
 
-- alias 4 - 테이블명에 별명을 지정하면, 컬럼명 사용시 반드시 `별명. `으로 사용해야 함 
 SELECT prd.prod_id "품목아이디"
	  , prd.prod_name "품목명"
	  , prd.price "가격"
   FROM product prd; -- product를 prd으로 바꾸어 부르겠다.
  
  -- alias 5
  SELECT EMP_ID -- 형태가 이런 이유는 그냥 보기 편하라고 ㅎ
       , EMP_NAME
  	   , SALARY
  	   , salary * 12 AS "ANNUAL_SALARY"
  	   , HIRE_DATE
  	   , DEPT_ID 
    FROM employee;