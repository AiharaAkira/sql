/*

제약 조건

emmp06 사원 테이블에 성별 컬럼을 추가하되
gender컬럼에는 'm' or 'f'의 두값만 저장할 수 있는 check 제약 조건 설정

*/

create table emp06 (

empno number(4) primary key,
ename varchar2(10) not null,
gender varchar2(1) check(gender in ('M', 'F'))

);

insert into emp06 values(7566, 'JONES', 'M');


select * from emp06;


/*

제약 조건명 지정하기
-사용자가 의미있게 제약 조건명을 명시하여 제약 조건명만으로 어떤 제약조건을 위배했는지 알 수 있게 하는 방법
지정방법: column_name data_type CONSTRAINT constraint_name constraint_type

제약 조건 명 명명 규칙
테이블명_ 컬럼명_ 제약조건 유형

기본키 제약 조건 명을 EMP06_EMPNO_PK
EMP06_EMPNO_PK

*/

create table emp05 (

empno number(4) constraint emp05_empno_pk primary key,
ename varchar2(10) constraint emp05_ename_NN NOT NULL ,
job varchar2(9) constraint emp05_job_UK UNIQUE,
dept_no number(4) constraint emp05_dept_no_FK REFERENCES dept(deptno)
);

SELECT * FROM emp05;

select constraint_name, constraint_type, table_name, search_condition, r_constraint_name from user_constraints ;

insert into emp05 values(7499, 'ALLEN', 'SALESMAN', 30);

/*

테이블 레벨 방식으로 제약조건 지정하기

복합키로 기본키를 지정할 경우

-복합키로 기본키를 지정할 경우
-복합키 형태로 제약조건을 지정할 경우에는 컬럼 레벨 형식으로는 불가능하고 반드시 테이블 레벨 방식을 사용하여야 한다

ALTER TABLE로 제약 조건을 추가할 경우
-테이블의 정의가 완료되어서 이미 테이블의 구조가 결정된 후에 나중에 테이블에 제약조건을 추가하고자 할때에는 테이블 레벨 방식으로 제약조건을 지정함

형식
create table 테이블명 (
컬럼명1 데이터 타입1,
컬럼명2 데이터 타입2,
...

constraint constraint_name constraint_type(column명)


);

*/

create table emp04(

empno number(4),
ename varchar2(10) not null,
job varchar2(9),
deotno number(4)

);
