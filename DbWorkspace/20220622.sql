select length('DataBase'), length('�����ͺ��̽�') from dual;
select lengthb('DataBase'), lengthb('�����ͺ��̽�') from dual;


select * from emp;

select ename,length(ename) from emp where deptno = 10;

select lower(ename) from emp where length(ename) = 4;

/*
INSTR : Ư�������� ��ġ ���� ��ȯ

INSTRB : Ư�� ������ ��ġ ���� ��ȯ

*/
--3��° ���ͽ����ؼ� 2��° a�� ã��
select instr('DataBase', 'a',3, 2) from dual;

select ename, trim('S' FROM ename), trim( 'H' from ename) from emp where ename = 'SMITH';

select ename, ltrim('aaaaaoracle11', 'a'), trim('S' FROM ename), trim( 'H' from ename) from emp where ename = 'SMITH';

select ename, rtrim('aaaaaoracle11', 'a'), trim('S' FROM ename), trim( 'H' from ename) from emp where ename = 'SMITH';

select ename, trim('       aaaaa oracle11           '), trim('S' FROM ename), trim( 'H' from ename) from emp where ename = 'SMITH';
-- both : ���� �������� trim�� �⺻���� both


select cos(90) from dual;

select sin(90) from dual;

select tan(90) from dual;

select floor(34.1332) from dual;

select trunc(12.345, -3) from dual;

--Ư�� �ڸ������� �ݿø��ϴ� �Լ�(round)

select
round(35.12,1)--�Ҽ��� ���� 2��° �ڸ����� �ݿø�
from dual;

select power(3, 2) from dual;
select mod(34,5) from dual;

select * from emp;

select empno, ename, job from emp where mod(empno,2)=0;

--��¥ �Լ� sysdate, months_betweens, add_month, next_day, last_day, round, trunc


select sysdate, hiredate, MONTHS_BETWEEN(sysdate, hiredate) from emp where deptno = 10;

select hiredate, add_months(hiredate, 3) from emp;

ALTER SESSION SET NLS_LANGUAGE=AMERICAN;--�����϶�
ALTER SESSION SET NLS_LANGUAGE=KOREAN; --�ѱ��϶�

--LAST DAY : �ش� ���� ������ ��¥�� ��ȯ��
SELECT sysdate, LAST_DAY(SYSDATE) from dual;

--trunc : ��¥�� �߶�

