-- 1. 현재 반납되지 않은 책의 정보를 조회하시오.
SELECT r.IDX AS 대여번호, 
	   m.NAMES AS 회원명,
	   b.NAMES AS 책제목,
       r.rentaldate AS 대여일
  FROM RENTALTBL r
  JOIN MEMBERTBL m
    ON r.MEMBERIDX = m.IDX 
  JOIN BOOKSTBL b 
    ON r.BOOKIDX = b.IDX
 WHERE r.returndate IS NULL;
    
-- 2. 각 분류별 도서 수를 조회하시오. 책이 한 권도 없는 분류도 포함하시오.
SELECT *
  FROM divtbl d;
-- 3. 대여 이력을 기준으로 가장 많이 대여된 책 순서대로 조회하시오.

-- 4. 회원 중 총 대여 횟수가 1회 초과인 회원을 조회하시오.

-- 5.  대여일보다 반납일이 더 빠른 이상 데이터를 조회하시오. 