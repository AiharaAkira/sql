/*

하나의 테이블의 뷰의 개수는 제한이 없다.

DBA로 접속해야함
*/

select * from emp01;

create view view_emp10
as select * from emp01 where deptno = 10;


select * from view_emp10;

/*
-뷰는 테이블 처럼 하나의 개체로서 테이블 생성할 때와 유사하게 create view 명령으로 생성한다.

생성 형식

create [or replace] [force] [noforce] view view_name
[(alias, alias, ...)]
as subquery
[with check option]
[with read only] : 해당 뷰를 통해서는 select만 가능하며 insert/update/delete를 사용할 수 없다.

or replcae view 
-새로운 뷰를 만들 수 있을 뿐만 아니라 기존에 뷰가 존재하더라도 삭제하지 않고
새로운 구조의 뷰로 변경할 수 있다.


force
-기존 테이블의 존재 여부에 상관없이 뷰를 생성함

with check option
-해당 뷰를 통해서 볼 수 있는 범위 내에서만 

뷰의 종류

-뷰에대한 질의를 기본 테이블에 대한 질의로 변경한다
-기본테이블에 대한 질의를 통해 데이터를 검색함
-검색된 결과를 출력

뷰의 종류
-기본 테이블의 수에 따라 단순 뷰, 복합 뷰로 나뉨

단순 뷰
-하나의 테이블로 생성
-그룹함수의 사용이 불가능
-DISTINCT 사용이 불가능
-DML 사용가능

복합 뷰
-여러개의 테이블로 생성
-그룹 함수의 사용이 가능
-DISTINC사용가능
-DML사용가능


*/

insert into view_emp10 values(8000, 'angel', 'tenshi',7000, sysdate,2500,null,10);

--단순 뷰에서는 DML 명령뮨 처리 결과는 뷰를 정의할때 사용한 기본 테이블에도 영향을 미친다.
select * from view_emp10;


-- 단순 뷰의 컬럼에 별칭 부여
--사원번호, 사원명, 급여, 부서번호로 구성된 뷰를 작성하되
--기본테이블은 emp01로 하고 컬럼명은 한글로 작성

create or replace
view view_emp11(사원번호, 사원명, 급여, 부서번호) 
as
select empno, ename, sal, deptno  from emp01;

select * from view_emp11;


/*

오류 이유 : 컬럼을 별칭을 사용해서 뷰를 생성하면 view_name
*/








