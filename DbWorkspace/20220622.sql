select length('DataBase'), length('데이터베이스') from dual;
select lengthb('DataBase'), lengthb('데이터베이스') from dual;


select * from emp;

select ename,length(ename) from emp where deptno = 10;

select lower(ename) from emp where length(ename) = 4;

/*
INSTR : 특정문자의 위치 값을 반환

INSTRB : 특정 문자의 위치 값을 반환

*/
--3번째 부터시작해서 2번째 a를 찾음
select instr('DataBase', 'a',3, 2) from dual;

select ename, trim('S' FROM ename), trim( 'H' from ename) from emp where ename = 'SMITH';

select ename, ltrim('aaaaaoracle11', 'a'), trim('S' FROM ename), trim( 'H' from ename) from emp where ename = 'SMITH';

select ename, rtrim('aaaaaoracle11', 'a'), trim('S' FROM ename), trim( 'H' from ename) from emp where ename = 'SMITH';

select ename, trim('       aaaaa oracle11           '), trim('S' FROM ename), trim( 'H' from ename) from emp where ename = 'SMITH';
-- both : 양쪽 공백제거 trim을 기본값은 both


select cos(90) from dual;

select sin(90) from dual;

select tan(90) from dual;

select floor(34.1332) from dual;

select trunc(12.345, -3) from dual;

--특정 자릿수에서 반올림하는 함수(round)

select
round(35.12,1)--소수점 이하 2번째 자리에서 반올림
from dual;

select power(3, 2) from dual;
select mod(34,5) from dual;

select * from emp;

select empno, ename, job from emp where mod(empno,2)=0;

--날짜 함수 sysdate, months_betweens, add_month, next_day, last_day, round, trunc


select sysdate, hiredate, MONTHS_BETWEEN(sysdate, hiredate) from emp where deptno = 10;

select hiredate, add_months(hiredate, 3) from emp;

ALTER SESSION SET NLS_LANGUAGE=AMERICAN;--영어일때
ALTER SESSION SET NLS_LANGUAGE=KOREAN; --한글일때

--LAST DAY : 해당 달의 마지막 날짜를 반환함
SELECT sysdate, LAST_DAY(SYSDATE) from dual;

--trunc : 날짜도 잘라냄

