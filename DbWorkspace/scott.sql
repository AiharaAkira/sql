

/*
-equi join : ������ �÷��� �������� ����
-NonEqui join : ������ �÷��� ���� �ٸ� ������ ����Ͽ� ����
-Outer join : ���� ���ǿ� �������� �ʴ� �൵ ��Ÿ��
-Self join : �� ���̺� ������ ����

*/

select ename, dname from emp e, dept d where e.deptno = d.deptno;