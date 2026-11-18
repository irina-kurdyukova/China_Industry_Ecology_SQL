CREATE TABLE integrated_circuits (
    region TEXT,
    year INTEGER,
    quantity NUMERIC);

select * from integrated_circuits_import;

update integrated_circuits_import 
set 地区 = TRIM(地区);

select * from integrated_circuits;

INSERT INTO integrated_circuits (region, year, quantity)
select
reg.name_region AS region,
v.year,
v.quantity
FROM integrated_circuits_import r
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

select * from integrated_circuits;

ALTER TABLE integrated_circuits
RENAME COLUMN quantity TO integrated_circuits_output;

COMMENT ON COLUMN integrated_circuits.integrated_circuits_output
IS 'Производство интегральных микросхем. Единица измерения: 10 000 штук (万块). Источник: National Bureau of Statistics of China.';

select count(*)
from integrated_circuits
where integrated_circuits_output is null;

select count(*)
from integrated_circuits
where integrated_circuits_output = 0;


