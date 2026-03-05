-- 트랜잭션

-- DEPT테이블 복사
CREATE TABLE dept_tcl
    AS SELECT * 
         FROM dept;

SELECT * FROM dept_tcl;

-- 트랜잭션 시작
COMMIT;

INSERT INTO dept_tcl (deptno, dname, loc)
VALUES (60, 'UNIT TEST', 'DELI');

ROLLBACK;