-- 1번답
SELECT e.emp_name, d.dept_name
  FROM emp e, dept d
WHERE e.dept_ID = d.DEPT_ID ;

-- 2번답
SELECT e.emp_name, e.SALARY 
  FROM emp e
WHERE e.dept_ID = 10 ;
 
-- 3번답
SELECT d.DEPT_ID
     , COUNT(e.EMP_ID) AS "EMP_COUNT" 
  FROM emp e, dept d
 WHERE e.dept_ID = d.DEPT_ID
 GROUP BY d.DEPT_ID, d.DEPT_NAME; -- 부서 ID와 이름을 알아야 부서별 사원 수 조회 가능.


-- 4번답
SELECT EMP_NAME, SALARY 
  FROM emp
 WHERE SALARY > (SELECT avg(e.SALARY)
                   FROM emp e);

-- 5번답
SELECT e.EMP_NAME, p.PROJ_NAME  
  FROM emp e
 INNER JOIN EMP_PROJECT ep 
 		 ON e.EMP_ID = ep.EMP_ID 
       JOIN PROJECT p 
         ON ep.PROJ_ID = p.PROJ_ID; 