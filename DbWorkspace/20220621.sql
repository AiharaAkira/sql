/*
문자 데이터 조회
- 문자 데이터는 반드시 싱글 쿼터 안에 표시하고, 대소문자를 구분한다.
*/


select ename from emp;

/*

사원 이름이 MILLER인 사원의 번호와 이름, 직급을 출력


*/


select * from emp;

select empno, ename, job from emp where ename like 'MILLER';

/*
날짜 데이터는 반드시 싱글쿼터 안에 표시하고, 년/월/일 형식으로 기술한다.
*/


select ename, hiredate from emp where hiredate >= '85/01/01';

/*
논리 연산자
AND - 두가지 조건이 모두 만족을 해야함
OR - 두가지 조건중 하나 이상을 만족을 해야함
NOT - 조건에 만족하지 못하는 것만 검색함
BETWEEN ~~~AND - 특정 범위내에 속하는 데이터를 검색하고자 할 때 사용함
IN - 동일한 컬럼이 여러개 값중 하나인지 알아보고자 할 때 사용함
*/

--부서 번호가 10번이고, 직급이 MANAGER인 사원 정보 출력

select * from emp where job = 'MANAGER' and deptno = '10'; 
select * from emp where sal >= 1000 and sal <= 3000;
select * from emp where sal  between  1000 and  3000;

--부서 번호가 10 번이거나 직급이 MANAGER인 사원의 정보를 출력


select * from emp where deptno = 10 or job = 'MANAGER';

-- 사원 번호가 7844 이거나 7521인  사원 정보 출력

select * from emp where empno = 7521 or empno = 7521;


select * from emp where empno in(7844, 7654, 7521);

select * from emp where ename like '%MIL%';

--LIKE연산자
/*
-검색하고자 하는 값을 정확히 모를 경우 와일드 카드와 함께 사용하여
%:문자가 없거나, 하나 시앙의 문자가 어떤 값이 오든 상관 없음
_: 하나의 문자가 어떤 값이 오든 상관 없음
*/

--사원을 이름이 k로 시작하는 사원을 검색하여 정보를 출력하시오.
select * from emp where ename like 'K%'




