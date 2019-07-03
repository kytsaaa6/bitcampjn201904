-- 2019.07.03

-- LIKE: 문자 패턴검색 연산자 키워드
-- 컬러명 LIKE패턴
-- 패턴: 컬럼명 LIKE 패턴

-- %패턴을 이용
-- 사원테이블에서 'S'로 시작하는 사원의 이름 검색
SELECT * from emp where ename like 'S%';

-- 사원테이블에서 'S'로 끝나는 사원의 이름 검색
SELECT * from emp where ename like '%S';

-- 사원 이름에 S가 들어가는 사람 검색
SELECT * from emp WHERE ename like '%S%';

-- 연산자는 문자의 자리(위치) 고정을 의미: 해당 자리에는 어떠한 값이 오든 상관 없음
-- _A 앞자리 문자는 어떤 문자여도 무방, 두번째 문자는 반드시!! A인 패턴

-- 사원이름의 두번째 문자가 A인 사원 찾기
SELECT * FROM EMP WHERE ename like '_A%';

-- 사원이름의 A를 포함하지 않은 사람만을 검색
select * from emp where ename not like '%A%';

-- 컬럼의 데이터 값이 null 값 여부를 확인
-- is null -> 값이 null 일때 true
-- is not null -> 값이 null이 아닐때 true

-- 커미션을 받지 않은 사원
select * from emp where comm is null or comm = 0;

-- 커미션을 받는 사원
select * from emp where comm is not null or comm = 0;

select * from emp where comm is not null and comm > 0;


-- 결과 테이블의 로우(행) 정렬
-- order by 컬럼명 [ASC]/[DESC], 컬럼명 [ASC]/[DESC]

-- 급여가 작은 사원부터 급여가 많은 사원 순으로 정렬
select * from emp order by sal; -- asc 기본값
select * from emp order by sal asc;

-- 급여가 많은 사원부터 급여가 작은 사원 순으로 정렬
select * from emp order by sal desc;
-- 최근 입사한 사원 순으로 사원의 리스트 출력
select * from emp order by hiredate desc;

-- 정렬 방식 조건
-- 사원의 급여기준 급여가 많은 사람 순으로 정렬, 급여가 같은 사원의 경우 이름 순으로 정렬
select ename,sal from emp order by sal desc, ename asc;
select ename,sal,hiredate from emp order by sal desc, hiredate asc;

-- -------------------------------------------------------------------------
-- 함수
-- -------------------------------------------------------------------------
-- DATE -> STR, 날짜 -> 문자열 형변환
-- Oracle -> 형변환 함수 TO_CHAR, 현재 날짜 sysdate
-- select sysdate as 날짜, TO_CHAR(sysdate, 'YYYY-MM-DD') as 변환날짜 from dual;
-- mysql -> 형변환 함수 date_format, 현재 날짜 now()
select now() as 날짜, date_format(now(), '%Y-%m-%d. %T') as 변환날짜 from dual;
select hiredate, date_format(hiredate, '%Y-%m-%d.%a ') as "date" from emp;


-- Oracle NUMBER -> STR : TO_CHAR(숫자타입, '패턴')
-- select TO_CHAR(10000, 'L999,999') from dual; 
-- select sal, TO_CHAR(sal, 'L999,999') as "월 급여", TO_CHAR(sal*12+nvl(comm,0),'L999,999') as "연봉" from emp;

-- mysql INT -> STR : FORMAT(숫자타입, '패턴')
select FORMAT(10000, 'L999,999') from dual;
select sal, format(sal, 'L999,999') as "월 급여", format(sal*12+ifnull(comm,0),'L999,999') as "연봉" from emp;

-- TO_DATE(원본, 'YYYYMMDD')
-- Oracle 
-- select ename, hiredate from emp where hiredate = TO_DATE(1981-02-20, 'YYYYMMDD');
-- mysql STR_TO_DATE
select ename, hiredate from emp where hiredate = STR_TO_DATE(1981-02-20, '%Y-%m-%d');
select now(), STR_TO_DATE('1992/09/25', '%Y/%m/%d'), datediff(now(),STR_TO_DATE('1992/09/25', '%Y/%m/%d')) from dual;

-- 오라클: SELECT sysdate, TO_DATE('1991/4/2', 'YYYY/MM/DD') as "birth", trunc(sysdate-TO_DATE('1991/4/2', 'YYYY/MM/DD')) as "date" from dual;
-- mysql
SELECT now() as now, 
      date_format('1991/4/2' , '%Y-%m-%d') as 'b-date' , 
      datediff(now(), date_format('1991/4/2' , '%Y-%m-%d')) as 'date'
FROM dual;

SELECT now() as now, 
      date_format('1991/4/2' , '%Y-%m-%d') as 'b-date' , 
	  STR_TO_DATE('1991/04/02' , '%Y/%m/%d') as 'date1',
      datediff(now(), STR_TO_DATE('1991/4/2' , '%Y/%m/%d') ) as 'date'
FROM dual;

-- Oracle
-- DECODE 함수 : switch case 형식 과 유사
-- select ename, deptno, 
-- 		DECODE(deptno, 
-- 					10, 'ACCOUNTING',
--                     20, 'REACHER',
--                     30, 'SALES',
-- 					40, 'OPERATION'
--                     ) AS DNAME
-- from emp;

-- select ename, job, sal,
-- 		DECODE(job,
-- 				'ANALYST', sal*1.05,
--                 'SALESMAN', sal*1.1,
--                 'MANAGER', sal*1.15,
--                 'CLERK', sal*1.2
--                 ) as upSal
-- from emp;


-- Oracle, mysql CASE 함수
select ename, deptno, 
		CASE deptno 
				WHEN 10 THEN 'ACCOUNTING'
                WHEN 20 THEN 'REACHER'
                WHEN 30 THEN 'SALES'
				WHEN 40 THEN 'OPERATION'
				ELSE 'no Name'
		END AS DNAME
from emp;

select ename, job, sal,
		CASE job
				WHEN 'ANALYST' THEN sal*1.05
                WHEN 'SALESMAN' THEN sal*1.1
                WHEN 'MANAGER' THEN sal*1.15
                WHEN 'CLERK' THEN sal*1.2
		END as DNAME
from emp;