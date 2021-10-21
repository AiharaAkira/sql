--�ּ�
--���̺� ����
CREATE TABLE product(
p_name varchar2(10 char),
p_price number(4)
);

--���ֱ�
insert into product values('pen', 1000);
--��ȸ
select * from product;
--��, row, �� �ϳ��� ������ 1��. record��� ��.
--��, field, �Ӽ�, colum
-- ����Ŭ ��ҹ��� ���� x �� �빮��
-- DBA : ���� ��������, ���/����, �������� 
-- DBP : CRUD (create read update delete)
-- sql (Structured Query Language) : DB�� �����ϴ� ���
--���峡 ;


--1) ���̺� ����� (�̸�, ����, ��, ��, ��)
CREATE TABLE student(
	s_name varchar2(30 char),
	s_age number(4),
	s_koreanPoint number(3), 
	s_englishPoint number(3), 
	s_mathPoint number(3)
);
--2)������ ����
insert into student values('akira', 17, 99, 99, 99);

insert into student(s_name, s_age)values ('�ؼ�', 20);

insert into student(s_mathPoint, s_englishPoint, s_koreanPoint, s_name, s_age)
values (99, 100, 80, '�ؼ�', 20);
--�Ⱦ��� > null
-- �ʵ� ������ �� �ٲٴ���, Null�� �ּ� ��¿����

--3)��ȸ
select * from student;
--4)���̺� ����
drop table student cascade constraint purge;

--1) ���̺� ����� (�̸�, ����, ��, ��, ��)
CREATE TABLE student2(
	s_no number(3) primary key NOT NULL,
	s_name varchar2(30 char) NOT NULL,
	s_age number(4) NOT NULL,
	s_koreanPoint number(3) NOT NULL, 
	s_englishPoint number(3) NOT NULL, 
	s_mathPoint number(3) NOT NULL
);

insert into student2 values(1, '���', 17, 100, 90, 80);
insert into student2 values(2, '����', 17, 90, 90, 90);
insert into student2 values(3, '�ο�', 17, 90, 90, 90);
insert into student2 values(20, '����', 17, 90, 90, 90);
insert into student2 values(15, '����', 17, 90, 90, 90);

select * from student2;

--���̺� ����(���̺��� �ɸ� ���� ������ ���� ����)
drop table student2  
cascade constraint purge;

--�ɼ�
--not null : ��ǻ� �⺻, �ʼ�
-- primary key : not null + �ߺ� ����
-- �� ���̺��� ��ǥ�ϴ� �� > ���̺� �ϳ����� pk �ϳ� �ִ°� ����
-- id > �� �� 

-- ������ ���� (cr Update d)
-- 10�� ����� ���������� 50������
update student2 
SET s_englishpoint =100
WHERE s_no = 15
;

-- ������ ����(cruDelete)
-- ������ ����
DELETE student2
WHERE s_name LIKE '����'
;
select * from student2;

--student2 ���̺��� �л� �̸�
SELECT s_name from student2;

-- �� ���̺��� �л� �̸��� ����, ���� ����
select s_name, s_age, s_englishpoint from student2;