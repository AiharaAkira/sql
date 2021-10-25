create table snack(
	s_no number(3) primary key,
	s_name varchar2 (20 char) not null,
	s_maker varchar2 (20 char) not null,
	s_weight number(4, 1) not null,
	s_price number(4) not null,
	s_exp date not null
);
--sysdate : 현재 시간 날짜(java : Date)
insert into SNACK values(1, '양파링', '농심', 60, 1000, sysdate);
insert into SNACK values(50, '양파링', '농심', 70, 1200, sysdate);
insert into SNACK values(3, '꼬깔콘', '롯데', 70.5, 1300, 
to_date('2021-12-01', 'YYYY-MM-DD'));


--특정 시간 날짜 : 
-- to_date ('값', '패턴') YYYY hh mm HH : MI : SS

update SNACK set s_maker = '해태' where s_no = 50;

select * from snack;

drop table snack cascade constraint purge;