CREATE TABLE ammonia_nitrogen(
    region TEXT,
    year INTEGER,
    quantity NUMERIC);

select * from ammonia_nitrogen_import;

update ammonia_nitrogen_import 
set 地区 = TRIM(地区);

select * from ammonia_nitrogen;

INSERT INTO ammonia_nitrogen (region, year, quantity)
select
reg.name_region AS region,
v.year,
v.quantity
FROM ammonia_nitrogen_import r
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

select * from ammonia_nitrogen;

ALTER TABLE ammonia_nitrogen
RENAME COLUMN quantity TO ammonia_nitrogen_output;

COMMENT ON COLUMN ammonia_nitrogen.ammonia_nitrogen_output
IS 'Сбросы аммонийного азота (NH₃-N). Единица измерения: 10 000 тонн (万吨). Источник: National Bureau of Statistics of China.';

select count(*)
from ammonia_nitrogen
where ammonia_nitrogen_output is null;

select count(*)
from ammonia_nitrogen
where ammonia_nitrogen_output = 0;


