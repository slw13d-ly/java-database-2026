-- 곱셈연산자, 비교연산자
-- 동등연산자 = (== 아님!)
SELECT emp_name, salary, salary * 12 AS "ANNUAL", hire_date
  FROM EMPLOYEE
 WHERE (SALARY * 12) <>37000;

-- NOT 
SELECT emp_name, salary, salary * 12 AS "ANNUAL", hire_date
  FROM EMPLOYEE
 WHERE NOT (SALARY * 12) = 37000;

-- IN = OR와 동일
SELECT e.*
  FROM EMPLOYEE e 
 WHERE e.DEPT_ID  = 1 OR e.DEPT_ID = 4;

SELECT e.*
  FROM EMPLOYEE e 
 WHERE e.DEPT_ID  NOT IN (1, 4);

-- BETWEEN
-- HIRE_DATE는 날짜형이지만 날짜타입의 문자열과 비교 가능
-- 2022 한해 동안 입사한 직원정보 조회
SELECT *
  FROM EMPLOYEE e 
 WHERE e.HIRE_DATE >= '2022-01-01'
   AND e.HIRE_DATE <= '2022-12-31';

SELECT *
  FROM EMPLOYEE e 
 WHERE e.HIRE_DATE BETWEEN '2022-01-01' AND '2022-12-31';

SELECT *
  FROM EMPLOYEE e 
 WHERE e.SALARY BETWEEN 3000 AND 6000;

-- LIKE - 문자열의 패턴을 검색
-- % _ 중 현업에는 % 제일 많이 사용
-- Seoul : _eo__, %eo%, %_eo% 전부 동일하게 검색
SELECT *
  FROM CUSTOMER 
 WHERE CITY LIKE '%eo%';

-- NULL 비교
SELECT *
  FROM customer 
 WHERE city IS NULL;

-- 문제 1
SELECT *
  FROM EMPLOYEE e 


-- 문제 2
SELECT cust_name AS "고객이름"
     , reg_date AS "가입일"
     , city
  FROM customer e 
 WHERE e.city = 'Seoul'
 ORDER BY e.reg_date DESC;

-- 문제 3
