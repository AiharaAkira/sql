/*테이블 복사*/

CREATE TABLE emp02 as select * from emp;

/*
테이블명과 컬럼명을 부여하기 위한 규칙
-반드시 문자로 시작해야 한다.
-1~30자까지 가능하다.
*/

/*

alter table로 테이블 구조 변경
-테이블에서 컬럼의 추가, 삭제, 변경(자료형, 길이)할때 사용한다.
-ADD COLUMN 절을 사용하여 새로운 컬럼 추가
-MODIFY COLUMN 절을 사용하여 기존 컬럼을 수정한다.
-DROP COLUMN절을 사용하여 기존 컬럼을 삭제한다.

*/
--alter table 테이블명 add(컬럼명 데이터타입) 

--alter table emp02 add(job varchar2(9));

--select * from emp02;

/*
alter table 테이블명 modify(컬럼명, 데이터자료형)
-해당 컬럼에 자료가 없는 경우
컬럼의 데이터 타입을 변경할 수 있다.
컬럼의 크기를 변경할 수 있다.
-컬럼의 데이터 타입을 변경할 수 없다
크기를 늘릴 수는 있지만 현재 가지고 있는 데이터 크기보다 작은 크기로 변경할 수 없다. 
*/

--emp01 테이블에서 job의 데이터 타입을 크기를 30으로 변경하시오.

select * from emp02;

alter table emp02 MODIFY(job varchar2(30 char)); 

alter table emp02 drop(job);

/*

DROP table 
drop table 명령문은 기존 테이블을 삭제한다.
테이블을 삭제하면 테이블에 저장되어 있는 데이터도 함께 삭제된다.
제거된 데이터는 복구할 수 없다.

*/

--drop table 테이블명

drop table emp03;
--휴지통검색
select * from tab;
--휴지통 구조확인
desc recyclebin;

SELECT * from recyclebin;

desc recyclebin;
--휴지통 비우기
PURGE RECYCLEBIN;

--삭제된 테이블 복원
FLASHBACK table "BIN$WNn4jgEtQRm3cTDFISe2qQ==$0" TO BEFORE DROP ;


select * from emp03;
--테이블 이름 변경 rename문
rename emp02 to emp03;


delete from emp03;
rollback;

--테이블의 모든 행을 제거
truncate table emp03;

desc dept;

create table dept01 as select * from dept;

select * from dept01;

insert into dept01(deptno) VALUES (null);

create table dept02 as select * from dept;

select * from dept02;

create table emp04(
    deptno number(2) not null,
    dname varchar2(14 char),
    loc varchar2(13 char)
    
);

select * from emp02;

select * from emp04;

insert into emp04 values(10, null, null);

select * from tab;

drop table dept01;
drop table dept02;
drop table emp03;
drop table dept04;

/*
기존행을 수정하는 UPDATE SET(U)
형식
UPDATE 테이블명 SET 컬럼명1 = 값1, 컬럼명2 = 값2 where 조건식

어떤 행의 데이터를 수정하는지 where절을 이용하여 조건을 지정
where절을 사용하지 않으면 테이블에 있는 모든 행이 수정됨

*/

--모든 사원의 부서번호를 30번으로 수정
UPDATE emp01 set deptno = 30;
create table emp01 as select * from emp;
rollback;
select * from emp01;

update emp01 set sal = sal*1.1;
rollback;
update emp01 set hiredate = sysdate;

update emp01 set hiredate = sysdate where substr(hiredate,1,2) = '87';

select deptno, job from emp01 where ename='SCOTT';
update emp01 set deptno = 10, job = 'manager' where ename = 'SCOTT';


/*

DELETE
테이블에 특정 행을 삭제할 때

형식 
DELETE FROM 테이블명 WHERE 조건 

commit
모든 작업을 정상적으로 처리하겠다고 확정하는 명령어
트랜잭션 처리 과정을 데이터 베이스에 모두 반영함(변경된 내용을 모두 영구 저장)

rollback
-작업 중 문제가 발생되어서 트랜잭션 처리 과정에서 발생한 변경 사항을 취소하는 명령 
데이터 처리가 시작되기 이전 상태로 되돌림

마지막으로 커밋 명령이후 부터 새로운 커밋 명령을 실행하는 시점까지 수행된 모든 DML 명령들을 의미함

*/

drop table dept01;


create table dept01 as select * from dept;
select * from dept01;

delete from dept01;
rollback;
delete from dept01 where deptno = 20;
commit;
rollback;

/*

save point
현재 트랜잭션을 작게 분할 할 수 있다.
저장된 savepoint는 rollback to savepoint 문을 사용하여 표시한 곳 까지 
rollback 할 수 있음

형식
특정 위치를 지정하는 형식
savepoint 테이블명

*/


delete from dept01 where deptno = 30;
SAVEPOINT c1;

delete from dept01 where deptno = 10;
SAVEPOINT c2;

delete from dept01 where deptno = 40;
SAVEPOINT c3;

select * from dept01;

rollback to c1;
rollback;


select * from user_cons_columns where table_name = 'EMP';

select * from user_cons_columns where table_name = 'DEPT';


