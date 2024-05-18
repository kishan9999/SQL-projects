
select * from assemble;

-- practice1
select name,
score,
power,
category,
subcategory,
sum(score) over(order by date) as total_score, --rolloing sum
sum(score) over(partition by category order by date) as rtotal_score2, --rolling sum for category
sum(score) over(partition by subcategory order by date) as rtotal_score3, --rolling sum for sub category
sum(score) over(partition by category, subcategory order by date) as rtotal_score4, --rolling sum for each group-subgroup division
sum(score) over(partition by category, subcategory) as total_score, --total sum for each group-subgroup division
AVG(power) over(partition by category, subcategory) as avgpower1, --sub group group avg
AVG(power) over(partition by category, subcategory order by date) as ravgpower2, -- rooling avg based on date
date
from assemble 
order by date;

-- practice 2
select name,
score,
category,
subcategory,
rank() over(partition by category, subcategory order by date2) as rank1,  --rank over date2
dense_rank() over(partition by category, subcategory order by date2) as dense_rank1, --rank over date2 but without skipping numbers 
row_number() over(partition by category, subcategory order by date2) as rownumber1, --number based on cluster
row_number() over(partition by category, subcategory order by date2, name ASC) as rownumber2, -- for cluster with priority in duplicate
row_number() over(partition by category, subcategory order by date2, name DESC) as rownumber3, -- with different priority
date,
date2
from assemble 
order by date;
