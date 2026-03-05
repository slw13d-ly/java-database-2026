-- DML 계속
SELECT * 
  FROM EMP_TEMP;

-- INSERT
INSERT INTO emp_temp (empno, ename, job, mgr, hiredate, sal, comm, deptno)
VALUES (9999, '홍길동', 'PRESIDENT', NULL, '2001-01-01', 5000, 1000, 1);

-- 날짜 포캣이 다르면 날짜함수로 변경해주면 됨
INSERT INTO emp_temp (empno, ename, job, mgr, hiredate, sal, comm, deptno)
VALUES (9999, '홍길동', 'PRESIDENT', NULL, TO_DATE('01-01-2001', 'MM/DD/YYYY'), 5000, 1000, 1);

-- SELECT 쿼리를 사용해서 INSERT하는 방법

INSERT INTO emp_temp (empno, ename, job, mgr, hiredate, sal, comm, deptno)
SELECT e.empno, e.ename, e.job, e.mgr, e.hiredate, e.sal, e.comm, e.deptno
  FROM emp e, salgrade s
 WHERE e.sal BETWEEN s.losal AND s.hisal 
   AND s.grade = 1;