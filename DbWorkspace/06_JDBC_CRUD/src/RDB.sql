-- RDBMS  (Relational)
-- 테이블간의 관계를 중심으로 뭔가..

-- 강남 홍콩반점1호 짜장면 5000원 - 1 pk
-- 종로 인생설렁탕 설렁탕 6000원 - 2 pk
-- 역삼동 빽다방 라떼 3000원 - 3 pk
-- 대치동에 스타벅스 돌체라떼 6000원 - 4pk

create table menu(
	m_no number(3) primary key,
	m_name varchar2(20 char) not null,
	m_price number(6) not null,
	m_place number(6) not null
);

create table restaurant(
	r_no number(3) primary key,
	r_name varchar2(20 char) not null,
	r_place varchar2(20 char) not null
);

alter table restaurant modify(r_place number(6));


create table human(
	h_no number(3) primary key,
	h_name varchar2(20 char) not null,
	h_birth date not null
);

create table owner(
	o_no number(3) primary key,
	o_ceo number(3) not null,
	o_restaurant number(3) not null
	
);


create sequence menu_seq;
create sequence restaurant_seq;
create sequence human_seq;
create sequence owner_seq;

drop sequence menu_seq;
drop sequence restaurant_seq;
drop sequence human_seq;
drop sequence owner_seq;

drop table menu cascade constraint purge;
drop table human cascade constraint purge;
drop table owner cascade constraint purge;
drop table restaurant cascade constraint purge;

insert into menu values (menu_seq.nextval, '돼지곱창', 10000, 1);
insert into menu values (menu_seq.nextval, '소곱창', 15000, 1);
insert into menu values (menu_seq.nextval, '야채곱창', 9000, 2);
insert into menu values (menu_seq.nextval, '카페라떼', 6000, 3);
insert into menu values (menu_seq.nextval, '아메리카노', 4000, 3);
insert into menu values (menu_seq.nextval, '돌체라떼', 7000, 4);

insert into restaurant values (restaurant_seq.nextval, '황소곱창', '종로');
insert into restaurant values (restaurant_seq.nextval, '동대문곱창', '동대문');
insert into restaurant values (restaurant_seq.nextval, '황소곱창', '동대문');
insert into restaurant values (restaurant_seq.nextval, '스타벅스', '종로');
insert into restaurant values (restaurant_seq.nextval, '스타벅스', '강남');
insert into restaurant values (500, '스타벅스', '광화문');

-- 메뉴추가 
-- 스타벅스 광화문점에서 체리블로썸 음료 추가
-- 딸기스무디 2번 레스토랑에 추가
insert into menu values (menu_seq.nextval, '체리블라썸', 5000, 500);
insert into menu values (menu_seq.nextval, '딸기스무디', 7000, 2);

-- 딸기 스무디 곱창집에 잘못 넣은거 스벅 종로점에
update menu set m_place = 4 where m_name = '딸기스무디';

-- 위에 딸기스무디 지우기
delete menu where m_name = '딸기스무디';

insert into human values (human_seq.nextval, '김', to_date('1980-05-05', 'YYYY-MM-DD'));
insert into human values (human_seq.nextval, '나', to_date('1985-06-05', 'YYYY-MM-DD'));
insert into human values (human_seq.nextval, '박', to_date('1980-05-05', 'YYYY-MM-DD'));
insert into human values (human_seq.nextval, '이', to_date('1985-08-05', 'YYYY-MM-DD'));


insert into owner values (owner_seq.nextval, 1, 1);
insert into owner values (owner_seq.nextval, 2, 2);
insert into owner values (owner_seq.nextval, 3, 3);
insert into owner values (owner_seq.nextval, 4, 4);

update owner set o_restaurant = 4 where o_no = 4;