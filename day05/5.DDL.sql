-- DDL - CREATE

-- 테이블 생성
CREATE TABLE emp_ddl(
	empno		number(4),
	ename		varchar2(10),
	job			varchar2(9),
	mgr			number(4),
	hiredate	DATE, 
	sal			number(7, 2),
	comm		number(7, 2),
	depno		number(2)
);

ROLLBACK ;

-- 테이블 삭제
DROP TABLE EMP_DDL;

DROP TABLE EMP_TEMP;