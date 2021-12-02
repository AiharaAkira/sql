create table login_test3(
	
	l_id varchar2(20 char) primary key,
	l_pw varchar2(20 char) not null,
	l_name varchar2(20 char) not null
);

insert into LOGIN_TEST3 values('akira', '4639', 'akira');

select * from LOGIN_TEST3;