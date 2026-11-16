CREATE TABLE mobile_dataset (
    mobile_id        SERIAL PRIMARY KEY,
    company_name     VARCHAR(50),
    model_name       VARCHAR(100),
    weight_g         INT,
    ram_gb           INT,
    front_camera_mp  INT,
    back_camera      VARCHAR(100),
    processor        VARCHAR(60),
    battery_mah      INT,
    screen_inches    NUMERIC(4,2),
    price_pakistan   INT,
    price_india      INT,
    price_china      INT,
    price_usa        INT,
    price_dubai      INT,
    launched_year    INT
);
select * from mobile_dataset;
--(1).Which are the top 10 mobile brands by number of models?
select company_name,count(*) as total_models
from mobile_dataset
group by company_name
order by total_models desc;
--(2). What is the average launch price of mobile phones in India by year?
select launched_year,round(avg(price_india_inr),2) as averge_price_in_india_rs
from mobile_dataset
group by launched_year
order by launched_year desc;
--(3). Which mobile company offers the highest RAM capacity?
select company_name,max(ram_gb) as maximum_ram_gb
from mobile_dataset
group by company_name
order by maximum_ram_gb desc
limit 10;
--(4).Which companies have the largest average screen size?
select company_name,round(avg(screen_inches),2) as maximum_screen_size_inches
from mobile_dataset
group by company_name
order by maximum_screen_size_inches desc
limit 5;
--(5).Which mobile brands have more than 10 models and an average RAM greater than 6GB?
select company_name,
count(model_name) as total_model,
round(avg(ram_gb),2) as avg_ram_gb
from mobile_dataset
group by company_name
having  count(model_name)>10 and avg(ram_gb)>6
order by total_model,avg_ram_gb;
--(6) Top 5 Find mobile phones whose Indian price is higher than the overall market average.
select company_name,model_name,price_india_inr
from mobile_dataset
where price_india_inr > (select avg(price_india_inr)
from mobile_dataset)
order by price_india_inr desc
limit 5;
/*(7) Which are the Top 10 mobile phones with the highest battery capacity, and how does their 
battery capacity compare with the market average?*/
with market_anylisis as (select company_name,model_name,battery_mah,
avg(battery_mah) over() as market_avg_battery_mah
from mobile_dataset)
select  company_name,model_name,battery_mah,
round(market_avg_battery_mah,2)
from market_anylisis
where battery_mah >= market_avg_battery_mah
order by battery_mah,market_avg_battery_mah desc
limit 10;
