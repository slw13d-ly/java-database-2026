-- emp_bult 테이블 생성
CREATE TABLE emp_bulk (
    empno number primary key,
    ename varchar2(100),
    sal   number
);

-- 데이터 건수 확인
SELECT count(*) FROM EMP_BULK;

-- 데이터 삭제
TRUNCATE TABLE emp_bulk;