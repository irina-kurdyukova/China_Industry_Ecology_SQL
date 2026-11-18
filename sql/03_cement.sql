CREATE TABLE cement (
    region TEXT,
    year INTEGER,
    cement_output NUMERIC
);

INSERT INTO cement (region, year, cement_output)
SELECT
    reg.name_region AS region,
    v.year,
    v.quantity
FROM cement_import r
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
) AS v(year, quantity)
JOIN region reg
    ON reg.name_china = TRIM(r.地区);

SELECT *
FROM cement;

COMMENT ON COLUMN cement.cement_output
IS 'Производство цемента. Единица измерения: 10 000 тонн (万吨). Источник: National Bureau of Statistics of China.';

select * from cement_import;
select * from cement;

COMMENT ON COLUMN cement.cement_output
IS 'Производство цемента. Единица измерения: 10 000 тонн (万吨). Источник: National Bureau of Statistics of China.';
