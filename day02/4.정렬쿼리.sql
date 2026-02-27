-- 정렬
-- 내림차순 - 우리 회사에서 가장 월급이 많은 사람부터
SELECT * 
  FROM EMPLOYEE e 
 ORDER BY e.SALARY DESC;

-- 가장 먼저 입사한 사람부터
SELECT * 
  FROM EMPLOYEE e 
 ORDER BY e.HIRE_DATE ASC; 

-- 부서별 정리
SELECT * 
  FROM EMPLOYEE e 
 ORDER BY e.DEPT_ID ASC; 

-- 부서별 급여가 많은 직원 조회
SELECT *
  FROM EMPLOYEE e 
 ORDER BY e.DEPT_ID ASC, e.salary DESC;