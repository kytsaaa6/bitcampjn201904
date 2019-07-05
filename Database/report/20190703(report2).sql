-- 16. SUBSTR 함수를 사용하여 사원들의 입사한 년도와 입사한 달만 출력하시오.
select substr(hiredate, 1,7) as "입사년-월" from emp;

-- 17. SUBSTR 함수를 사용하여 4월에 입사한 사원을 출력하시오.
select ename from emp where substr(hiredate, 6,2)='04';

-- 18. MOD 함수를 사용하여 사원번호가 짝수인 사람만 출력하시오.
select empno,ename from emp where mod(empno,2)=0;

-- 19. 입사일을 년도는 2자리(YY), 월은 숫자(MON)로 표시하고 요일은 약어 (DY)로 지정하여 출력하시오.
select date_format(hiredate,'%y/%m. %a') from emp;

-- 20. 올해 몇 칠이 지났는지 출력하시오. 현재날짜에서 올해 1월 1일을 뺀 결과를 출력하고 TO_DATE 함수를 사용하여 데이터 형을 일치 시키시오.
select now() as now, 
		datediff(now(), STR_TO_DATE('2019/01/01','%Y/%m/%d'));
        
-- 21. 사원들의 상관 사번을 출력하되 상관이 없는 사원에 대해서는 NULL 값 대신 0으로 출력하시오.
select ename,ifnull(mgr,0) from emp;

-- 22. DECODE 함수로 직급에 따라 급여를 인상하도록 하시오. 직급이 ‘ANALIST”인 사원은 200, ‘SALESMAN’인 사원은 180, 
-- 		‘MANAGER’인 사원은 150, ‘CLERK”인 사원은 100을 인상하시오.
select ename,job,sal,
		CASE job
			WHEN 'ANALYST' THEN sal+200
            WHEN 'SALESMAN' THEN sal+180
            WHEN 'MANAGER' THEN sal+150
            WHEN 'CLERK' THEN sal+100
		END as after_sal
from emp;