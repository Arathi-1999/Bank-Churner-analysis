
/* Retrieving the data from the database*/
select * from BankChurners

/* Distribution of attrited customers based on age range*/
select case when Customer_Age < 20 then '0-20'
when Customer_Age between 20 and 30 then '20-30' 
when Customer_Age between 30 and 40 then '30-40' 
when Customer_Age between 40 and 50 then '40-50'
when Customer_Age between 50 and 60 then '50-60'
when Customer_Age between 60 and 70 then '60-70'
when Customer_Age >70 then 'Above 70' end as age_range 
from BankChurners
where Attrition_Flag='Attrited customer'
--group by age_range
order by age_range;


/* Number of males and females in Existing and attrited customers */
select sum(if(Gender ='M',1,"null")) as male_existing_customers,
sum(if(Gender ='F',1,"null")) as female_existing_customers
from Bankchurners
where attrition_flag='Existing customer'
-- Male existing customers are 1553 whereas female existing customers are 2061

select sum(if(gender='M',1,"null")) as male_attrited_customers,
sum(if(gender='F',1,"null")) as female_attrited_customers
from bankchurners
where attrition_flag='Attrited_customers'
-- Male attrited customers are 350 whereas female attrited customers are 510 

/* Education level wise distributionof existing and attrited customers */
select education_level , count(*) from BankChurners where Attrition_Flag='existing customer'
group by Education_Level
order by count(*)

select education_level, count(*) from BankChurners
where Attrition_Flag='attrited customer'
group by Education_Level
order by count(*)

/* Those customers who are doctorate and post graduates have a very high attrition rate as compared to 
existing customers*/

/*Marital Status wise distribustion of existing and attrited customers*/
 select marital_status, count(*) from BankChurners
 where Attrition_Flag='existing customer'
 group by Marital_Status
 order by count(*)

 select marital_status , count(*) from BankChurners
 where Attrition_Flag='attrited customer'
 group by Marital_Status
 order by count(*)

 /* Distribution of attrited customers based on months on book */
select case when Customer_Age < 20 then '0-20'
when Customer_Age between 20 and 30 then '20-30' 
when Customer_Age between 30 and 40 then '30-40' 
when Customer_Age between 40 and 50 then '40-50'
when Customer_Age between 50 and 60 then '50-60'
when Customer_Age between 60 and 70 then '60-70'
when Customer_Age >70 then 'Above 70' end as month_on_book_range, count(*)
from BankChurners
where Attrition_Flag='Attrited customer'
group by month_on_book_range
order by count(*);
-- the number of customer is highest for the month_on_book_range of 30-40 years

select income_category, count(*)
from BankChurners
where Attrition_Flag='attrited customer'
group by Income_Category
order by count(*)

/* Distribution of attrited customers based on credit_limit */
select credit_limit, count(*)
from BankChurners 
where Attrition_Flag='attrited customer'
group by Credit_Limit
order by count(*)

select months_inactive_12_mon, count(*)
from BankChurners
where Attrition_Flag='attrited customer'
group by Months_Inactive_12_mon
order by count(*)

select avg_utilization_ratio, count(*)
from BankChurners
where Attrition_Flag='attrited customer'
group by Avg_Utilization_Ratio
order by count(*)
-- we can summarize that lesser the utilization on the customer's card the higher the chance og attrition