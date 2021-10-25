create table snack(
	s_no number(3) primary key,
	s_name varchar2 (20 char) not null,
	s_maker varchar2 (20 char) not null,
	s_weight number(4, 1) not null,
	s_price number(4) not null,
	s_exp date not null
);

--���� �ڵ����� �ø��� : sequence(���̺�� ����) - ����Ŭ ���
--create sequence ��������;
create sequence snack_seq;\
--��������.nextval �� ���

insert into SNACK 
values(snack_seq.nextval, '���ĸ�', '���', 60, 1000, sysdate);
insert into SNACK 
values(snack_seq.nextval, '�����', '����', 50, 1100, sysdate);
insert into SNACK 
values(snack_seq.nextval, '������', '������', 50, 1300, sysdate);
insert into SNACK 
values(snack_seq.nextval, '����', '����', 50, 1600, sysdate);

select * from snack;