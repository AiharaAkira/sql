CREATE TABLE movie_test(
m_no number(3) primary key,
m_title varchar2(30 char) not null,
m_actor varchar2(30 char) not null,
m_img varchar2(300 char) not null,
m_story varchar2(300 char) not null
);

CREATE sequence movie_test_seq;

insert into MOVIE_test values (MOVIE_TEST_seq.nextval, '제목', '배우', '사진', '줄거리');
insert into MOVIE_test values (MOVIE_TEST_seq.nextval, '제목1', '배우1', '사진1', '줄거리1');

select * from MOVIE_TEST;

CREATE TABLE review_test(
r_no number(3) primary key,
r_title varchar2(30 char) not null,
r_txt varchar2(200 char) not null,
r_date date not null
);

CREATE sequence review_test_seq;

insert into REVIEW_test values (review_TEST_seq.nextval, '제목', '내용', sysdate);
insert into review_test values (review_TEST_seq.nextval, '제목1', '내용1', sysdate);

select * from review_TEST;
