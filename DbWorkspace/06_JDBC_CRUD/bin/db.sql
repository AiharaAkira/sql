CREATE TABLE db(
d_no number(4) primary key NOT NULL,
d_name varchar2(10 char) NOT NULL,
d_weight number(10) NOT NULL,
d_height number(4) NOT NULL,
d_bmi number(10,2) NOT NULL,
d_result varchar2(10 char) NOT NULL


);
select * from db_test;

alter table db modify(d_h number(10,2));

DROP TABLE db;

create sequence db_seq;