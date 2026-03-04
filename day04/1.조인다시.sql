-- 조인 한 번더
SELECT d.deptno, d.dname, d.loc 
     , e.empno, e.ename, e.job
     , TO_CHAR(e.hiredate, 'yyyy-mm-dd') AS hiredate
     , e.sal
  FROM dept d, emp e
 WHERE d.deptno = e.deptno;