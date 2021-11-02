-- RDBMS  (Relational)
-- ���̺��� ���踦 �߽����� ����..

-- ���� ȫ�����1ȣ ¥��� 5000�� - 1 pk
-- ���� �λ������� ������ 6000�� - 2 pk
-- ���ﵿ ���ٹ� �� 3000�� - 3 pk
-- ��ġ���� ��Ÿ���� ��ü�� 6000�� - 4pk

create table menu(
	m_no number(3) primary key,
	m_name varchar2(20 char) not null,
	m_price number(6) not null,
	m_place number(6) not null
);

create table restaurant(
	r_no number(3) primary key,
	r_name varchar2(20 char) not null,
	r_place varchar2(20 char) not null
);

alter table restaurant modify(r_place number(6));


create table human(
	h_no number(3) primary key,
	h_name varchar2(20 char) not null,
	h_birth date not null
);

create table owner(
	o_no number(3) primary key,
	o_ceo number(3) not null,
	o_restaurant number(3) not null
	
);


create sequence menu_seq;
create sequence restaurant_seq;
create sequence human_seq;
create sequence owner_seq;

drop sequence menu_seq;
drop sequence restaurant_seq;
drop sequence human_seq;
drop sequence owner_seq;

drop table menu cascade constraint purge;
drop table human cascade constraint purge;
drop table owner cascade constraint purge;
drop table restaurant cascade constraint purge;

insert into menu values (menu_seq.nextval, '������â', 10000, 1);
insert into menu values (menu_seq.nextval, '�Ұ�â', 15000, 1);
insert into menu values (menu_seq.nextval, '��ä��â', 9000, 2);
insert into menu values (menu_seq.nextval, 'ī���', 6000, 3);
insert into menu values (menu_seq.nextval, '�Ƹ޸�ī��', 4000, 3);
insert into menu values (menu_seq.nextval, '��ü��', 7000, 4);

insert into restaurant values (restaurant_seq.nextval, 'Ȳ�Ұ�â', '����');
insert into restaurant values (restaurant_seq.nextval, '���빮��â', '���빮');
insert into restaurant values (restaurant_seq.nextval, 'Ȳ�Ұ�â', '���빮');
insert into restaurant values (restaurant_seq.nextval, '��Ÿ����', '����');
insert into restaurant values (restaurant_seq.nextval, '��Ÿ����', '����');
insert into restaurant values (500, '��Ÿ����', '��ȭ��');

-- �޴��߰� 
-- ��Ÿ���� ��ȭ�������� ü����ν� ���� �߰�
-- ���⽺���� 2�� ��������� �߰�
insert into menu values (menu_seq.nextval, 'ü������', 5000, 500);
insert into menu values (menu_seq.nextval, '���⽺����', 7000, 2);

-- ���� ������ ��â���� �߸� ������ ���� ��������
update menu set m_place = 4 where m_name = '���⽺����';

-- ���� ���⽺���� �����
delete menu where m_name = '���⽺����';

insert into human values (human_seq.nextval, '��', to_date('1980-05-05', 'YYYY-MM-DD'));
insert into human values (human_seq.nextval, '��', to_date('1985-06-05', 'YYYY-MM-DD'));
insert into human values (human_seq.nextval, '��', to_date('1980-05-05', 'YYYY-MM-DD'));
insert into human values (human_seq.nextval, '��', to_date('1985-08-05', 'YYYY-MM-DD'));


insert into owner values (owner_seq.nextval, 1, 1);
insert into owner values (owner_seq.nextval, 2, 2);
insert into owner values (owner_seq.nextval, 3, 3);
insert into owner values (owner_seq.nextval, 4, 4);

insert into owner values (owner_seq.nextval, 4, 500);

select * from menu;
select * from restaurant;
select * from human;
select * from owner;

-- ���� �˰� �ִ� ���� �̸�, ��ġ(���� ��ȸ) - �̸� �����ټ�
select r_name, r_place from RESTAURANT
order by r_name asc;

-- �޴� �� ���� ��� �޴��� ����

select * from MENU where m_price =
(
	select max(m_price) from MENU
);


--�ֿ���������
select * from HUMAN where h_birth =

(
	select min(h_birth) from HUMAN
);


-- ��â�ø��� ��հ�

select avg(m_price) from MENU
where m_name like '%��â%';

--���� ���� ����
select * from RESTAURANT
where r_place like '����%'
;

--���� �� �޴��� �Ĵ� �Ĵ��� �̸��� ��ġ
select r_name, r_place 
from RESTAURANT
where r_no in 
	(
	select m_place from MENU
	where m_price = 
		(
		select min(m_price) from MENU
		)
	)
;

--���빮���� ���� �� �ִ� ������ �̸�, ����

select m_name, m_price from MENU 
where m_place in
(
	select r_no from restaurant
	where r_place like '���빮%'
);

