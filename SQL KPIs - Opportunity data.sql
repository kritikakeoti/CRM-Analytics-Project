Create Database CRM_analysis;
use crm_analysis;

select * from opportunity_table;

# total opportunity_ID
select count("opportunity ID") as Total_opppetunity from opportunity_table;

# Excpected amount 
Select 
    sum(cast(replace(replace(`Expected Amount`, '$', ''), ',', '') As decimal(18,2))) 
    as total_Expeceted_amount 
    from opportunity_table;


# Active opportunity
select count(*) as Active_oppertunity from opportunity_table
where Stage not in ('closed won','closed lost');


# Conversion ratio 
select (count(case when	Stage = 'closed won' then 1 end)*100.0)
/count(*)as Conversion_Ratio 
from opportunity_table;

# win Ratio
select(count(case when Stage = "closed won" then 1 end)*100.0)
/count(case when Stage in ("Closed won'","closed lost") then 1 end)As Win_Ratio 
from opportunity_table;

# loss Ratio
select(count(case when Stage = 'Closed lost' then 1 end)*100)
/Count(*) As Lost_Ratio
from Opportunity_table;
