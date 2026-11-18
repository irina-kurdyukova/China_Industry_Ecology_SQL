CREATE TABLE crude_steel (
    region TEXT,
    year INTEGER,
    quantity FLOAT);

select *
from crude_steel;

CREATE TABLE region (
    name_region TEXT,
    name_china TEXT);

insert into region (name_china)
select distinct 地区
from crude_steel_raw csr 

select * 
from region

delete 
from region 
where name_china is null or name_china = '';

update region
set name_region = 'Пекин'
where name_china = '北京市';

update region r 
SET name_region = 
CASE
when name_china = '天津市' then 'Тяньцзинь'
when name_china = '河北省' then 'Хэбэй'
when name_china = '山西省' then 'Шаньси'
when name_china = '内蒙古自治区' then 'Внутренняя Монголия'
when name_china = '辽宁省' then 'Ляонин'
when name_china = '吉林省' then  'Цзилинь'
when name_china = '黑龙江省' then 'Хэйлунцзян'
when name_china = '上海市' then 'Шанхай'
when name_china = '江苏省' then 'Цзянсу'
when name_china = '浙江省' then 'Чжэцзян'
when name_china = '安徽省' then 'Аньхой'
when name_china = '福建省' then 'Фуцзянь'
when name_china = '江西省' then 'Цзянси'
when name_china = '山东省' then 'Шаньдун'
when name_china = '河南省' then 'Хэнань'
when name_china = '湖北省' then 'Хубэй'
when name_china = '湖南省' then 'Хунань'
when name_china = '广东省' then 'Гуандун'
when name_china = '广西壮族自治区' then 'Гуанси'
when name_china = '海南省' then 'Хайнань'
when name_china = '重庆市' then 'Чунцин'
when name_china = '四川省' then 'Сычуань'
when name_china = '贵州省' then 'Гуйчжоу'
when name_china = '云南省' then 'Юньнань'
when name_china = '西藏自治区' then 'Тибет'
when name_china = '陕西省' then 'Шэньси'
when name_china = '甘肃省' then 'Ганьсу'
when name_china = '青海省' then 'Цинхай'
when name_china = '宁夏回族自治区' then 'Нинся'
when name_china = '新疆维吾尔自治区' then 'Синьцзян'
else name_region
end
WHERE name_region IS NULL;

SELECT name_china
FROM region
WHERE name_region IS NULL;


update region r 
SET name_region = 
CASE
	when name_china = '黑龙江省	' then 'Хэйлунцзян'
	when name_china = '内蒙古自治区	' then 'Внутренняя Монголия'
end
where name_region  is null;

select * from region r 

update region r 
set name_china = TRIM(name_china);

update crude_steel_raw csr 
set 地区 = TRIM(地区);

delete 
from crude_steel_raw 
where 地区 is null or 地区 = '';

select *
from crude_steel_raw csr 
where 地区 is null or 地区 = '';

select 
count(*)
from region;

select 
count(*)
from crude_steel_raw;

select count(*)
from crude_steel;

select 
name_region,
name_china,
COUNT(name_region)
from region 
group by name_region,name_china;

create table region_clean as 
select
distinct name_region,name_china
from region;

select 
*
from region_clean;

select
*
from region_clean
where name_china is null or name_china = '';

select 
count(*)
from region_clean rc;

select
*
from region_clean
where name_region is null or name_region = '';

drop table region;

alter table region_clean rename to region;

select 
*
from crude_steel cs ;

select 
*
from crude_steel_raw;

select 
*
from crude_steel;


INSERT INTO crude_steel (region, year, quantity)
select
reg.name_region AS region,
v.year,
v.quantity
FROM crude_steel_raw r
CROSS JOIN LATERAL (
VALUES
(2024, r."2024年"),
(2023, r."2023年"),
(2022, r."2022年"),
(2021, r."2021年"),
(2020, r."2020年"),
(2019, r."2019年"),
(2018, r."2018年"),
(2017, r."2017年"),
(2016, r."2016年"),
(2015, r."2015年"),
(2014, r."2014年"),
(2013, r."2013年"),
(2012, r."2012年"),
(2011, r."2011年")
) v(year, quantity)
    join region reg on reg.name_china=r.地区;


select *
from crude_steel;

ALTER TABLE crude_steel
RENAME COLUMN quantity TO crude_steel_output;

select 
count(*) as cnt
from crude_steel;

select *
from crude_steel;

select 
*
from crude_steel
where crude_steel_output is null or crude_steel_output = 0;

select 
count(*)
from crude_steel cs 
where crude_steel_output is null;

COMMENT ON COLUMN crude_steel.crude_steel_output
IS 'Производство нерафинированной стали. Единица измерения: 10 000 тонн (万吨). Источник: National Bureau of Statistics of China';

select *
from crude_steel;


