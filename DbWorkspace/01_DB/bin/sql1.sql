--주석
--테이블 생성
CREATE TABLE product(
p_name varchar2(10 char),
p_price number(4)
);

--값넣기
insert into product values('pen', 1000);
--조회
select * from product;
--행, row, 행 하나가 데이터 1개. record라고 함.
--열, field, 속성, colum
-- 오라클 대소문자 구분 x 다 대문자
-- DBA : 서버 전원관리, 백업/복구, 계정관리 
-- DBP : CRUD (create read update delete)
-- sql (Structured Query Language) : DB를 제어하는 언어
--문장끝 ;


--1) 테이블 만들기 (이름, 나이, 국, 영, 수)
CREATE TABLE student(
	s_name varchar2(30 char),
	s_age number(4),
	s_koreanPoint number(3), 
	s_englishPoint number(3), 
	s_mathPoint number(3)
);
--2)데이터 삽입
insert into student values('akira', 17, 99, 99, 99);

insert into student(s_name, s_age)values ('준석', 20);

insert into student(s_mathPoint, s_englishPoint, s_koreanPoint, s_name, s_age)
values (99, 100, 80, '준석', 20);
--안쓴건 > null
-- 필드 순서를 왜 바꾸는지, Null을 둬서 어쩔건지

--3)조회
select * from student;
--4)테이블 삭제
drop table student cascade constraint purge;

--1) 테이블 만들기 (이름, 나이, 국, 영, 수)
CREATE TABLE student2(
	s_no number(3) primary key NOT NULL,
	s_name varchar2(30 char) NOT NULL,
	s_age number(4) NOT NULL,
	s_koreanPoint number(3) NOT NULL, 
	s_englishPoint number(3) NOT NULL, 
	s_mathPoint number(3) NOT NULL
);

insert into student2 values(1, '재식', 17, 100, 90, 80);
insert into student2 values(2, '두현', 17, 90, 90, 90);
insert into student2 values(3, '민우', 17, 90, 90, 90);
insert into student2 values(20, '병관', 17, 90, 90, 90);
insert into student2 values(15, '병관', 17, 90, 90, 90);

select * from student2;

--테이블 삭제(테이블에 걸린 각종 규제들 같이 삭제)
drop table student2  
cascade constraint purge;

--옵션
--not null : 사실상 기본, 필수
-- primary key : not null + 중복 불허
-- 그 테이블을 대표하는 값 > 테이블 하나에는 pk 하나 있는게 좋음
-- id > 곧 나 

-- 데이터 수정 (cr Update d)
-- 10번 사람의 영어점수를 50점으로
update student2 
SET s_englishpoint =100
WHERE s_no = 15
;

-- 데이터 삭제(cruDelete)
-- 두현씨 삭제
DELETE student2
WHERE s_name LIKE '병관'
;
select * from student2;

--student2 테이블의 학생 이름
SELECT s_name from student2;

-- 저 테이블의 학생 이름과 나이, 영어 점수
select s_name, s_age, s_englishpoint from student2;