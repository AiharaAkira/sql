select * from emp;

select * from dept;

select ename, sal, hiredate from emp;

--산술연산자: +, -, *, /
select ename, sal*12 from emp;

select max(sal) from emp;

/*

Null의 의미

1.0도아니고 
2.빈공간도 아니고
3.미확정 값을 의미함
4.어떤 값인지 알 수 없지만 어떤 값이 존재하고 있다.
5.? 혹은 무한대의 의미도 있음
6.연산, 할당, 비교가 불가능하다

*/

select 100+? from dual;

desc dual;

select * from dept;

select 24 * 60 * 60 from dept

/*
dual테이블
-한 행으로 결과를 출력하기 위한 테이블
DUMMY 컴럼에는 한갱의 문자만을 지정할 수 있는 x라는 값을 가진
단 하나의 행만을 저장함
*/
