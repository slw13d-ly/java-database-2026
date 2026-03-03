-- NULL 데이터로 발생하는 현상
-- NULL은 개수나 통계에서 계산되지 않는 문제 발생
SELECT SUM(salary), count(salary), count(*)
  FROM EMPLOYEE;

-- NUL() NULL여부를 판단, 값이 NULL일 경우 다른 데이터로 반환
SELECT emp_id
     , emp_name
     , NVL(salary, 0) AS "SALARY"
     , NVL2(salary, '0', 'X') AS "IS_SALARY_OK"
     , TO_CHAR(hire_date, 'YYYY-MM-DD') AS "입사일"
     , DEPT_ID
  FROM EMPLOYEE
 -- WHERE SALARY IS NULL;