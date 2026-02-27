# java-database-2026
자바 개발자 과정 데이터베이스 리포지토리

## Day 01

### 데이터/정보

데이터는 단순한 컴퓨터 한계의 특정 값을 의미, 정보는 데이터에 의미를 부여한 것.

### 데이터베이스(DataBase : DB)

데이터를 기반으로 하는 관리 시스템을 의미. 데이터를 모아둔 장소를 의미하기도 함.

- DataBase Management System을 줄여서 DBMS라고 부름.
- DBMS를 줄여서 DB라고 함
- 대부분 `도메인 정보`를 저장하고 있음.
- IT에서 가장 중요하게 생각해야할 기술 중 하나

![alt text](day01/image.png)

### 데이터베이스 종류
- 관계형 데이터베이스(RDBMS)
    - `Oracle` - 학습할 DB
    - SQLSever - Microsoft사 제품, Oracle보다 성능 낮음.
    - MySQL - 오픈소스진명에서 Oracle로 합병
    - MariaDB - MySQL 개발자들이 다시 만든 오픈소스 DB
    - PostgreSQL - 오픈소스 데이터베이스

- NoSQL 데이터베이스(빅데이터...)
    - Redis
    - MomgoDB
    - Apache Cassandra

- In-Memory 데이터베이스
    - SAP HANA - (겁나 빠름)

### 오라클 설치 방법
1. 로컬 설치
![alt text](day01/image-2.png)
2. 도커 설치(클라우드 동일)
![alt text](day01/image-1.png)

### 오라클 설치 이전

1. 도커 설치 - DavOps의 필수품
    - https://www.docker.com/
    - Download Docker Desktop 버튼 클릭
    - Download of Window-AMD64 선택

    ![alt text](day01/image-3.png)
    ![alt text](day01/image-4.png) - Accept 누름

2. 설치 후 실행 
    - Settings(오른쪽 상단 기어모양) 클릭
    - Start Docker Desktop when... 체크 후 Apply
    ![alt text](day01/image-5.png)

3. VS CODE 확장
    - Database Client, Database Client JDBC 확장 설치.

        ![alt text](day01/image-12.png)

        ![alt text](day01/image-11.png)
            → 입력까지 하고 연결 성공...

### 오라클 설치

1. Docker Desktop에서 검색 후 Pull로 이미지 다운로드 가능 - 하지말 것.

2. Docker command 사용
    - Powershell 오픈 후, 도커 실행 확인
        ```bash
        docker --version
        >>> Docker version 29.2.1, build a5c7197
        ```

    - 이미지 검색
        ```bash
        docker search oracle-xe

        >>> 
        NAME                      DESCRIPTION                                      STARS     OFFICIAL
        gvenzl/oracle-xe          Oracle Database XE (21c, 18c, 11g) for every…   355
        owncloudci/oracle-xe                                                       0
        abstractdog/oracle-xe                                                      0
        ```
        
            → 도커에 검색으로 oracle을 찾은 것과 같음

    - 이미지 당겨오기 
        ```bash
        docker pull gvenzl/oracle-xe:21-slim
        ```

        ![alt text](day01/image-6.png)

    - 컨테이너 실행
        
        ```bash
        docker run -d --name oracle-xe -p 1521:1521 -e ORACLE_PASSWORD=P12345s! gvenzl/oracle-xe:21-slim
        ```

        ![alt text](day01/image-7.png)

    - 컨테이너 내부 접속
        ```bash
        docker exec -it oracle-xe sqlplus system/P12345s! @XE

        >>> SQL*Plus: Release 21.0.0.0.0 - Production on Thu Feb 26 04:45:12 2026
        Version 21.3.0.0.0

        Copyright (c) 1982, 2021, Oracle.  All rights reserved.

        Last Successful login time: Thu Feb 26 2026 03:19:29 +00:00

        Connected to:
        Oracle Database 21c Express Edition Release 21.0.0.0.0 - Production
        Version 21.3.0.0.0

        SQL>
        ```

    - 강의용 사용자 생성
        ```sql
        CREATE USER java IDENTIFIED BY java12345;

        GRANT CONNECT, RESOURCE TO java;

        GRANT CREATE TABLE TO java;

        GRANT all privileges TO java; -- INSERT등 추가 권한 할당
        ```

### 데이터베이스 개발용 DBeaver 설치

1. 개발툴 종류
    -  SQL*Plus - 콘솔개발 화면, 가장 기초적인 SQL실행도구, 매우 사용불편.
    - Oracle SQL Devloper - 오라클사가 제공하는 무료튤, 오픈소스, java개발툴 eclipse를 커스터마이징해서 개발.
    개발
    - Toad for Oracle - DB개발툴 가장 강력한 sw. 상용라이선스.
    - DBeaver - 오픈소스, 거의 모든 DB를 다 사용. 대중성이 매우 높음.

2. DBeaver 설치
    - https://dbeaver.io/
    - Community Edition 클릭 window(Installer)선택

### DBeaver 사용법 
- Database Navigator 에서 DB연결 시작

    ![alt text](day01/image-8.png)

    - 마우스 오른쪽 버튼 > Create > Connection

        ![alt text](day01/image-9.png)

    - 연결정보 입력 Test Connection
    - 입력 시 주의사항: port번호 확인, Database 이름 변경 Oracle → XE로, Username, Password 일치

        ![alt text](day01/image-10.png)

