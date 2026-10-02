use crm_project;

#Total Leads
select count(*) as Total_Leads
from crm_project.lead;

#Conversion Rate
select (count(case when Converted = 'TRUE' then 1 end) * 100) / count(*) as Conversion_Rate
from crm_project.lead;

#Expected Amount from Converted Leads
select sum(cast(replace(replace(`Expected Amount`, '$', ' '),',',' ')as decimal(10,2))) as Total_Expected_Amount
from crm_project.`opportunity table`;

#Converted Accounts
select sum(`# Converted Accounts`) as Converted_Accounts
from crm_project.lead;

#Converted Opportunities
select sum(`# Converted Opportunities`) as Converted_Opportunities
from crm_project.lead;

#Lead by Source
select `Lead Source`, count(*) as Leads_by_source
from crm_project.lead
group by `Lead Source`
order by count(*) desc;

#Lead by Industry
select `Industry`, count(*) as Lead_by_Industry
from crm_project.lead
group by `Industry`
order by count(*) desc;

#Lead by Status
select `Status`, count(*) as Lead_by_Status
from crm_project.lead
group by `Status`
order by count(*) desc;
