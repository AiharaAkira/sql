CREATE TABLE movie_test(
m_no number(3) primary key,
m_title varchar2(30 char) not null,
m_actor varchar2(30 char) not null,
m_img varchar2(300 char) not null,
m_story varchar2(300 char) not null
);

CREATE sequence movie_test_seq;

insert into MOVIE_test values (MOVIE_TEST_seq.nextval, '����', '���', '����', '�ٰŸ�');
insert into MOVIE_test values (MOVIE_TEST_seq.nextval, '����1', '���1', '����1', '�ٰŸ�1');

select * from MOVIE_TEST;