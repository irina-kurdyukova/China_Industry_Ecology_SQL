CREATE TABLE industrial_water_use(
    region TEXT,
    year INTEGER,
    quantity NUMERIC);

select * from industrial_water_use_import;

update industrial_water_use_import 
set 地区 = TRIM(地区);

select * from industrial_water_use;

INSERT INTO industrial_water_use (region, year, quantity)
select
reg.name_region AS region,
v.year,
v.quantity
FROM industrial_water_use_import r
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

select * from industrial_water_use;

ALTER TABLE industrial_water_use
RENAME COLUMN quantity TO industrial_water_use_output;

COMMENT ON COLUMN industrial_water_use.industrial_water_use_output
IS 'Общий объём промышленного водопользования. Единица измерения: 100 миллионов кубических метров (亿立方米). Источник: National Bureau of Statistics of China.';

select count(*)
from industrial_water_use
where industrial_water_use_output is null;

select count(*)
from industrial_water_use
where industrial_water_use_output = 0;


