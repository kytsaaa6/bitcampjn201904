-- 2019.07.05

-- 서브쿼리
-- 서브쿼리 <-> 조인 서로 변환하여 사용이 가능하다.

-- SCOTT 사원이 소속된 부서 이름을 출력
select *
from dept
where deptno = (select deptno
				from emp
                where ename = 'SCOTT')
;

-- 사원들중 평균 급여보다 많은 급여를 받는 사원의 이름과 급여를 출력해보자.
select ename,sal
from emp
where sal > (select avg(sal)
			 from emp)
;

-- 급여가 3000 이상인 사원의 소속 부서
-- 해당 부서의 근무하는 사원의 리스트

select ename,sal,deptno
from emp
where deptno IN (select distinct deptno
				from emp
				where sal>=3000)
;

select ename, sal
from emp
where sal > all (select sal
				from emp
				where deptno=30)
;

select ename, sal
from emp
where sal > any (select sal
				from emp
				where deptno=30)
;

-- 인라인 뷰 : from 절 뒤에 서브쿼리가 위치
select *
from (
	select empno, ename, job, hiredate
	from emp
	) as emp
;

select ename, (
				select dname
                from dept
                where dept.deptno=emp.deptno
                )
from emp
;

-- ---------------------------------------------------------------------------
-- DDL
-- ---------------------------------------------------------------------------

-- CREATE TABLE : 테이블 생성 ( 데이터 저장 규칙을 정의 )
-- 컬럼 이름, 저장 데이터의 타입, 저장 데이터 사이즈, 제약조건
-- null 유무
-- 중복 여부
-- 기본값
-- 체크
-- 기본키
-- 외래키
CREATE TABLE project.DEPT
   ( DEPTNO int, 
	DNAME VARCHAR(14), 
	LOC VARCHAR(13), 
	CONSTRAINT PK_DEPT PRIMARY KEY (DEPTNO)
   );
   

-- CREATE TABLE : 테이블 직접 생성
create table project.EMP01 ( -- 테이블 이름은 emp01 로 만든다.
	EMPNO int(4), -- 컬럼이름이 empno 인 저장공간을 만든다. 숫자 타입, 4자리
    ENAME varchar(20), -- 컬럼이름이 ename, 가변문자타입, 20자리
    SAL decimal(7,2) -- 컬럼이름이 sal, 숫자타입, 7자리, 7자리중 뒤 2자리는 소수 표현
    );
    
-- CREATE TABLE : 서브 쿼리를 이용하는 방법, 특징 : 제약조건은 가져오지 못한다.
create table project.emp02
as
select * from emp
;

desc emp;
desc emp02;
-- 원하는 컬럼만 선택적으로 복사하여 생성
create table emp03
as
select empno, ename, job, hiredate from emp
;
-- 원하는 행만 선택적으로 복사하여 생성
create table emp04
as
select * from emp where deptno=20;

select * from emp04;
-- false 조건으로 데이터는 복사하지않고, 테이블의 구조만 복사
create table emp05
as
select * from emp where 1=2
;

select * from emp05;

-- MemberInfo 테이블 생성
-- 아이디 : 6~12 자리 문자열
-- 비밀번호 : 8~16 자리 문자열
-- 이름 : 10 자리 문자열
-- 사진경로(파일이름) : 30자리 문자열
-- 가입날짜 : 날짜타입
create table MemberInfo (
	UID varchar(12),
    UPW varchar(16),
    UNAME varchar(20),
    UPHOTO varchar(30),
    REGDATE Date
    );
    
    
-- 테이블의 구조를 수정하는 명령 : ALTER TABLE
-- 컬럼의 추가, 컬럼의 수정, 컬럼의 삭제

-- alter table 테이블이름 add 컬럼이름
desc emp01;
alter table emp01
add JOB varchar(9)
;

-- alter table 테이블이름 modify (컬럼정의)
alter table emp01 
modify JOB varchar(20)
;

-- alter table 테이블이름 DROP COLUMN 컬럼이름;
alter table emp01
drop COLUMN JOB
;

-- truncate : 테이블의 모든 로우를 제거
select * from emp02;
truncate table emp02;

-- rename : 테이블의 이름을 변경
rename table emp02 to test;
desc test;

-- 제약 조건 적용

create table emp06 (
	empno int(4) not null,
    ename varchar(20),
    sal decimal(7,2)
);

-- INSERT INTO 테이블이름 (컬럼리스트) VALUES (값, 값, 값..)
insert into emp06 (empno, ename) values (null, null);
insert into emp06 (empno, ename) values (2011, null);
desc emp06;
select * from emp06;

drop table emp06;

create table emp06 (
	empno int(4) not null,
    ename varchar(20),
    sal decimal(7,2)
);
insert into emp06 (empno, ename) values (2011, null);
insert into emp06 (empno, ename) values (2011, 'king');

create table emp06 (
	empno int(4) not null unique,
    ename varchar(20),
    sal decimal(7,2)
);
insert into emp06 (empno, ename) values (2011, null);
insert into emp06 (empno, ename) values (2012, 'king');
desc emp06;
select * from emp06;


drop table emp06;
create table emp06 (
	empno int(4) not null unique,
    ename varchar(20) not null,
    sal decimal(7,2) default 1000,
    grade int(1) check (grade > 0 and grade < 5), -- grade int(1) check (grade between 1 and 5)
	gender char(1) check (gender = 'M' or gender = 'W'), -- grade char(1) check (gender in ('M', 'W'))
    deptno int(2),
	foreign key(deptno) references dept(deptno)
);

insert into emp06 (empno, ename) values (2011, null);
insert into emp06 (empno, ename) values (2012, 'king');
insert into emp06 (empno, ename, sal) values (2013, 'king', 4000);
insert into emp06 values (1000, 'king', null, 4, 'M', 40);
insert into emp06 values (1001, 'king', null, 3, 'W', 30);
desc emp06;
select * from emp06;


create table emp07 (
	empno int(4) constraint emp07_empno_nn not null,
    ename varchar(10) constraint emp07_ename_nn not null,
	job varchar(9),
    deptno int(2),
    emp07_empno_pk primary key(empno),
    constraint emp07_job_uk unique(job),
    constraint emp07_deptno_fk foreign key (deptno) references dept(deptno)
);

-- MemberInfo 테이블 생성
-- 대리키 : idx						- 기본키
-- 아이디 : 6~12 자리 문자열				- not null, unique
-- 비밀번호 : 8~16 자리 문자열			- not null
-- 이름 : 10 자리 문자열				- not null
-- 사진경로(파일이름) : 30자리 문자열
-- 가입날짜 : 날짜타입					- default sysdate
create table memberinfo (
	idx int(7),
    mId varchar(12),
    mPw varchar(16),
    mName varchar(20),
    mPhoto varchar(30),
    regDate date default now(),
    constraint memberinfo_idx_pk primary key (idx),
    constraint memberinfo_mId_uk unique (mId)
    
    )
    
    

    