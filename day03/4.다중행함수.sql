-- sum 합산 함수
SELECT sum(SALARY)
  FROM EMPLOYEE;

-- 아무 의미 없음
SELECT sum(DEPT_ID)
  FROM EMPLOYEE;

-- 각 레코드(한 줄, 로우, 행)로 개수를 구할 수 있음
SELECT count(*)
  FROM EMPLOYEE;

-- 특정 칼럼의 갯수로 구할 수 있음
SELECT count(DISTINCT DEPT_ID)
  FROM EMPLOYEE;

-- salary 합산 596,490
-- salary 개수 97
-- 전체 데이터 100
SELECT AVG(SALARY)
  FROM EMPLOYEE;

SELECT min(SALARY), max(SALARY)
  FROM EMPLOYEE;

-- min, max 날짜도 가능
SELECT min(HIRE_DATE), max(HIRE_DATE)
  FROM EMPLOYEE;