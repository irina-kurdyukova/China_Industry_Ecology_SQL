SELECT table_name
FROM information_schema.tables 
WHERE table_schema = 'public' AND table_type = 'BASE TABLE'
ORDER BY table_name;

select table_name
from information_schema.tables
where table_schema = 'public'
and table_type = 'BASE TABLE'
and table_name not like '%_import'
and table_name not like '%_raw'
order by table_name;

select
region,
year,
count(*)
from automobiles a 
group by 1,2
having count(*) > 1;

select 
'automobiles' as table_name,
count(*)
from automobiles

union all
select
'ammonia_nitrogen' as table_name,
count(*)
from ammonia_nitrogen

union all 
select 
'cement' as table_name,
count(*)
from cement

union all 
select 
'cod_emissions' as table_name,
count(*)
from cod_emissions

union all 
select 
'coke' as table_name,
count(*)
from coke

union all 
select
'cpi' as table_name,
count(*)
from cpi

union all 
select
'crude_oil' as table_name,
count(*)
from crude_oil

union all 
select 
'crude_steel' as table_name,
count(*)
from crude_steel

union all 
select 
'disposable_income_rural' as table_name,
count(*)
from disposable_income_rural

union all 
select
'disposable_income_total' as table_name,
count(*)
from disposable_income_total

union all 
select
'disposable_income_urban' as table_name,
count(*)
from disposable_income_urban

union all 
select 
'electricity_total' as table_name,
count(*)
from electricity_total

union all 
select
'ethylene' as table_name,
count(*)
from ethylene

union all 
select
'flat_glass' as table_name,
count(*)
from flat_glass

union all 
select
'hydropower' as table_name,
count(*)
from hydropower

union all 
select 
'industrial_water_use' as table_name,
count(*)
from industrial_water_use

union all 
select 
'integrated_circuits' as table_name,
count(*)
from integrated_circuits

union all 
select 
'mobile_phones' as table_name,
count(*)
from mobile_phones

union all 
select
'natural_gas' as table_name,
count(*)
from natural_gas

union all 
select 
'nox_emissions' as table_name,
count(*)
from nox_emissions

union all 
select 
'paper_board' as table_name,
count(*)
from paper_board

union all 
select 
'particulate_emissions' as table_name,
count(*)
from particulate_emissions

union all 
select
'pig_iron' as table_name,
count(*)
from pig_iron

union all 
select 
'primary_plastics' as table_name,
count(*)
from primary_plastics

union all 
select 
'region' as table_name,
count(*)
from region

union all 
select 
'so2_emissions' as table_name,
count(*)
from so2_emissions

union all 
select
'sulfuric_acid' as table_name,
count(*)
from sulfuric_acid

union all 
select
'total_nitrogen' as table_name,
count(*)
from total_nitrogen

union all 
select
'total_phosphorus' as table_name,
count(*)
from total_phosphorus

union all 
select 
'wastewater_treatment_capacity' as table_name,
count(*)
from wastewater_treatment_capacity;


select 
*
from particulate_emissions pe 
order by 1,2;

--объединение таблиц

CREATE view china_analysis as
select 
a.region,
a.year,
automobiles_output,
ammonia_nitrogen_output,
cement_output,
cod_emissions_output,
coke_output,
crude_oil_output,
crude_steel_output,
electricity_total_output,
ethylene_output,
flat_glass_output,
hydropower_output,
industrial_water_use_output,
integrated_circuits_output,
mobile_phones_output,
natural_gas_output,
nox_emissions_output,
disposable_income_rural_output,
disposable_income_total_output,
disposable_income_urban_output,
cpi_index,
paper_board_output,
particulate_emissions_output,
pig_iron_output,
primary_plastics_output,
so2_emissions_output,
sulfuric_acid_output,
total_nitrogen_output,
total_phosphorus_output,
wastewater_treatment_capacity_output
from automobiles a 
    left join ammonia_nitrogen an on a.region=an.region and a.year=an.year
    left join cement c on a.region=c.region and a.year=c.year
    left join cod_emissions ce on a.region=ce.region and a.year=ce.year
    left join coke co on a.region=co.region and a.year=co.year
    left join cpi cp on a.region=cp.region and a.year=cp.year
    left join crude_oil cro on a.region=cro.region and a.year=cro.year
    left join crude_steel cs on a.region=cs.region and a.year=cs.year
    left join disposable_income_rural dir on a.region=dir.region and a.year=dir.year
    left join disposable_income_total dit on a.region=dit.region and a.year=dit.year
    left join disposable_income_urban diu on a.region=diu.region and a.year=diu.year
    left join electricity_total e on a.region=e.region and a.year=e.year
    left join ethylene et on a.region=et.region and a.year=et.year
    left join flat_glass f on a.region=f.region and a.year=f.year
    left join hydropower g on a.region=g.region and a.year=g.year
    left join industrial_water_use iw on a.region=iw.region and a.year=iw.year
    left join integrated_circuits i on a.region=i.region and a.year=i.year
    left join mobile_phones mf on a.region=mf.region and a.year=mf.year
    left join natural_gas ng on a.region=ng.region and a.year=ng.year
    left join nox_emissions ne on a.region=ne.region and a.year=ne.year
    left join paper_board pb on a.region=pb.region and a.year=pb.year
    left join particulate_emissions pem on a.region=pem.region and a.year=pem.year
    left join pig_iron pir on a.region=pir.region and a.year=pir.year
    left join primary_plastics pp on a.region=pp.region and a.year=pp.year
    left join so2_emissions so on a.region=so.region and a.year=so.year
    left join sulfuric_acid sa on a.region=sa.region and a.year=sa.year
    left join total_nitrogen tn on a.region=tn.region and a.year=tn.year
    left join total_phosphorus tp on a.region=tp.region and a.year=tp.year
    left join wastewater_treatment_capacity w on a.region=w.region and a.year=w.year;

select 
count(*)
from china_analysis;

select 
region,
year,
round(crude_steel_output::numeric,2)
from china_analysis ca
order by region,year;

select 
region,
round(steel_2011::numeric,2),
round(steel_2024::numeric,2),
round((steel_2024::numeric -steel_2011::numeric) * 100.0 / steel_2011::numeric,2) as change_prct,
round(steel_2024::numeric - steel_2011::numeric,2) as change_tn
from
(select
region,
MAX(CASE
    WHEN year = 2011 THEN crude_steel_output
END) AS steel_2011,
MAX(CASE
    WHEN year = 2024 THEN crude_steel_output
END) AS steel_2024
from china_analysis ca
group by region)t
order by change_tn DESC;

select 
*
from region






























