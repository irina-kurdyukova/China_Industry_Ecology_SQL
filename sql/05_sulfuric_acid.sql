CREATE TABLE sulfuric_acid (
    region TEXT,
    year INTEGER,
    quantity NUMERIC);

select * from sulfuric_acid_import;

update sulfuric_acid_import 
set 地区 = TRIM(地区);

select * from sulfuric_acid;

INSERT INTO sulfuric_acid (region, year, quantity)
select
reg.name_region AS region,
v.year,
v.quantity
FROM sulfuric_acid_import r
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

select * from sulfuric_acid;

ALTER TABLE sulfuric_acid
RENAME COLUMN quantity TO sulfuric_acid_output;


COMMENT ON COLUMN sulfuric_acid.sulfuric_acid_output
IS 'Производство серной кислоты в пересчёте на 100%-ную кислоту. Единица измерения: 10 000 тонн (万吨). Источник: National Bureau of Statistics of China.';

select count(*)
from sulfuric_acid
where sulfuric_acid_output is null;

select count(*)
from sulfuric_acid
where sulfuric_acid_output = 0;
