create table department(

    deptno number(3) not null,
    dname varchar2(30) not null,
    college varchar2(30) not null,
    loc varchar2(15) not null,
    
    CONSTRAINT department_pk PRIMARY KEY(deptno)
);

commit;

select * from department;


create table professor(

profno number(5) primary key,
name varchar2(10) not null,
ename varchar2(20) not null,
position varchar2(20) not null,
sal number(4) not null,
hiredate date not null,
age number(3) not null,
deptno number(3) not null

);


--professor_fk

ALTER TABLE professor
ADD CONSTRAINT fk_department
foreign KEY(deptno) references department(deptno);


commit;
insert into professor values(01,'test','test','test',1,sysdate,0,(select deptno from department where loc='7È£°ü'));

SELECT * FROM professor;
