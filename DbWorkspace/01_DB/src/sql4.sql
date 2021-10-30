--select

select * from snack;

-- ��ü ���� �̸�, ����, ����

select s_name, s_price, s_weight from SNACK;

-- ��ü ���� �̸�, ������,����, �������

select s_name, s_maker, s_price, s_exp from SNACK;

--�ʵ���� ���� �ȵ�� as XXX �ؼ� �ٲܼ� ����
select s_name, s_maker as jejosa, s_price, s_exp from SNACK;

--�̸� ����
select s_name, s_price from snack;

-- �� ���¿��� �ΰ��� �ϰ� ���� 
select s_name, s_price, s_price*0.1 from snack;

-- �� ���¿��� �ΰ��� �ϰ� ����(s_vat)
select s_name, s_price, s_price*0.1 as s_vat from snack;

-- test
-- ��ü ���� �̸�, ������, ����, g�� ��(s_g)
select s_name, s_maker, s_price, round(s_price/s_weight) as s_g from snack;

--��ü ���� ��� ����? 
-- ���ݱ����� ���ڵ�(��) ��� �ε�
-- �̰� ���� �ʿ�
-- ����Ŭ�� ����Լ��� ���� : max, min, sum, avg, count ...
select avg(s_price) from SNACK;

-- ���� �Ѱ��� 
select min(s_price) from SNACK;

--��������� ���� ���� ���� ���� 
select max(s_exp) from SNACK;

--���� �� ����
select count(*) from SNACK;

--��ü ������ �̸�, ����, ȸ���
-- ���� �̸��� �����ΰ�

select s_name, s_price, s_maker from SNACK
WHERE s_name like '����';

-- ��� ������ �̸��� ����
select s_name, s_price from SNACK where s_maker like '���';

--��ɰ����� ��� ����
select avg(s_price)  from SNACK
where s_maker = '���';
;

--������ �ȵǴ� ������ �̸�, ����
select s_name, s_price from SNACK
where s_exp < sysdate;

-- '%��' : ���� ������ ��
-- '��%' : ���� �����ϴ� ��
-- '%��%' : �� �� �ִ� ��(�����ϴ°�)

-- ������ ������ �ø��� ������ �̸�, ����
select s_name, s_price from SNACK
where s_name like '%��';

-- ����ũ(�����), ����ũ(�ٴҶ��), ���� ����ũ, ��Ʈ ����ũ
select * from SNACK
where s_name like '%����ũ%'

--test
-- ������ �ø����� �����̸� ���� 
select * from SNACK where s_name like '%�����';
-- �� �Ð��� �� �ְ�
select max(s_price) from SNACK where s_name like '%��%';
-- ���� ��� ���� (�̸� ������ ����)
select s_name, s_maker, s_price from SNACK
where s_price = 
	(select max(s_price) from SNACK);
	
	
--snack ���̺� �߿� ��հ� ���� ��Ѱ��� (�̸�, ����)
select s_name, s_price from SNACK
where s_price > 
	(select avg(s_price) from SNACK)
;

--���� ������ ���� (�̸� ����)
select s_name, s_price from SNACK
where s_weight = 
	(
	select min(s_weight) from SNACK
	)
;
---------------------------
--subQuery(������ ����)

--��� ������ ��հ� ���� ��� ������ ���� ��ü

select * from SNACK
where s_price > 
	(
	select avg(s_price) from SNACK
	where s_maker like '���%'
	)
;	

-- ���� ������ ���� ��� ���ں��� �� ������ ���ڵ��� ���� ��ü
select * from SNACK
where s_price < 
	(
	select max(s_price) 
	from SNACK
	where s_maker like '����%'
	)
	

;

--���, ���� ���� ���� ��ü
select * from SNACK
where s_maker like '���' or s_maker like '����'
;

-- 1000 < ���� < 1500 �� ���� ���� ��ü
select * from SNACK 
where s_price >1000 and s_price <1500;
----------------------------------------------
--���� order by �÷� asc(��������) / desc(����)

-- �Ե� ���� ��ü �̸������� ������
select * from SNACK
where s_maker like '����'
order by s_name asc
;

--���� ��ü ������ ���ݼ�(��������)
select * from SNACK
order by s_price, s_name
;

-- 1500�� �����
-- ���� ����� �� �ִ� ���� ����Ʈ
-- ��������� ª�� �� ����

select * from SNACK
where s_price <= 1500
order by s_exp asc;



insert into SNACK 
values(snack_seq.nextval, '���ڻ�����', '����', 50, 1100, sysdate);
insert into SNACK 
values(snack_seq.nextval, '��Ʈ������', '����', 50, 1100, sysdate);
insert into SNACK 
values(snack_seq.nextval, '��ũ������', '����', 50, 1300, sysdate);
insert into SNACK 
values(snack_seq.nextval, 'ȭ��Ʈ������', '����', 50, 1100, sysdate);
insert into SNACK 
values(snack_seq.nextval, '���ڱ�', '����', 50, 1100, sysdate);
insert into SNACK 
values(snack_seq.nextval, '�Ե�������', '����', 50, 1100, sysdate);
insert into SNACK 
values(snack_seq.nextval, '���廩����', '����', 50, 1100, sysdate);