/*

�ϳ��� ���̺��� ���� ������ ������ ����.

DBA�� �����ؾ���
*/

select * from emp01;

create view view_emp10
as select * from emp01 where deptno = 10;


select * from view_emp10;

/*
-��� ���̺� ó�� �ϳ��� ��ü�μ� ���̺� ������ ���� �����ϰ� create view ������� �����Ѵ�.

���� ����

create [or replace] [force] [noforce] view view_name
[(alias, alias, ...)]
as subquery
[with check option]
[with read only] : �ش� �並 ���ؼ��� select�� �����ϸ� insert/update/delete�� ����� �� ����.

or replcae view 
-���ο� �並 ���� �� ���� �Ӹ� �ƴ϶� ������ �䰡 �����ϴ��� �������� �ʰ�
���ο� ������ ��� ������ �� �ִ�.


force
-���� ���̺��� ���� ���ο� ������� �並 ������

with check option
-�ش� �並 ���ؼ� �� �� �ִ� ���� �������� 

���� ����

-�信���� ���Ǹ� �⺻ ���̺� ���� ���Ƿ� �����Ѵ�
-�⺻���̺� ���� ���Ǹ� ���� �����͸� �˻���
-�˻��� ����� ���

���� ����
-�⺻ ���̺��� ���� ���� �ܼ� ��, ���� ��� ����

�ܼ� ��
-�ϳ��� ���̺�� ����
-�׷��Լ��� ����� �Ұ���
-DISTINCT ����� �Ұ���
-DML ��밡��

���� ��
-�������� ���̺�� ����
-�׷� �Լ��� ����� ����
-DISTINC��밡��
-DML��밡��


*/

insert into view_emp10 values(8000, 'angel', 'tenshi',7000, sysdate,2500,null,10);

--�ܼ� �信���� DML ��ɹ� ó�� ����� �並 �����Ҷ� ����� �⺻ ���̺��� ������ ��ģ��.
select * from view_emp10;


-- �ܼ� ���� �÷��� ��Ī �ο�
--�����ȣ, �����, �޿�, �μ���ȣ�� ������ �並 �ۼ��ϵ�
--�⺻���̺��� emp01�� �ϰ� �÷����� �ѱ۷� �ۼ�

create or replace
view view_emp11(�����ȣ, �����, �޿�, �μ���ȣ) 
as
select empno, ename, sal, deptno  from emp01;

select * from view_emp11;


/*

���� ���� : �÷��� ��Ī�� ����ؼ� �並 �����ϸ� view_name
*/








