CREATE TABLE particulate_emissions (
    region TEXT,
    year INTEGER,
    quantity NUMERIC);

select * from particulate_emissions_import;

update particulate_emissions_import 
set 地区 = TRIM(地区);

select * from particulate_emissions;

INSERT INTO particulate_emissions (region, year, quantity)
select
reg.name_region AS region,
v.year,
v.quantity
FROM particulate_emissions_import r
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
(2016, r."2016年")
) v(year, quantity)
    join region reg on reg.name_china=r.地区;

select * from particulate_emissions;

ALTER TABLE particulate_emissions
RENAME COLUMN quantity TO particulate_emissions_output;

COMMENT ON COLUMN particulate_emissions.particulate_emissions_output
IS 'Выбросы твёрдых частиц в атмосферу. Единица измерения: 10 000 тонн (万吨). Источник: National Bureau of Statistics of China.';

select count(*)
from particulate_emissions
where particulate_emissions_output is null;

select count(*)
from particulate_emissions
where particulate_emissions_output = 0;


