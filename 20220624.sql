/*���̺� ����*/

CREATE TABLE emp02 as select * from emp;

/*
���̺��� �÷����� �ο��ϱ� ���� ��Ģ
-�ݵ�� ���ڷ� �����ؾ� �Ѵ�.
-1~30�ڱ��� �����ϴ�.
*/

/*

alter table�� ���̺� ���� ����
-���̺��� �÷��� �߰�, ����, ����(�ڷ���, ����)�Ҷ� ����Ѵ�.
-ADD COLUMN ���� ����Ͽ� ���ο� �÷� �߰�
-MODIFY COLUMN ���� ����Ͽ� ���� �÷��� �����Ѵ�.
-DROP COLUMN���� ����Ͽ� ���� �÷��� �����Ѵ�.

*/
--alter table ���̺�� add(�÷��� ������Ÿ��) 

--alter table emp02 add(job varchar2(9));

--select * from emp02;

/*
alter table ���̺�� modify(�÷���, �������ڷ���)
-�ش� �÷��� �ڷᰡ ���� ���
�÷��� ������ Ÿ���� ������ �� �ִ�.
�÷��� ũ�⸦ ������ �� �ִ�.
-�÷��� ������ Ÿ���� ������ �� ����
ũ�⸦ �ø� ���� ������ ���� ������ �ִ� ������ ũ�⺸�� ���� ũ��� ������ �� ����. 
*/

--emp01 ���̺��� job�� ������ Ÿ���� ũ�⸦ 30���� �����Ͻÿ�.

select * from emp02;

alter table emp02 MODIFY(job varchar2(30 char)); 

alter table emp02 drop(job);

/*

DROP table 
drop table ��ɹ��� ���� ���̺��� �����Ѵ�.
���̺��� �����ϸ� ���̺� ����Ǿ� �ִ� �����͵� �Բ� �����ȴ�.
���ŵ� �����ʹ� ������ �� ����.

*/

--drop table ���̺��

drop table emp03;
--������˻�
select * from tab;
--������ ����Ȯ��
desc recyclebin;

SELECT * from recyclebin;

desc recyclebin;
--������ ����
PURGE RECYCLEBIN;

--������ ���̺� ����
FLASHBACK table "BIN$WNn4jgEtQRm3cTDFISe2qQ==$0" TO BEFORE DROP ;


select * from emp03;
--���̺� �̸� ���� rename��
rename emp02 to emp03;


delete from emp03;
rollback;

--���̺��� ��� ���� ����
truncate table emp03;

desc dept;

create table dept01 as select * from dept;

select * from dept01;

insert into dept01(deptno) VALUES (null);

create table dept02 as select * from dept;

select * from dept02;

create table emp04(
    deptno number(2) not null,
    dname varchar2(14 char),
    loc varchar2(13 char)
    
);

select * from emp02;

select * from emp04;

insert into emp04 values(10, null, null);

select * from tab;

drop table dept01;
drop table dept02;
drop table emp03;
drop table dept04;

/*
�������� �����ϴ� UPDATE SET(U)
����
UPDATE ���̺�� SET �÷���1 = ��1, �÷���2 = ��2 where ���ǽ�

� ���� �����͸� �����ϴ��� where���� �̿��Ͽ� ������ ����
where���� ������� ������ ���̺� �ִ� ��� ���� ������

*/

--��� ����� �μ���ȣ�� 30������ ����
UPDATE emp01 set deptno = 30;
create table emp01 as select * from emp;
rollback;
select * from emp01;

update emp01 set sal = sal*1.1;
rollback;
update emp01 set hiredate = sysdate;

update emp01 set hiredate = sysdate where substr(hiredate,1,2) = '87';

select deptno, job from emp01 where ename='SCOTT';
update emp01 set deptno = 10, job = 'manager' where ename = 'SCOTT';


/*

DELETE
���̺� Ư�� ���� ������ ��

���� 
DELETE FROM ���̺�� WHERE ���� 

commit
��� �۾��� ���������� ó���ϰڴٰ� Ȯ���ϴ� ��ɾ�
Ʈ����� ó�� ������ ������ ���̽��� ��� �ݿ���(����� ������ ��� ���� ����)

rollback
-�۾� �� ������ �߻��Ǿ Ʈ����� ó�� �������� �߻��� ���� ������ ����ϴ� ��� 
������ ó���� ���۵Ǳ� ���� ���·� �ǵ���

���������� Ŀ�� ������� ���� ���ο� Ŀ�� ����� �����ϴ� �������� ����� ��� DML ��ɵ��� �ǹ���

*/

drop table dept01;


create table dept01 as select * from dept;
select * from dept01;

delete from dept01;
rollback;
delete from dept01 where deptno = 20;
commit;
rollback;

/*

save point
���� Ʈ������� �۰� ���� �� �� �ִ�.
����� savepoint�� rollback to savepoint ���� ����Ͽ� ǥ���� �� ���� 
rollback �� �� ����

����
Ư�� ��ġ�� �����ϴ� ����
savepoint ���̺��

*/


delete from dept01 where deptno = 30;
SAVEPOINT c1;

delete from dept01 where deptno = 10;
SAVEPOINT c2;

delete from dept01 where deptno = 40;
SAVEPOINT c3;

select * from dept01;

rollback to c1;
rollback;


select * from user_cons_columns where table_name = 'EMP';

select * from user_cons_columns where table_name = 'DEPT';


