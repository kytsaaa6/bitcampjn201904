-- 2019.07.04

-- 그룹함수 : 하나 이상의 행을 그룹으로 묶어 연산하여 하나의 결과

-- SUM(컬럼) : 그룹의 합을 반환

-- 사원 테이블에서 사원의 월 급여(sal)의 총합을 구해보자.
select sum(sal) as "월 총급여" 
from emp
;

-- 10번 부서 소속 직원들의 월 급여 총액을 구해보자
select sum(sal)
from emp
where deptno=10
;

-- sum 함수에서 null 값 처리방식 : null 값은 무시하고 계산
select sum(comm)
from emp
;

-- avg(컬럼) : 그룹에 포함된 값들의 평균값을 반환
-- 그룹함수의 결과는 단일행의 하나의 컬럼
select truncate(avg(sal), 0) as "전체사원의 평균 월급여"
from emp
;
select truncate(avg(sal), 0) as "매니저들의 평균 월급여"
from emp
where job='MANAGER'
;

-- avg 함수도 컬럼의 값이 null 일때 제외하고 처리.
select avg(comm)
from emp
;

-- MAX(컬럼) : 최대값 반환. MIN(컬럼) : 최소값 반환
select max(sal) as "최대 급여", min(sal) as "최소 급여"
from emp
;

-- count(컬럼) : row 의 개수를 반환

-- 회사에 소속된 사원의 수
select count(*) as "전체 사원의 수"
from emp
;

-- 10번 부서의 소속된 직원의 수
select count(*)
from emp
where deptno=10
;

-- 커미션을 받는 직원의 수
select count(comm)
from emp
;

-- 부서의 수를 구하자.
select count(*)
from dept
;

-- 사원들이 소속된 부서의 수
select count(distinct deptno)
from emp
;

select count(distinct job) 업무수
from emp
;

select *
from emp
order by deptno desc
;

-- group by 컬럼이름 : row 를 그룹핑 해서 처리, 집합함수(sum, avg, count..)
-- 컬럼이름 -> 그룹핑의 기준
select deptno, sum(sal), round(avg(sal)), count(*), count(comm), max(sal), min(sal)
from emp
group by deptno 
;

-- 직무별 지표를 출력 해보자.
select job, count(*) as "직원의 수", concat('$', format(sum(sal), 0)) as "급여의 총합", 
			concat('$', round(avg(sal))) as "급여의 평균", 
            concat('$', max(sal)), 
            concat('$', min(sal))
from emp
group by job
;

-- 부서의 평균 급여가 2000 이상인 부서만 출력
select deptno, sum(sal), round(avg(sal)), count(*), count(comm), max(sal), min(sal)
from emp
group by deptno having avg(sal) >= 2000
;

-- 부서의 최대 급여 3000 이상인 부서를 출력
select job, count(*) as "직원의 수", concat('$', format(sum(sal), 0)) as "급여의 총합", 
			concat('$', round(avg(sal))) as "급여의 평균", 
            concat('$', max(sal)), 
            concat('$', min(sal))
from emp
group by job having max(sal) >= 3000
;



-- --------------------------------------------------------------------------------------------
-- JOIN : 2개 이상의 테이블을 옆으로 붙인다. ->  표현하는 컬럼이 늘어난다.
-- --------------------------------------------------------------------------------------------
CREATE TABLE project.SALGRADE 
(  GRADE int, 
 LOSAL int, 
 HISAL int 
); 
    
INSERT INTO project.SALGRADE VALUES (1,700,1200); 
INSERT INTO project.SALGRADE VALUES (2,1201,1400); 
INSERT INTO project.SALGRADE VALUES (3,1401,2000); 
INSERT INTO project.SALGRADE VALUES (4,2001,3000); 
INSERT INTO project.SALGRADE VALUES (5,3001,9999); 

COMMIT; 

-- 테이블을 붙인다. CROSS JOIN
select *
from emp, dept
where emp.deptno = dept.deptno
;

select emp.*,dname,loc
from emp, dept
where emp.deptno = dept.deptno
;

-- 이름이 'SCOTT'인 사원의 이름과 부서이름을 출력하자.
select emp.ename, dept.dname, emp.DEPTNO
from emp, dept, deptno
where emp.deptno = dept.deptno and ename='SCOTT'
;

-- equi join
select dept.deptno, dept.dname, emp.empno, emp.ename, emp.job, emp.sal , emp.comm
from emp, dept
where emp.deptno = dept.deptno;

select dept.deptno, dept.dname, emp.empno, emp.ename, emp.job, emp.sal , emp.comm
from emp inner join dept
where emp.deptno = dept.deptno;

select dept.deptno, dept.dname, emp.empno, emp.ename, emp.job, emp.sal , emp.comm
from emp inner join dept
on emp.deptno = dept.deptno;

-- name scott, return the worker's name and deparment 

select emp.ename, dept.dname, emp.DEPTNO
from emp inner join dept
on emp.deptno = dept.deptno
where emp.ename = 'SCOTT';

-- 주문테이블에서 회원의 이름과 주문 정보를 출력해보자.
select o.orderid, c.name
from orders o, customer c
where o.custid = c.custid and c.name='박지성'
;

select *
from emp e, dept d
where e.deptno = d.deptno
;

-- customer, book, orders
select *
from customer c, book b, orders o
where o.custid=c.custid and o.bookid=b.bookid
;

-- 박지성 고객이 주문한 책의 이름, 출판사를 출력
select b.bookname,b.publisher,c.name
from orders o, customer c, book b
where o.custid=c.custid and o.bookid=b.bookid
		and c.name='박지성' 
;

select *
from salgrade
;

select ename,sal,s.grade
from emp e, salgrade s
where e.sal between s.losal and s.hisal and ename='SCOTT' order by grade,sal
;

select concat(e.ename,' 의 매니저는 ', m.ename, ' 입니다. ') 
from emp e, emp m
where e.mgr=m.empno
order by m.ename, e.ename
;

select e.empno, e.ename, e.mgr, m.ename
from emp e, emp m
where e.mgr=m.empno(+)
;

-- ANSI CROSS JOIN
select *
from emp cross join dept
;

-- ANSI INNER JOIN
select *
from emp INNER JOIN dept
on emp.deptno = dept.deptno
;
select *
from emp JOIN dept
on emp.deptno = dept.deptno
;

select *
from emp JOIN dept
using (deptno)
;

select e.ename, m.ename
from emp e left outer join emp m
on e.mgr = m.empno
;

select *
from customer
;
select distinct(custid)
from orders
;

select *
from orders o, customer c
where o.custid=c.custid
;

select *
from orders o right outer join customer c
on o.custid = c.custid
;