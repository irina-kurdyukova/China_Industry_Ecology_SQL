CREATE TABLE ethylene (
    region TEXT,
    year INTEGER,
    quantity NUMERIC);

select * from ethylene_import;

update ethylene_import 
set 地区 = TRIM(地区);

select * from ethylene;

INSERT INTO ethylene (region, year, quantity)
select
reg.name_region AS region,
v.year,
v.quantity
FROM ethylene_import r
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

select * from ethylene;

ALTER TABLE ethylene
RENAME COLUMN quantity TO ethylene_output;

COMMENT ON COLUMN ethylene.ethylene_output
IS 'Производство этилена. Единица измерения: 10 000 тонн (万吨). Источник: National Bureau of Statistics of China.';

select count(*)
from ethylene
where ethylene_output is null;

select count(*)
from ethylene
where ethylene_output = 0;



