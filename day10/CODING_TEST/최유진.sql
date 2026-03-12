-- 1. 현재 반납되지 않은 책의 정보를 조회하시오.
SELECT r.IDX AS 대여번호
     , m.NAMES AS 회원명
	 , b.NAMES AS 책제목
     , r.rentaldate AS 대여일
  FROM RENTALTBL r
  JOIN MEMBERTBL m
    ON r.MEMBERIDX = m.IDX 
  JOIN BOOKSTBL b 
    ON r.BOOKIDX = b.IDX
 WHERE r.returndate IS NULL
 ORDER BY r.IDX;
    
-- 2. 각 분류별 도서 수를 조회하시오. 책이 한 권도 없는 분류도 포함하시오.
SELECT d.division AS 분류코드
	 , d.names AS 분류명
     , COUNT(b.idx) AS 도서수
  FROM divtbl d
  LEFT JOIN bookstbl b 
    ON d.division = b.division
 GROUP BY d.division, d.names
 ORDER BY d.division;

-- 3. 대여 이력을 기준으로 가장 많이 대여된 책 순서대로 조회하시오.
SELECT r.bookidx AS 책번호
     , b.names AS 책제목
     , count(r.idx) AS 대여횟수
  FROM RENTALTBL r
  JOIN bookstbl b
    ON r.bookidx = b.idx
 GROUP BY r.bookidx, b.names;

-- 4. 회원 중 총 대여 횟수가 1회 초과인 회원을 조회하시오.
SELECT m.idx AS 회원번호
     , m.names AS 회원명
     , m.levels AS 등급
     , count(r.idx) AS 대여횟수
  FROM membertbl m
  JOIN rentaltbl r
    ON m.idx = r.memberidx
 GROUP BY m.idx, m.names, m.levels
 HAVING count(r.idx) > 1
 ORDER BY m.idx;

-- 5.  대여일보다 반납일이 더 빠른 이상 데이터를 조회하시오. 
SELECT r.idx AS 대여번호
     , m.names AS 회원명
     , b.NAMES AS 책제목
     , r.rentaldate AS 대여일
     , r.returndate AS 반납일
  FROM RENTALTBL r
  JOIN membertbl m
    ON r.memberidx = m.idx
  JOIN bookstbl b
    ON r.bookidx = b.idx
 WHERE r.rentaldate > r.returndate;