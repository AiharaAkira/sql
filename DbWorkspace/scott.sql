

/*
-equi join : 동일한 컬럼을 기준으로 조인
-NonEqui join : 동일한 컬럼이 없이 다른 조건을 사용하여 조인
-Outer join : 조인 조건에 만족하지 않는 행도 나타냄
-Self join : 한 테이블 내에서 조인

*/

select ename, dname from emp e, dept d where e.deptno = d.deptno;