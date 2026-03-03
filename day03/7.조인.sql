/* JOIN!!!!! */
-- 관계형(Relational)DB, ROB에서 테이블을 합쳐서 표현하는 방법
SELECT *
  FROM emp;

SELECT *
  FROM dept;

-- 합치기(그냥 합치기 - 카테시안곱) // 실무에서 안 씀!
SELECT *
  FROM emp, dept;

-- 조인
-- 등가조인 inner-join, equi-join, simple join
SELECT *
  FROM emp, dept
 WHERE emp.deptno = dept.deptno;

-- 이름 사용
SELECT emp.EMPNO, emp.ENAME, emp.JOB
     , emp.MGR, emp.HIREDATE, emp.SAL
     , dept.DEPTNO, dept.DNAME        
  FROM emp, dept
 WHERE emp.deptno = dept.deptno;

-- 별명 사용
SELECT e.EMPNO, e.ENAME, e.JOB
     , e.MGR, e.HIREDATE, e.SAL
     , d.DEPTNO, d.DNAME        
  FROM emp e, dept d
 WHERE e.deptno = d.deptno;

-- 비등가조인
SELECT *
  FROM emp;

SELECT *
  FROM SALGRADE;

SELECT *
  FROM EMP e, SALGRADE s
 WHERE e.sal BETWEEN s.losal AND s.hisal ;