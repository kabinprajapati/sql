-- can you pull a lisst of first and last names of all customers and level them as either store1 active, store 1 inactive, store 2 active, store 2 inactive

select first_name, last_name,
case
	when store_id = 1 and active =1 then 'store 1 active'
	when store_id = 1 and active =0 then 'store 1 inactive'
	when store_id = 2 and active =1 then 'store 2 active'
	when store_id = 2 and active =0 then 'store 2 inactive'
	else 'check again'
end as store_status
from customer 