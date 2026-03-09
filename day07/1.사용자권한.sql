-- systam에서 계정으로 실행
-- 사용자 생성
-- 아래와 같이 사용자를 생성하면 insert 등 저장에 문제 발생
CREATE USER orclstudy
IDENTIFIED BY oracle;

-- 아래와 같이 사용자를 생성해야 문제가 발생하지 않음
CREATE USER orclstudy
IDENTIFIED BY oracle
DEFAULT TABLESPACE users
TEMPORARY TABLESPACE temp
QUOTA UNLIMITED ON USERS; -- 무제한 용량

-- 아직끼지 접속 불가
-- 접속 권한 추가
GRANT CREATE SESSION TO orclstudy
QUOTA 100M ON USERS; 

-- 사용자 정보확인
SELECT *
  FROM ALL_USERS;

SELECT *
  FROM dba_objects
 WHERE owner = 'orclstudy';

-- ALTER로 사용자 패스워드 변경
ALTER USER orclstudy
IDENTIFIED BY ORCL;

-- DROP으로 사용자 삭제
DROP USER orclstudy CASCADE; 

-- orclstudy에 테이블 생성 권한 부여
GRANT CREATE TABLE TO orclstudy;
GRANT RESOURCE TO orclstudy;

-- ORA-01950: 테이블스페이스 'USERS'에 대한 권한이 없습니다.
-- 테이블스페이스 저장권한(Quota)이 없어서 발생
ALTER USER orclstudy
quota unlimited ON users;

-- 권한 취소
REVOKE RESORCE, CREATE CREATE TABLE FROM ORCLSTUDY;