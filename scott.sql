select * from emp;

select * from dept;

select ename, sal, hiredate from emp;

--���������: +, -, *, /
select ename, sal*12 from emp;

select max(sal) from emp;

/*

Null�� �ǹ�

1.0���ƴϰ� 
2.������� �ƴϰ�
3.��Ȯ�� ���� �ǹ���
4.� ������ �� �� ������ � ���� �����ϰ� �ִ�.
5.? Ȥ�� ���Ѵ��� �ǹ̵� ����
6.����, �Ҵ�, �񱳰� �Ұ����ϴ�

*/

select 100+? from dual;

desc dual;

select * from dept;

select 24 * 60 * 60 from dept

/*
dual���̺�
-�� ������ ����� ����ϱ� ���� ���̺�
DUMMY �ķ����� �Ѱ��� ���ڸ��� ������ �� �ִ� x��� ���� ����
�� �ϳ��� �ุ�� ������
*/
