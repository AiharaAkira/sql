create table login_test2(
	
	l_id varchar2(20 char) primary key,
	l_pw varchar2(20 char) not null
);

insert into LOGIN_TEST2 values('akira', '4639');

select * from LOGIN_TEST2;
