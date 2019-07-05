-- 2019.07.04 report
select * 
from emp
;

-- 23. 모든 사원의 급여 최고액, 최저액, 총액 및 평균 급여를 출력하시오. 평균에 대해서는 정수로 반올림하시오.
select max(sal), min(sal), sum(sal), round(avg(sal))
from emp
;

-- 24. 각 담당 업무 유형별로 급여 최고액, 최저액, 총액 및 평균 액을 출력하시오. 평균에 대해서는 정수로 반올림 하시오.
select job, max(sal), min(sal), sum(sal), round(avg(sal))
from emp
group by job
;

-- 25. COUNT(*) 함수를 이용하여 담당업무가 동일한 사원 수를 출력하시오.
select job, count(*)
from emp
group by job
;

-- 26. 관리자 수를 나열하시오.
select count(distinct mgr)
from emp
;

-- 27. 급여 최고액, 급여 최저액의 차액을 출력하시오.
select max(sal) - min(sal)
from emp
;

-- 28. 직급별 사원의 최저 급여를 출력하시오. 관리자를 알 수 없는 사원의 최저 급여가 2000 미만인 그룹은 제외시키고 결과를 급여에 대한 내림차순으로 정렬하여 출력하시오.
select job, min(sal) 
from emp
where mgr is not null
group by job having min(sal)>=2000 order by min(sal) desc
;

select job
from emp
where mgr is not null
group by job
;

-- 29. 각 부서에 대해 부서번호, 사원 수, 부서 내의 모든 사원의 평균 급여를 출력하시오. 평균 급여는 소수점 둘째 자리로 반올림 하시오.
select deptno, count(*), round(avg(sal), 2)
from emp
group by deptno
;

-- 30. 각 부서에 대해 부서번호 이름, 지역 명, 사원 수, 부서내의 모든 사원의 평균 급여를 출력하시오. 평균 급여는 정수로 반올림 하시오. DECODE 사용.
select deptno as '부서 번호',
		CASE deptno
			WHEN 10 THEN 'ACCOUNTING'
            WHEN 20 THEN 'RESEARCH'
            WHEN 30 THEN 'SALES'
            WHEN 40 THEN 'OPERATIONS'
        END as '부서 이름',
		CASE deptno
			WHEN 10 THEN 'NEW YORK'
            WHEN 20 THEN 'DALLAS'
            WHEN 30 THEN 'CHICAGO'
            WHEN 40 THEN 'BOSTON'
        END as '지역 명'
        ,count(*) as '사원 수', concat('$', format(round(avg(sal)), 0)) as '평균 급여'
from emp
group by deptno
;

select e.deptno, d.dname, d.loc, count(*), round(avg(sal))
from emp e, dept d
where e.deptno=d.deptno
group by e.deptno, d.dname, d.loc
;

-- 31. 업무를 표시한 다음 해당 업무에 대해 부서 번호별 급여 및 부서 10, 20, 30의 급여 총액을 각각 출력하시오. 
-- 별칭은 각 job, dno, 부서 10, 부서 20, 부서 30, 총액으로 지정하시오. ( hint. Decode, group by )
select job, deptno as 'dno',
		concat('$', format(ifnull(CASE deptno WHEN 10 THEN sum(sal) end, 0), 0)) as '부서 10',
        concat('$', format(ifnull(CASE deptno WHEN 20 THEN sum(sal) end, 0), 0)) as '부서 20',
        concat('$', format(ifnull(CASE deptno WHEN 30 THEN sum(sal) end, 0), 0)) as '부서 30',
        concat('$', format(sum(sal),0)) as '총액'
from emp
group by deptno,job order by deptno asc;
;

select job, deptno
from emp
group by job, deptno
order by deptno