-- ��â �ø���� ��� ������ ���� ���� �� �ֳ�?
select r_place, r_name from RESTAURANT
where r_no in 
	(
	select m_place from MENU
	where m_name like '%��â%'
	);
	
-- ���� �� Ŀ�Ǹ� �Ĵ� ������ �̸�, ����
select r_name, r_place from RESTAURANT
where r_no in 
	(
	select m_place from menu
	where m_price =
		(
		select min(m_price) from MENU
		--xx
		where m_name like '%��%' or m_name like '%ī��%' 
		)
	);

-------------------------------------------------------

-- join
-- ���� �ٸ� ���̺��� ������ �� �� ���踦 ����� ��

select m_name, m_price, r_name, r_place
from menu, RESTAURANT
where r_no = m_place;
	
	
-- ��Ÿ���� ���� ������ �޴� �̸� ���� (������� ������)
-- ���� ��ð� ����..
select m_name, m_price, r_name, r_place
from MENU, restaurant
where r_name = '��Ÿ����' and r_place = '����';

--���迡 ���� ��� x
select m_name, m_price, r_name, r_place
from MENU, restaurant
where m_place in 
	(
	select r_no from restaurant
	where r_place = '����' and r_name = '��Ÿ����'
	);
	
-- �� ���̺� �� ���� ���ִϱ� ������ �� ������ ��	
select m_name, m_price, r_name, r_place
from MENU, restaurant
where r_no = m_place and m_place in 
	(
	select r_no from restaurant
	where r_place = '����' and r_name = '��Ÿ����'
	);


select m_name, m_price, r_name, r_place
from MENU, restaurant
where r_no = m_place and r_name = '��Ÿ����' and r_place = '����';	

--���� ���� ����Գ� ������ �����, ��ġ, ����� �̸�, ���� �޴���, ����

select r_name, r_place, h_name, h_birth, m_price
from RESTAURANT, menu, HUMAN, OWNER
where r_no = m_place and h_no = o_ceo and o_restaurant = r_no
	and h_birth = 
	(
	select max(h_birth) from HUMAN
	);
	
	
-- �ֿ����� �޴���, �޴�����
--Ʋ����
select m_name, m_price
from MENU
where m_place = (
	select h_no
	from HUMAN
	where h_birth = (
		from HUMAN
	)
);
--����-------------------------
	select m_price, m_name
	from RESTAURANT, menu, HUMAN, OWNER
	where r_no = m_place and h_no = o_ceo and o_restaurant = r_no
	and h_birth = 
	(
	select min(h_birth) from HUMAN
	);
	
select m_name, m_price
from menu
where m_place in (
	select r_no
	from RESTAURANT
	where r_no = (
		select o_ceo
		from owner
		where o_ceo = (
			select h_no
			from HUMAN
				where h_birth =(
				select min(h_birth)
				from human
				)
		)
	)
);

select m_name, m_price
from menu
where m_place = (
		select o_restaurant
		from owner
		where o_ceo = (
			select h_num
			from human
			where h_birth = (
				select min(h_birth)
				from human
			)
		)
);
----------------------------------

-- ������ �Ⱥ���
--Ȳ�Ұ�â ������ ��ü �޴���, ����, ���� ��ġ
select m_name, m_price, r_place
from MENU, restaurant
where m_place = r_no
	and r_name like '%Ȳ�Ұ�â%';
	



--���� �Ѱ� �Ĵ� �����, ��ġ, �޴���, ����

select r_name, r_place, m_name, m_price
from MENU, restaurant
where m_place = r_no
	and m_price = (
	select min(m_price) from menu
);

-------------------------------------
-- CR  Update Delete

--������â ���� �λ� (13000��)
update MENU set m_price = 13000 where m_name = '������â';

--���� �� �޴� ���� �̺�Ʈ
update MENU set m_price = 0
where m_price = (
	select min(m_price) from MENU
);


-- �޴� ��ü�� ��պ��� ��� �޴��� 10% ����

update MENU set m_price = m_price * 0.9
where m_price > (
	select avg(m_price) from MENU
);

--���빮 ���� �޴��� 1000�� �λ�

update menu 
set m_price = m_price + 1000
where m_place in(
	select r_no
	from RESTAURANT
	where r_place = '���빮'
);

-- Ŀ���� '��' ������ ������ 500�� �λ�

update menu set m_price = m_price + 500
where m_name like '%��%';

-- '��' ��� ���ڰ� �� �޴� ����
delete from menu where m_name like '%��%';
-- ���� ���� �޴� ����

delete from menu 
where m_place in (
	select r_no from RESTAURANT
	where r_place = '����' and r_name = '��Ÿ����'
);
-- ���� ���� ����
delete from restaurant where r_place = '����' and r_name = '��Ÿ����'
--��â�� �� ������ �޴��� �� ����

delete from menu  
where m_place = (
	select r_no
	from RESTAURANT
	where r_name like '��â%'
);






	
	


update owner set o_restaurant = 4 where o_no = 4;