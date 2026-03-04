-- 조인 한 번더
SELECT d.deptno, d.dname, d.loc 
     , e.empno, e.ename, e.job
     , TO_CHAR(e.hiredate, 'yyyy-mm-dd') AS hiredate
     , e.sal
  FROM dept d, emp e
 WHERE d.deptno = e.deptno;

-- 셀프 조인
-- e1 상사를 찾는 테이블
-- e2 상사 테이블
SELECT e1.empno, e1.ename, e1.mgr
     , e2.empno AS mgr_empno 
     , e2.ename AS mgr_ename
  FROM emp e1, emp e2
 WHERE e1.mgr = e2.empno;

-- 외부조인 - 등가조인에 일치하지 않는 데이터 조회
-- mgr 상사가 있는지 확인
SELECT e1.empno, e1.ename, e1.mgr
     , e1.hiredate
     , e2.empno AS mgr_empno 
     , e2.ename AS mgr_ename
  FROM emp e1, emp e2
 WHERE e1.mgr = e2.empno (+); -- (+): 외부조인 표시 방법, 데이터가 없어도 되는 쪽- 일치하지 않은 데이터들을 더 많이 나오게 하라.
 
-- 잘못된 조인. e2의 empno를 상사컬럼으로, e1의 mgr를 부하컬럼으로 외부 조인
-- ?? ?? ??? 
 SELECT e1.empno AS mgr_empno, e1.ename AS mgr_ename, e1.mgr
     , e1.hiredate
     , e2.empno AS empno 
     , e2.ename AS ename
  FROM emp e1, emp e2
 WHERE e1.mgr (+)= e2.empno ; -- (+)- [NULL]이 나옴. 부하직원이 없는 사람과 조인하면서 8개의 [NULL]이 나옴
 
-- 외부조인 두번째 예제
-- 일반 내부조인
SELECT d.deptno, d.dname, d.loc 
     , e.empno, e.ename, e.job
     , e.hiredate, e.sal
  FROM dept d, emp e
 WHERE d.deptno = e.deptno;
 
-- 왼쪽 외부조인
 SELECT d.deptno, d.dname, d.loc 
     , e.*
  FROM dept d, emp e
 WHERE d.deptno = e.deptno (+); -- 왼쪽의 테이블을 기준으로 조인했을 때, 오른쪽에 해당 값이 없으면 → 오른쪽 컬럼을 NULL로 채운다
 
-- 오른쪽 외부조인
 SELECT d.deptno, d.dname, d.loc 
     , e.*
  FROM dept d, emp e
 WHERE e.deptno (+) = d.deptno; 
  
-- 오른쪽 외부조인
 SELECT d.deptno, d.dname, d.loc 
     , e.*
  FROM dept d, emp e
 WHERE d.deptno (+) = e.deptno ; -- deptno열의 40이 사라짐
 
 -- 왼쪽 외부조인
 SELECT d.deptno, d.dname, d.loc 
     , e.*
  FROM dept d, emp e
 WHERE d.deptno = e.deptno (+)
   AND e.empno IS NULL;