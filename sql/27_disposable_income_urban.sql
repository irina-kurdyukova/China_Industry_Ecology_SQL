create table disposable_income_urban (
region text, year integer, quantity numeric);

select 
*
from disposable_income_urban_import;

update disposable_income_urban_import
set 地区 = trim(地区);

select *
from disposable_income_urban;

insert into disposable_income_urban (region, year, quantity) 
select 
reg.name_region AS region,
v.year,
v.quantity
from disposable_income_urban_import r
 CROSS JOIN LATERAL(
 values
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
)v (year,quantity)
    join region reg on reg.name_china=r.地区;

select *
from disposable_income_urban;

alter table disposable_income_urban
rename column quantity to disposable_income_urban_output;

COMMENT ON COLUMN disposable_income_urban.disposable_income_urban_output
IS 'Среднедушевой располагаемый доход городского населения. Единица измерения: юаней на человека в год (元/чел.). Источник: National Bureau of Statistics of China.';

select count(*)
from disposable_income_urban
where disposable_income_urban_output is null;


select count(*)
from disposable_income_urban
where disposable_income_urban_output = 0;


