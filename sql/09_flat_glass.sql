CREATE TABLE flat_glass (
    region TEXT,
    year INTEGER,
    quantity NUMERIC);

select * from flat_glass_import;

update flat_glass_import 
set 地区 = TRIM(地区);

INSERT INTO flat_glass (region, year, quantity)
select
reg.name_region AS region,
v.year,
v.quantity
FROM flat_glass_import r
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

select * from flat_glass;

ALTER TABLE flat_glass
RENAME COLUMN quantity TO flat_glass_output;

COMMENT ON COLUMN flat_glass.flat_glass_output
IS 'Производство листового стекла. Единица измерения: 10 000 весовых ящиков (万重量箱). Источник: National Bureau of Statistics of China.';

select count(*)
from flat_glass
where flat_glass_output is null;

select count(*)
from flat_glass
where flat_glass_output = 0;