### 기본 사용법 

- DBeaver
    - 연결된 XE - java > schema(Database와 같은 의미) 확장 > JAVA 선택
    - 마우스 오른쪽 버튼 > SQL 편집기
    - 글자 크기 변경 > 메뉴 윈도우 > 환경 설정
        - User Interface > 모양 > 색상 및 글꼴 > DBeaverFonts > Monospace font를 편집

        ![alt text](day01/image-13.png)
- 샘플 데이터베이스 생성

1. 테이블 생성: [쿼리](./day01/1.sample_schemas.sql)
2. 시퀀스 생성: [쿼리](./day01/2.sequence_schemas.sql)
3. 부서데이터 추가: [쿼리](./day01/3.department_datas.sql)
4. 직원데이터 추가: [쿼리](./day01/4.emplovee_datas.sql)
5. 고객데이터 추가: [쿼리](./day01/5.customer_batas.sql)
6. 상품데이터 추가: [쿼리](./day01/6.product_datas.sql)
7. 상품데이터 추가: [쿼리](./day01/7.order_order_item_batas.sql)

- 간단 연습 : [쿼리](./day01/8.샘플쿼리.sql)
    - DB 파일은 확장자를 `.sql`
    - 하나의 명령으로 ;으로 끝나는 문장을 쿼리(query)로 지칭
    - 쿼리문은 대소문자 구분 없음
    - DBeaver에서 쿼리 한 줄 실행 : `Ctrl + Enter`
    - 여러줄 동시 실행 : `Alt + x`

- SQl(Structured Query Language)
    - 구조화된 질의 언어
    - 관계형 데이터베이스에서 DBMS상에 데이터를 정의, 조작, 제어하기 위해 사용하는 표준 프로그래밍 언어

---
## Day 02

### DBeaver 사용법, DB작업 시 사전 지식
- 메뉴 상 용어들 
    - 검색 > `DB Full-Text` - Full Text Search(대용량 텍스트 내에서 필요한 작업 단어를 검색할 때)
    - SQL 편집기 > `실행 계획` - 현재의 쿼리가 실행되는데 비용이 얼마나 발생하는지 파악하는 기술. 최적화 실행 속도 빠르게 하기 전에 분석
    - 데이터베이스 > `트랜잭션` 모드 - 쿼리들이 실행되는 논리적 덩어리, Auto-Commit(조금 위험), None Commit

![alt text](day02/image-14.png)

- 위 스키마 하위에서 지금 알아야 할 내용들
    - 테이블
    - 뷰
    - 인덱스
    - 스퀀스
    - 프로시저
    - 평선
    - SQL 문법까지 

### 기본, SELECT문

- 문법 이전 데이터 타입 일부 
    - `NUMBER` - 숫자타입, 최대 22byte
    - INTEGER - 정수타입, 모든 데이터 기초 4byte(-21억 ~ +21억)
    - FLOAT - 실수타입, 소수점 포함, 최대 22byte
    - `CHAR`(n) - Character 문자열 타입, 고정형, 최대 2000byte
        - CHAR(20)기준, 'Hello World'를 저장하면, 'Hello World&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'로 저장됨. 무조건 자리 수를 20자리로 고정해서 생성(공백을 채움)
    - `VARCHAR2`(n) - 가변형 문자열, 최대 4000byte
        - 오라클에서 VARCHAR(n)는 사용 안 함
        - VARCHAR2(20)으로 'Hello World'를 저장하면, 'Hello World'. 뒤에 9자리는 버림.
    - `LONG`(n) - 가변 길이 문자열, 최대 2Gbyte
    - LONG RAW(n) - 바이너리(이진) 데이터, 0과 1의 숫자로만 저장. 최대 2Gbyte
    - CLOB - 대용량 텍스트 타입, 최대 4Gbyte
    - BLOB - 대용량 바이너리(이진) 타입, 최대 4Gbyte
    - `DATE` - 날짜 타입, 문자열과 다름

- 데이터 조회 3가지 방법
    - `셀렉션`(Selection) - 행 단위로 조회
    - `프로젝션`(Projection) - 열 단위로 조회
    - `조인`(join) - 두 개 이상 테이블을 조합해서 조회

- SELECT 문법

    ```Sql
    -- 한줄 주석
    /* 여러줄
        주석(C언어 주석) */

    -- 기본문법
    SELECT [*:열 이름 나열] 
      FROM [dual:테이블명]

    -- 별명 추가
    SELECT 컬럼명 [AS 별명],
           계산식 AS "별명",
           ...
      FROM 테이블 별명 [테이블 별명]

    -- 데이터 정렬
    SELECT 위와 동일
      FROM 테이블명
     ORDER BY [정렬할 열 이름(여러 개)][ASC:DESC];

    /* 
    ASC - ascending(오름차순)
    DESC - descending(내림차순)
    ASC는 기본이고 생략 가능
    */

    -- 조건절 WHERE절
    -- 원하는 조건으로 다양하게 조화할 때
    SELECT 위와 동일
      FROM 테이블명
    [WHERE 조회할 행을 선별하는 조건식]
    [ORDER BY [정렬할 열 이름(여러 개)][ASC:DESC]];
    ```
- SELECT 연산
    ```sql
    -- 산술연산자 + - * /
    -- 비교연산자 >(크다), <(작다) >=(크거나 같다) <=(작거나 같다) 