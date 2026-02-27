-- 조건없는 쿼리
SELECT * 
  FROM PRODUCT;

-- prod_id가 108번인 품목 조회
SELECT * 
  FROM PRODUCT
 WHERE PROD_ID = 108;

-- employee에서 dept_id가 2번인 직원만 조회
SELECT * 
  FROM EMPLOYEE e 
 WHERE e.DEPT_ID = 2;

-- employee에서 dept_id가 4번이고 월급이 5991달러인 직원 조회
SELECT * 
  FROM EMPLOYEE e
 WHERE e.DEPT_ID = 4
   AND e.SALARY = 5991;
   
 -- or 연산자, employee에서 dept_id가 1또는 4번인 직원들 조회
SELECT * 
  FROM EMPLOYEE e
 WHERE e.DEPT_ID = 1
    OR e.DEPT_ID = 4;