-- JOIN
SELECT d.deptno, d.dname, d.loc
     , e.empno, e.ename, e.job
     , e.hiredate, e.sal 
  FROM dept d JOIN emp e
    ON d.deptno = e.deptno;

-- INNER JOIN - 조인과 같음(이너조인이 기본, 더 확실하기에 실무에선 권장)
SELECT d.deptno, d.dname, d.loc
     , e.empno, e.ename, e.job
     , e.hiredate, e.sal 
  FROM dept d INNER JOIN emp e
    ON d.deptno = e.deptno
 WHERE d.deptno = 30;

-- OUTER JOIN
SELECT d.deptno, d.dname, d.loc
     , e.empno, e.ename, e.job
     , e.hiredate, e.sal 
  FROM dept d LEFT OUTER JOIN emp e
    ON d.deptno = e.deptno;

SELECT d.deptno, d.dname, d.loc
     , e.empno, e.ename, e.job
     , e.hiredate, e.sal 
  FROM dept d RIGHT OUTER JOIN emp e
    ON d.deptno = e.deptno;

-- 세 테이블 조인 쿼리
SELECT d.deptno
     , d.dname
     , e.empno 
     , e.job 
     , e.sal 
     , s.grade 
  FROM emp e
 INNER JOIN dept d
    ON e.deptno = d.DEPTNO 
  JOIN salgrade s
    ON e.sal BETWEEN s.losal AND s.hisal 
 ORDER BY d.deptno, e.empno;

-- 오라클 쿼리로
SELECT d.deptno
     , d.dname
     , e.empno 
     , e.job 
     , e.sal 
     , s.grade 
  FROM emp e, dept d, salgrade s
 WHERE e.deptno = d.DEPTNO 
   AND e.sal BETWEEN s.losal AND s.hisal 
 ORDER BY d.deptno, e.empno;
