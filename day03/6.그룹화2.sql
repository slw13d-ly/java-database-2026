-- scott 계정! 
-- 부서번호와 직군별 그룹화
SELECT deptno, job
     , count(*)
     , MAX(sal)
     , AVG(sal)
  FROM emp
 GROUP BY DEPTNO, JOB;
 ORDER BY DEPTNO;

-- ROLLUP 중요함!! 
-- ROLLUP 함수를 적용한 그룹화
SELECT deptno -- 부서 번호에 따라 통계?
     , count(*)
     , MAX(sal)
     , AVG(sal)
  FROM emp
 GROUP BY ROLLUP(DEPTNO);
 ORDER BY DEPTNO;

-- ROLLUP 첫번째 칼럼의 값으로 소계, 전체 총계를 도출
SELECT deptno, JOB 
     , count(*)
     , MAX(sal)
     , AVG(sal)
  FROM emp
 GROUP BY ROLLUP(DEPTNO, job) --  GROUP BY ROLLUP(DEPTNO), job 이거랑 먼 차이...?
 ORDER BY deptno;

-- 각각의 칼럼별로 소계, 전체 총계를 도출
SELECT deptno, JOB 
     , count(*)
     , MAX(sal)
     , AVG(sal)
  FROM emp
 GROUP BY CUBE(DEPTNO, job)
 ORDER BY deptno;

SELECT deptno, JOB 
     , count(*)
     , MAX(sal)
     , AVG(sal)
  FROM emp
 GROUP BY job, ROLLUP(DEPTNO)
 ORDER BY job;

-- GROUPING SETS - 차후 진행
-- GROUPING 함수: SELECT절에 GROUPING 적용
SELECT deptno, JOB 
     , count(*) AS "직원 수"
     , MAX(sal) AS "최고급여"
     , AVG(sal) AS "최소급여"
     , GROUPING(job) AS "JOB_GRID"
     , GROUPING(deptno) AS "DEP_GRID"
     , GROUPING_ID(deptno, job) AS "DEP_JOB_GRID"
  FROM emp
 GROUP BY CUBE(DEPTNO, job)
 ORDER BY deptno;

-- PIVOT
-- 부서별, 직책별로 그룹화 최고 급여 조회
-- PIVOT 없이 일반적
SELECT deptno, job, MAX(sal)
  FROM emp
 GROUP BY DEPTNO, job
 ORDER BY DEPTNO, job;

-- PIVOT 사용
SELECT *
  FROM (SELECT deptno, job, sal
          FROM emp) -- subquery
 pivot (Max(sal) FOR deptno IN (10, 20, 30))
 ORDER BY job;

-- PIVOT 사용하지 않고 CASE - WHEN으로 구현 가능