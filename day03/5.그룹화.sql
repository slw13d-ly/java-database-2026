-- 그룹화
-- 테이블 데이터도 사용 어렵고, 쿼리가 복잡해짐
SELECT AVG(salary), 1 FROM EMPLOYEE WHERE DEPT_ID = 1
UNION all
SELECT AVG(salary), 2 FROM EMPLOYEE WHERE DEPT_ID = 2
UNION all
SELECT AVG(salary), 3 FROM EMPLOYEE WHERE DEPT_ID = 3
UNION all
SELECT AVG(salary), 4 FROM EMPLOYEE WHERE DEPT_ID = 4 ;

-- 그릅화 하면 간결
SELECT AVG(salary), DEPT_ID 
  FROM EMPLOYEE 
 GROUP BY DEPT_ID 
 ORDER BY DEPT_ID;

-- 다중행 함수를 사용할 때
-- 일반 칼럼을 사용하려면 무조건!
-- GROUP BY에 추가해야 함. 
SELECT AVG(salary), count(salary), DEPT_ID 
  FROM EMPLOYEE 
 GROUP BY DEPT_ID;

-- HAVING절, 다중행의 필터링
SELECT AVG(salary), count(salary), DEPT_ID 
  FROM EMPLOYEE 
-- WHERE salary <= 8000; -- 일반값 필터링
 GROUP BY DEPT_ID
HAVING AVG(salary) >= 6000 -- 다중행함수 필터링
 ORDER BY DEPT_ID;

-- 그룹화 통계
SELECT AVG(salary), count(salary), DEPT_ID -- 원본
  FROM EMPLOYEE 
 GROUP BY ROLLUP(DEPT_ID);

SELECT NVL(TO_CHAR(DEPT_ID), '--총합--') AS "부서코드"  
     , AVG(salary), count(salary) 
  FROM EMPLOYEE 
 GROUP BY ROLLUP(DEPT_ID);
 ORDER BY DEPT_ID;
