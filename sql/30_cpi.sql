create table cpi ( region text,year integer,quantity numeric);

select * from cpi_import;

update cpi_import
set 地区 = trim(地区);

select * from cpi;

insert into cpi(region,year,quantity)
select 
reg.name_region as region,
v.year,
v.quantity
from cpi_import r
    cross join lateral(
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

alter table cpi
rename column quantity to cpi_output;

alter table cpi
rename column cpi_output to cpi_index;


select * from cpi;

COMMENT ON column cpi.cpi_index
is 'Индекс потребительских цен (CPI). Предыдущий год = 100. Значение 102 означает рост цен на 2% за год. Источник: National Bureau of Statistics of China.'

select *
from cpi
where cpi_index is null;

select *
from cpi
where cpi_index = 0;

select count(*)
from cpi;



