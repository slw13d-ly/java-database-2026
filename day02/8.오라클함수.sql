-- 문자열 함수
-- 대문자, 소문자, 첫글자만 대문자 변환 함수
SELECT c.cust_name
     , LOWER(c.cust_name) AS "고객명"
     , INITCAP(LOWER(c.cust_name)) AS "고객명"
     , c.city
     , UPPER(c.city) AS "도시명"
  FROM CUSTOMER c ;

-- WHERE절에도 사용 가능
SELECT *
  FROM CUSTOMER c 
 WHERE lower(c.CITY) = 'seoul';

-- 문자열 길이
SELECT city, LENGTH(city) AS "글자 길이"
  FROM CUSTOMER c 
  
-- 문자열 추출
SELECT emp_name, SUBSTR(emp_name, 4, 1)
  FROM employee
  
-- 문자열에서 찾기
SELECT INSTR('HELLO, ORACLE!', 'L') AS "첫번째 L의 위치"
     , INSTR('HELLO, ORACLE!', 'L', 5) AS "5번째 이후 L의 위치를 찾을 때"
     , INSTR('HELLO, ORACLE!', 'L', 2, 2) AS "2번째 위치 이후 두 번째 나타나는 L의 위치"
  FROM dual;

-- 문자열 교체
SELECT REPLACE('Oh, Hello Oracle', 'Hello', 'HELL')
  FROM dual;

-- 빈공간을 특정문자로 채우기
SELECT lpad('Matrix', 20, '#'),
       rpad('Oracle', 20, '@')
  FROM dual;

SELECT lpad('10', 2, 0) FROM dual;

-- 두 문자열 합치기
SELECT concat('Hello', 'World')
  FROM dual;

-- 공백 제거
SELECT TRIM('      Marvel Universe      ')
     , LTRIM('      Marvel Universe      ')
     , RTRIM('      Marvel Universe      ')
  FROM dual;

SELECT 1 AS "같아요"
  FROM dual
 WHERE 'Hello World' = trim('      Hello World'); -- `WHERE 'Hello World' = ('      Hello World')`은 같다고 안나옴
 
 -- 숫자 함수
 SELECT ROUND(1234.3456)
 	  , ROUND(1234.3456, 3) -- 소수점 세번째 자리까지 반올림
      , TRUNC(1234.3456, 1)
      , CEIL(3.14)
      , FLOOR(3.14) -- 무조건 올림, 5이상 미만 상관 없음.
      , MOD(10, 2)
   FROM dual;