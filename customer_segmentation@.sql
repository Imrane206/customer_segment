-- customer segmentation project
USE sales;
DELETE 
from custumr_seg1
where row_numb>1;

SELECT* FROM custumr_seg1

-- Exploratory Data Analysis
-- max of spending score
select max(spending_score) as max_spending_score
from custumr_seg1

-- min spending score
select min(spending_score) as min_spending_score
from custumr_seg1

-- average of customer age 
select AVG(age) as average_age 
from custumr_seg1

--  average of annual income
select AVG(annual_income) as average_annual_income
from custumr_seg1

-- total annual income 
select ROUND(SUM(annual_income)/1000000000,2) as total_annual_income__in_billion
from custumr_seg1
-- count of records 
select count(customer_id) as countof_records from custumr_seg1
-- count of male and female
select count(customer_id) as numb_of_male
from
(select* from custumr_seg1
where gender='male') as t1

--  count of  female
-- select count(customer_id) as numb_of_female
from
-- (select* from custumr_seg1
-- where gender='female') as t1

-- customer segmentation @@@

-- customer segmentation by age


SELECT 
    CASE 
        WHEN age < 20 THEN 'Teen'
        WHEN age BETWEEN 20 AND 35 THEN 'Young Adult'
        WHEN age BETWEEN 36 AND 50 THEN 'Middle-Aged'
        WHEN age > 50 THEN 'Senior'
        ELSE 'Unknown'
    END AS age_group,
    COUNT(*) AS customer_count
from custumr_seg1
GROUP BY age_group
ORDER BY customer_count DESC;

-- customer segmentation by spending score
SELECT 
    CASE 
        WHEN spending_score < 30 THEN 'low_spender'
        WHEN spending_score  BETWEEN 30 AND 50 THEN 'Meduim_spender'
        WHEN spending_score  BETWEEN 51 AND 70 THEN 'spender'
        ELSE 'high_spender'
    END AS spender_group,
    COUNT(*) AS customer_count
from custumr_seg1
GROUP BY spender_group
ORDER BY customer_count DESC;

-- top 10 customer that have high annual income

select* from custumr_seg1
order by annual_income desc
limit 10;

-- low spending customer
select* from custumr_seg1
order by annual_income ASC 
limit 10;

-- top 3 spending customer in each age_group 
select
customer_id,
age,
annual_income,
CASE 
        WHEN age < 20 THEN 'Teen'
        WHEN age BETWEEN 20 AND 35 THEN 'Young Adult'
        WHEN age BETWEEN 36 AND 50 THEN 'Middle-Aged'
        WHEN age > 50 THEN 'Senior'
        ELSE 'Unknown'
    END AS age_group
from custumr_seg1






     
