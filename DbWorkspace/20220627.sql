/*

���� ����

emmp06 ��� ���̺� ���� �÷��� �߰��ϵ�
gender�÷����� 'm' or 'f'�� �ΰ��� ������ �� �ִ� check ���� ���� ����

*/

create table emp06 (

empno number(4) primary key,
ename varchar2(10) not null,
gender varchar2(1) check(gender in ('M', 'F'))

);

insert into emp06 values(7566, 'JONES', 'M');


select * from emp06;


/*

���� ���Ǹ� �����ϱ�
-����ڰ� �ǹ��ְ� ���� ���Ǹ��� ����Ͽ� ���� ���Ǹ����� � ���������� �����ߴ��� �� �� �ְ� �ϴ� ���
�������: column_name data_type CONSTRAINT constraint_name constraint_type

���� ���� �� ��� ��Ģ
���̺��_ �÷���_ �������� ����

�⺻Ű ���� ���� ���� EMP06_EMPNO_PK
EMP06_EMPNO_PK

*/

create table emp05 (

empno number(4) constraint emp05_empno_pk primary key,
ename varchar2(10) constraint emp05_ename_NN NOT NULL ,
job varchar2(9) constraint emp05_job_UK UNIQUE,
dept_no number(4) constraint emp05_dept_no_FK REFERENCES dept(deptno)
);

SELECT * FROM emp05;

select constraint_name, constraint_type, table_name, search_condition, r_constraint_name from user_constraints ;

insert into emp05 values(7499, 'ALLEN', 'SALESMAN', 30);

/*

���̺� ���� ������� �������� �����ϱ�

����Ű�� �⺻Ű�� ������ ���

-����Ű�� �⺻Ű�� ������ ���
-����Ű ���·� ���������� ������ ��쿡�� �÷� ���� �������δ� �Ұ����ϰ� �ݵ�� ���̺� ���� ����� ����Ͽ��� �Ѵ�

ALTER TABLE�� ���� ������ �߰��� ���
-���̺��� ���ǰ� �Ϸ�Ǿ �̹� ���̺��� ������ ������ �Ŀ� ���߿� ���̺� ���������� �߰��ϰ��� �Ҷ����� ���̺� ���� ������� ���������� ������

����
create table ���̺�� (
�÷���1 ������ Ÿ��1,
�÷���2 ������ Ÿ��2,
...

constraint constraint_name constraint_type(column��)


);

*/

create table emp04(

empno number(4),
ename varchar2(10) not null,
job varchar2(9),
deotno number(4)

);
