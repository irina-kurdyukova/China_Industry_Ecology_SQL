CREATE TABLE natural_gas (
    region TEXT,
    year INTEGER,
    quantity NUMERIC);

select * from natural_gas_import;

update natural_gas_import 
set 地区 = TRIM(地区);

select * from natural_gas;

INSERT INTO natural_gas (region, year, quantity)
select
reg.name_region AS region,
v.year,
v.quantity
FROM natural_gas_import r
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

select * from natural_gas;

ALTER TABLE natural_gas
RENAME COLUMN quantity TO natural_gas_output;

COMMENT ON COLUMN natural_gas.natural_gas_output
IS 'Добыча природного газа. Единица измерения: 100 миллионов кубических метров (亿立方米). Источник: National Bureau of Statistics of China.';

select count(*)
from natural_gas
where natural_gas_output is null;

select count(*)
from natural_gas
where natural_gas_output = 0;


