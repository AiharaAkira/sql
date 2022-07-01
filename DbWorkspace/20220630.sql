create table department(

    deptno number(3) not null,
    dname varchar2(30) not null,
    college varchar2(30) not null,
    loc varchar2(15) not null,
    
    CONSTRAINT department_pk PRIMARY KEY(deptno)
);

commit;

select * from department;