CREATE TABLE cod_emissions(
    region TEXT,
    year INTEGER,
    quantity NUMERIC);

select * from cod_emissions_import;

update cod_emissions_import 
set 地区 = TRIM(地区);

select * from cod_emissions;

INSERT INTO cod_emissions (region, year, quantity)
select
reg.name_region AS region,
v.year,
v.quantity
FROM cod_emissions_import r
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

select * from cod_emissions;

ALTER TABLE cod_emissions
RENAME COLUMN quantity TO cod_emissions_output;

COMMENT ON COLUMN cod_emissions.cod_emissions_output
IS 'Химическое потребление кислорода (ХПК, COD) в сбросах сточных вод. Единица измерения: 10 000 тонн (万吨). Источник: National Bureau of Statistics of China.';

select count(*)
from cod_emissions
where cod_emissions_output is null;

select count(*)
from cod_emissions
where cod_emissions_output = 0;


