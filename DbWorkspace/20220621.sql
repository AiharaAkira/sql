/*
���� ������ ��ȸ
- ���� �����ʹ� �ݵ�� �̱� ���� �ȿ� ǥ���ϰ�, ��ҹ��ڸ� �����Ѵ�.
*/


select ename from emp;

/*

��� �̸��� MILLER�� ����� ��ȣ�� �̸�, ������ ���


*/


select * from emp;

select empno, ename, job from emp where ename like 'MILLER';

/*
��¥ �����ʹ� �ݵ�� �̱����� �ȿ� ǥ���ϰ�, ��/��/�� �������� ����Ѵ�.
*/


select ename, hiredate from emp where hiredate >= '85/01/01';

/*
�� ������
AND - �ΰ��� ������ ��� ������ �ؾ���
OR - �ΰ��� ������ �ϳ� �̻��� ������ �ؾ���
NOT - ���ǿ� �������� ���ϴ� �͸� �˻���
BETWEEN ~~~AND - Ư�� �������� ���ϴ� �����͸� �˻��ϰ��� �� �� �����
IN - ������ �÷��� ������ ���� �ϳ����� �˾ƺ����� �� �� �����
*/

--�μ� ��ȣ�� 10���̰�, ������ MANAGER�� ��� ���� ���

select * from emp where job = 'MANAGER' and deptno = '10'; 
select * from emp where sal >= 1000 and sal <= 3000;
select * from emp where sal  between  1000 and  3000;

--�μ� ��ȣ�� 10 ���̰ų� ������ MANAGER�� ����� ������ ���


select * from emp where deptno = 10 or job = 'MANAGER';

-- ��� ��ȣ�� 7844 �̰ų� 7521��  ��� ���� ���

select * from emp where empno = 7521 or empno = 7521;


select * from emp where empno in(7844, 7654, 7521);

select * from emp where ename like '%MIL%';

--LIKE������
/*
-�˻��ϰ��� �ϴ� ���� ��Ȯ�� �� ��� ���ϵ� ī��� �Բ� ����Ͽ�
%:���ڰ� ���ų�, �ϳ� �þ��� ���ڰ� � ���� ���� ��� ����
_: �ϳ��� ���ڰ� � ���� ���� ��� ����
*/

--����� �̸��� k�� �����ϴ� ����� �˻��Ͽ� ������ ����Ͻÿ�.
select * from emp where ename like 'K%'




