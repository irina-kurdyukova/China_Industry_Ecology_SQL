CREATE TABLE mobile_phones (
    region TEXT,
    year INTEGER,
    quantity NUMERIC);

select * from mobile_phones_import;

SELECT current_database();

update mobile_phones_import 
set 地区 = TRIM(地区);

select * from mobile_phones;

INSERT INTO mobile_phones (region, year, quantity)
select
reg.name_region AS region,
v.year,
v.quantity
FROM mobile_phones_import r
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

select * from mobile_phones;

ALTER TABLE mobile_phones
RENAME COLUMN quantity TO mobile_phones_output;

COMMENT ON COLUMN mobile_phones.mobile_phones_output
IS 'Производство мобильных телефонов. Единица измерения: 10 000 штук (万台). Источник: National Bureau of Statistics of China.';

select count(*)
from mobile_phones
where mobile_phones_output is null;

select count(*)
from mobile_phones
where mobile_phones_output = 0;


