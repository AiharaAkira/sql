create table snack(
	s_no number(3) primary key,
	s_name varchar2 (20 char) not null,
	s_maker varchar2 (20 char) not null,
	s_weight number(4, 1) not null,
	s_price number(4) not null,
	s_exp date not null
);
--sysdate : ���� �ð� ��¥(java : Date)
insert into SNACK values(1, '���ĸ�', '���', 60, 1000, sysdate);
insert into SNACK values(50, '���ĸ�', '���', 70, 1200, sysdate);
insert into SNACK values(3, '������', '�Ե�', 70.5, 1300, 
to_date('2021-12-01', 'YYYY-MM-DD'));


--Ư�� �ð� ��¥ : 
-- to_date ('��', '����') YYYY hh mm HH : MI : SS

update SNACK set s_maker = '����' where s_no = 50;

select * from snack;

drop table snack cascade constraint purge;