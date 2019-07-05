-- 2017.07.02

-- 테이블의 컬럼들의 도메인속성을 확인(컬럼명, 데이터타입,사이즈 NULL 유무)
-- 데이터 입력 시, 데이터 수정 시 
-- DESC 테이블명;
DESC dept;
   
-- table 생성
-- project 스키마의 DEPT 테이블
CREATE TABLE project.DEPT
   ( DEPTNO int, 
	DNAME VARCHAR(14), 
	LOC VARCHAR(13), 
	CONSTRAINT PK_DEPT PRIMARY KEY (DEPTNO)
   );
   
-- table 생성
-- project 스키마의 EMP 테이블
CREATE TABLE project.EMP 
   ( 	EMPNO int, 
		ENAME VARCHAR(10), 
		JOB VARCHAR(9), 
		MGR int, 
		HIREDATE DATE, 
		SAL int, 
		COMM int, 
		DEPTNO int, 
		CONSTRAINT PK_EMP PRIMARY KEY (EMPNO),
		CONSTRAINT FK_DEPTNO FOREIGN KEY (DEPTNO) REFERENCES project.DEPT (DEPTNO)
   );
   
   
-- 데이터를 검색하는 명령
-- select {컬럼 이름,...} from 테이블 이름
select * from dept;
select deptno from dept; -- 모든 부서의 부서 번호 리스트
select dname from dept;
select dname, loc, deptno from dept;

-- emp 테이블 확인
desc emp;
-- 전체 컬럼 출력
select * from emp;
-- 사원의 번호, 이름의 리스트
select empno,ename from emp;

INSERT INTO DEPT (DEPTNO, DNAME, LOC) VALUES (1,'sales', 'seoul'), (2,'tech', 'la'), (3,'manage', 'rundon'), (4,'ceo', 'seoul');

INSERT INTO project.DEPT VALUES (10, 'ACCOUNTING', 'NEW YORK');
INSERT INTO project.DEPT VALUES (20, 'RESEARCH',   'DALLAS');
INSERT INTO project.DEPT VALUES (30, 'SALES',      'CHICAGO');
INSERT INTO project.DEPT VALUES (40, 'OPERATIONS', 'BOSTON');

DELETE FROM DEPT WHERE DEPTNO=2;

INSERT INTO project.EMP VALUES (7369,'SMITH','CLERK',7902,STR_TO_DATE('17-12-1980','%d-%m-%Y'),800,NULL,20);
INSERT INTO project.EMP VALUES (7499,'ALLEN','SALESMAN',7698,STR_TO_DATE('20-2-1981','%d-%m-%Y'),1600,300,30);
INSERT INTO project.EMP VALUES (7521,'WARD','SALESMAN',7698,STR_TO_DATE('22-2-1981','%d-%m-%Y'),1250,500,30);
INSERT INTO project.EMP VALUES (7566,'JONES','MANAGER',7839,STR_TO_DATE('2-4-1981','%d-%m-%Y'),2975,NULL,20);
INSERT INTO project.EMP VALUES (7654,'MARTIN','SALESMAN',7698,STR_TO_DATE('28-9-1981','%d-%m-%Y'),1250,1400,30);
INSERT INTO project.EMP VALUES (7698,'BLAKE','MANAGER',7839,STR_TO_DATE('1-5-1981','%d-%m-%Y'),2850,NULL,30);
INSERT INTO project.EMP VALUES (7782,'CLARK','MANAGER',7839,STR_TO_DATE('9-6-1981','%d-%m-%Y'),2450,NULL,10);
INSERT INTO project.EMP VALUES (7788,'SCOTT','ANALYST',7566,STR_TO_DATE('13-7-1987','%d-%m-%Y')-85,3000,NULL,20);
INSERT INTO project.EMP VALUES (7839,'KING','PRESIDENT',NULL,STR_TO_DATE('17-11-1981','%d-%m-%Y'),5000,NULL,10);
INSERT INTO project.EMP VALUES (7844,'TURNER','SALESMAN',7698,STR_TO_DATE('8-9-1981','%d-%m-%Y'),1500,0,30);
INSERT INTO project.EMP VALUES (7876,'ADAMS','CLERK',7788,STR_TO_DATE('13-7-1987', '%d-%m-%Y'),1100,NULL,20);
INSERT INTO project.EMP VALUES (7900,'JAMES','CLERK',7698,STR_TO_DATE('3-12-1981','%d-%m-%Y'),950,NULL,30);
INSERT INTO project.EMP VALUES (7902,'FORD','ANALYST',7566,STR_TO_DATE('3-12-1981','%d-%m-%Y'),3000,NULL,20);
INSERT INTO project.EMP VALUES (7934,'MILLER','CLERK',7782,STR_TO_DATE('23-1-1982','%d-%m-%Y'),1300,NULL,10);



-- 컬럼의 사칙연산
select dname + loc from dept;
select sal + comm from emp; -- null 의 연산의 결과 -> null
select sal, sal + 100 from emp;
select sal, sal - 100 from emp;
select sal, sal * 12 from emp;
select sal, sal / 2 from emp;


-- 특정 컬럼의 데이터가 null 인경우 특정 데이터로 치환해주는 함수
-- nvl (컬럼이름, 치환값)
-- oracle nvl()
select ename, sal, comm, sal*12+comm from emp;
-- mysql ifnull()
select ename, sal, comm, sal*12+comm, ifnull(comm, 0) from emp;

-- 컬럼과 문자열을 연결하는 결과 출력, sql에서 문자열 표현은 ' ' 로 묶는다.
-- oracle ||
-- select ename || ' is a ' || job from emp;
-- mysql concat()
select concat(ename,' is a ',job) from emp;

-- distinct : 컬럼값에서 중복되는 값을 제거하고 하나의 데이터만 출력해준다.
select distinct deptno from emp;

-- select 의 조건절 : select 컬럼명.. from 테이블 명 where 조건식(true/false);
-- where 의 조건은 행을 찾는다.
select dname from dept where deptno = 10;
select empno, ename, job from emp where deptno = 10;

-- 문자 데이터 조회 : 데이터 값은 대소문자 구분, 작은 따음표로 표현
select empno,job from  emp where ename ='SCOTT';

-- 날짜 데이터 조회 : 날짜 데이터를 '' 묶어준다.
select ename,hiredate from emp where hiredate>'81/12/03';

-- 논리 연산 : AND, OR, NOT
select * from emp where DEPTNO=30 AND JOB='MANAGER';
select * from emp where DEPTNO=10 OR DEPTNO=20;
SELECT * FROM EMP WHERE NOT DEPTNO=30;

-- 컬렁명 BETWEEN A AND B 연산자 : A 이상 B 이하의 범위 연산
SELECT * from EMP where SAL BETWEEN 2000 and 3000;
SELECT * from EMP where SAL > 2000 and SAL<3000;
SELECT * FROM EMP where HIREDATE BETWEEN '1987/01/01' AND '1987/12/31';

-- IN : OR 조건이 많을때 사용
SELECT * FROM EMP WHERE COMM IN(300, 500, 1400);
SELECT * FROM EMP WHERE COMM=300 OR COMM=500 OR COMM=1400;