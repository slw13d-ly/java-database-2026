-- 날짜 출력
SELECT sysdate AS now
     , sysdate-1 AS yesterday -- 오류를 줄이기 위해 별명 사용 시 ""을 쓰는걸 권장.
     , sysdate+1 AS tomorrow
  FROM dual;  

-- 달을 증가시키는 함수
SELECT sysdate AS "current"
     , ADD_MONTHS(sysdate, 2) AS "3monthlater"
  FROM dual;

-- 입사 10주년이 되는 사원 조회
SELECT emp_id, emp_name, hire_date
     , ADD_MONTHS(hire_date, 2) AS "Anniversal10Years"
  FROM EMPLOYEE;

-- 두 날짜간의 개월 수 차이, 우리회사 가장 입사 오래된 직원과 가장 최근에 입사한 직원 사이 개월 수
SELECT MIN(hire_date), MAX(hire_date)
     , MONTHS_BETWEEN(MIN(hire_date), MAX(hire_date)) AS "OldesbewNawest"
  FROM EMPLOYEE;

-- 돌아오는 요일, 달의 마지막 날짜 구하기
SELECT sysdate
     , NEXT_DAY(sysdate, '월요일')
     , LAST_DAY(ADD_MONTHS(sysdate, -1))
  FROM EMPLOYEE; 

-- 
SELECT *
  FROM nls_session_parameters
 WHERE PARAMETER = "NLS_DATE_LANGUAGE";

ALTER SESSION SET NLS_DATE_LANGUAGE = KOREAN; -- AMERICAN;

-- 
SELECT current_date FROM dual;

/* 형변환 */
SELECT emp_id, emp_name, emp_id + '500' -- 자동형변환
  FROM EMPLOYEE;

SELECT 'EMP' + emp_id, emp_name
  FROM EMPLOYEE;

-- TO_CHAR() - 날짜, 숫자 데이터를 문자 데이터 변환
SELECT to_char(CURRENT_DATE, 'YYY-MM-DD HH24:MI:SS') AS "현재 일시"
  FROM dual;

SELECT TO_CHAR(SALARY, '$999,999') AS "SAL_$"
     , TO_CHAR(SALARY, 'L999,999') AS "SAL_L" -- 지역화폐단위, 위에서 한국으로 설정해서 한국으로 나오는 것.
     , TO_CHAR(SALARY, '999,999,00') AS "SAL_1" -- 소수점 표현
  FROM EMPLOYEE;

-- TO_NUMBER() 문자 데이터를 숫자 데이터로
SELECT 1300 + '1500'
  FROM dual;

SELECT 1,300 + '1,500' -- 1000(천) 단위 쉼표가 포함된 문자열은 자동형변환 X
  FROM dual;

-- 1000(천) 단위 쉼표가 표현된 문자 데이터면 숫자 포맷을 사용, 숫자로 형변환 해줘야 함.
SELECT TO_NUMBER('1,300', '999,999') + TO_NUMBER('1,500', '999,999')
  FROM dual;

-- TO_DATE() 문자형식으로 된 날짜 데이터를 날짜형으로 변경
SELECT TO_DATE('2026-03-03') AS TODATE1
     , TO_DATE('2026-03-03', 'YYYY-MM-DD') AS TODATE2
     , TO_CHar(TO_DATE('2026-03-03', 'YYYY-MM-DD'), 'YYYY-MM-DD') AS TODATE3
  FROM dual; 