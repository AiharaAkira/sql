--select

select * from snack;

-- 전체 과자 이름, 가격, 무게

select s_name, s_price, s_weight from SNACK;

-- 전체 과자 이름, 제조사,가격, 유통기한

select s_name, s_maker, s_price, s_exp from SNACK;

--필드명이 맘에 안들면 as XXX 해서 바꿀수 있음
select s_name, s_maker as jejosa, s_price, s_exp from SNACK;

--이름 가격
select s_name, s_price from snack;

-- 이 상태에서 부과세 하고 싶음 
select s_name, s_price, s_price*0.1 from snack;

-- 이 상태에서 부과세 하고 싶음(s_vat)
select s_name, s_price, s_price*0.1 as s_vat from snack;

-- test
-- 전체 과자 이름, 제조사, 가격, g당 얼마(s_g)
select s_name, s_maker, s_price, round(s_price/s_weight) as s_g from snack;

--전체 과자 평균 가격? 
-- 지금까지는 레코드(행) 계산 인데
-- 이건 열이 필요
-- 오라클에 통계함수가 있음 : max, min, sum, avg, count ...
select avg(s_price) from SNACK;

-- 제일 싼과자 
select min(s_price) from SNACK;

--유통기한이 제일 오래 남은 과자 
select max(s_exp) from SNACK;

--과자 총 개수
select count(*) from SNACK;

--전체 과자의 이름, 가격, 회사명
-- 과자 이름이 고래밥인거

select s_name, s_price, s_maker from SNACK
WHERE s_name like '고래밥';

-- 농심 과자의 이름과 가격
select s_name, s_price from SNACK where s_maker like '농심';

--농심과자의 평균 가격
select avg(s_price)  from SNACK
where s_maker = '농심';
;

--먹으면 안되는 과자의 이름, 가격
select s_name, s_price from SNACK
where s_exp < sysdate;

-- '%ㅋ' : ㅋ로 끝나는 거
-- 'ㅋ%' : ㅋ로 시작하는 거
-- '%ㅋ%' : ㅋ 이 있는 것(포함하는거)

-- 깡으로 끝나는 시리즈 과자의 이름, 가격
select s_name, s_price from SNACK
where s_name like '%깡';

-- 쉐이크(딸기맛), 쉐이크(바닐라맛), 초코 쉐이크, 민트 쉐이크
select * from SNACK
where s_name like '%쉐이크%'

--test
-- 빼빼로 시르즈의 과자이름 가격 
select * from SNACK where s_name like '%빼배로';
-- 깡 시맂즈 중 최고가
select max(s_price) from SNACK where s_name like '%깡%';
-- 제일 비싼 과자 (이름 제조사 가격)
select s_name, s_maker, s_price from SNACK
where s_price = 
	(select max(s_price) from SNACK);
	
	
--snack 테이블 중에 평균가 보다 비싼과자 (이름, 가격)
select s_name, s_price from SNACK
where s_price > 
	(select avg(s_price) from SNACK)
;

--제일 가벼운 과자 (이름 가격)
select s_name, s_price from SNACK
where s_weight = 
	(
	select min(s_weight) from SNACK
	)
;
---------------------------
--subQuery(쿼리속 쿼리)

--농심 과자의 평균가 보다 비싼 과자의 정보 전체

select * from SNACK
where s_price > 
	(
	select avg(s_price) from SNACK
	where s_maker like '농심%'
	)
;	

-- 해태 과자중 제일 비싼 과자보다 싼 나머지 과자들의 정보 전체
select * from SNACK
where s_price < 
	(
	select max(s_price) 
	from SNACK
	where s_maker like '해태%'
	)
	

;

--농심, 해태 과자 정보 전체
select * from SNACK
where s_maker like '농심' or s_maker like '해태'
;

-- 1000 < 가격 < 1500 인 과자 정보 전체
select * from SNACK 
where s_price >1000 and s_price <1500;
----------------------------------------------
--정렬 order by 컬럼 asc(오름차순) / desc(역순)

-- 롯데 과자 전체 이름순으로 ㅈ정렬
select * from SNACK
where s_maker like '해태'
order by s_name asc
;

--과자 전체 정보를 가격순(오름차순)
select * from SNACK
order by s_price, s_name
;

-- 1500원 전재산
-- 내가 사먹을 수 있는 과자 리스트
-- 유통기한이 짧은 걸 위로

select * from SNACK
where s_price <= 1500
order by s_exp asc;



insert into SNACK 
values(snack_seq.nextval, '초코빼빼로', '해태', 50, 1100, sysdate);
insert into SNACK 
values(snack_seq.nextval, '민트빼빼로', '해태', 50, 1100, sysdate);
insert into SNACK 
values(snack_seq.nextval, '다크빼빼로', '해태', 50, 1300, sysdate);
insert into SNACK 
values(snack_seq.nextval, '화이트빼빼로', '해태', 50, 1100, sysdate);
insert into SNACK 
values(snack_seq.nextval, '감자깡', '해태', 50, 1100, sysdate);
insert into SNACK 
values(snack_seq.nextval, '롯데빼빼로', '해태', 50, 1100, sysdate);
insert into SNACK 
values(snack_seq.nextval, '누드빼빼로', '해태', 50, 1100, sysdate);