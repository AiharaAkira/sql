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

insert into owner values (owner_seq.nextval, 4, 500);

select * from menu;
select * from restaurant;
select * from human;
select * from owner;

-- 내가 알고 있는 맛집 이름, 위치(매장 조회) - 이름 가나다순
select r_name, r_place from RESTAURANT
order by r_name asc;

-- 메뉴 중 제일 비싼 메뉴의 정보

select * from MENU where m_price =
(
	select max(m_price) from MENU
);


--최연장자정보
select * from HUMAN where h_birth =

(
	select min(h_birth) from HUMAN
);


-- 곱창시리즈 평균가

select avg(m_price) from MENU
where m_name like '%곱창%';

--종로 가게 정보
select * from RESTAURANT
where r_place like '종로%'
;

--제일 싼 메뉴를 파는 식당의 이름과 위치
select r_name, r_place 
from RESTAURANT
where r_no in 
	(
	select m_place from MENU
	where m_price = 
		(
		select min(m_price) from MENU
		)
	)
;

--동대문에서 먹을 수 있는 음식의 이름, 가격

select m_name, m_price from MENU 
where m_place in
(
	select r_no from restaurant
	where r_place like '동대문%'
);

-- 곱창 시리즈는 어느 지역에 가면 먹을 수 있나?
select r_place, r_name from RESTAURANT
where r_no in 
	(
	select m_place from MENU
	where m_name like '%곱창%'
	);
	
-- 제일 싼 커피를 파는 매장의 이름, 지역
select r_name, r_place from RESTAURANT
where r_no in 
	(
	select m_place from menu
	where m_price =
		(
		select min(m_price) from MENU
		--xx
		where m_name like '%라떼%' or m_name like '%카노%' 
		)
	);

-------------------------------------------------------

-- join
-- 서로 다른 테이블을 연결할 때 그 관계를 명시할 것

select m_name, m_price, r_name, r_place
from menu, RESTAURANT
where r_no = m_place;
	
	
-- 스타벅스 종로 지점의 메뉴 이름 가격 (레스토랑 정보도)
-- 관계 명시가 없음..
select m_name, m_price, r_name, r_place
from MENU, restaurant
where r_name = '스타벅스' and r_place = '종로';

--관계에 대한 명시 x
select m_name, m_price, r_name, r_place
from MENU, restaurant
where m_place in 
	(
	select r_no from restaurant
	where r_place = '종로' and r_name = '스타벅스'
	);
	
-- 두 테이블 잘 연결 해주니까 이제야 잘 나오는 거	
select m_name, m_price, r_name, r_place
from MENU, restaurant
where r_no = m_place and m_place in 
	(
	select r_no from restaurant
	where r_place = '종로' and r_name = '스타벅스'
	);


select m_name, m_price, r_name, r_place
from MENU, restaurant
where r_no = m_place and r_name = '스타벅스' and r_place = '종로';	

--제일 젊은 사장님네 가게의 매장명, 위치, 사장님 이름, 생일 메뉴명, 가격

select r_name, r_place, h_name, h_birth, m_price
from RESTAURANT, menu, HUMAN, OWNER
where r_no = m_place and h_no = o_ceo and o_restaurant = r_no
	and h_birth = 
	(
	select max(h_birth) from HUMAN
	);
	
	
-- 최연장자 메뉴명, 메뉴가격
--틀린것
select m_name, m_price
from MENU
where m_place = (
	select h_no
	from HUMAN
	where h_birth = (
		from HUMAN
	)
);
--정답-------------------------
	select m_price, m_name
	from RESTAURANT, menu, HUMAN, OWNER
	where r_no = m_place and h_no = o_ceo and o_restaurant = r_no
	and h_birth = 
	(
	select min(h_birth) from HUMAN
	);
	
select m_name, m_price
from menu
where m_place in (
	select r_no
	from RESTAURANT
	where r_no = (
		select o_ceo
		from owner
		where o_ceo = (
			select h_no
			from HUMAN
				where h_birth =(
				select min(h_birth)
				from human
				)
		)
	)
);

select m_name, m_price
from menu
where m_place = (
		select o_restaurant
		from owner
		where o_ceo = (
			select h_num
			from human
			where h_birth = (
				select min(h_birth)
				from human
			)
		)
);
----------------------------------

-- 가능한 안보고
--황소곱창 가게의 전체 메뉴명, 가격, 매장 위치
select m_name, m_price, r_place
from MENU, restaurant
where m_place = r_no
	and r_name like '%황소곱창%';
	



--제일 싼거 파는 매장명, 위치, 메뉴명, 가격

select r_name, r_place, m_name, m_price
from MENU, restaurant
where m_place = r_no
	and m_price = (
	select min(m_price) from menu
);

-------------------------------------
-- CR  Update Delete

--돼지곱창 가격 인상 (13000원)
update MENU set m_price = 13000 where m_name = '돼지곱창';

--제일 싼 메뉴 무료 이벤트
update MENU set m_price = 0
where m_price = (
	select min(m_price) from MENU
);


-- 메뉴 전체의 평균보다 비싼 메뉴를 10% 할인

update MENU set m_price = m_price * 0.9
where m_price > (
	select avg(m_price) from MENU
);

--동대문 지역 메뉴들 1000원 인상

update menu 
set m_price = m_price + 1000
where m_place in(
	select r_no
	from RESTAURANT
	where r_place = '동대문'
);

-- 커피중 '라떼' 종류의 가격을 500원 인상

update menu set m_price = m_price + 500
where m_name like '%라떼%';

-- '라떼' 라는 글자가 들어간 메뉴 삭제
delete from menu where m_name like '%라떼%';
-- 강남 스벅 메뉴 삭제

delete from menu 
where m_place in (
	select r_no from RESTAURANT
	where r_place = '강남' and r_name = '스타벅스'
);
-- 강남 스벅 폐점
delete from restaurant where r_place = '강남' and r_name = '스타벅스'
--곱창이 들어간 매장의 메뉴를 다 삭제

delete from menu  
where m_place = (
	select r_no
	from RESTAURANT
	where r_name like '곱창%'
);






	
	


update owner set o_restaurant = 4 where o_no = 4;