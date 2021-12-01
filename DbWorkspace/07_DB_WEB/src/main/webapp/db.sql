create table nameage(
n_name varchar2(20 char) not null,
n_age number(2) not null
);

drop table nameage;

insert into nameage values ('akira', 1);

select * from nameage;