-- Query 9:
use git
-- Find the top 2 accounts with the maximum number of unique patients on a monthly basis.

-- Note: Prefer the account if with the least value in case of same number of unique patients

--  Structure:

drop table patient_logs
create table patient_logs
(
  account_id int,
  date date,
  patient_id int
)

insert into patient_logs values
(1, '2020-01-02', 100),
(1, '2020-01-27', 200),
(2, '2020-01-01', 300),
(2, '2020-01-21', 400),
(2, '2020-01-21', 300),
(2, '2020-01-01', 500),
(3, '2020-01-02', 400),
(1, '2020-03-04', 500),
(3, '2020-01-20', 450);

select * from patient_logs

select month from patient_logs
where day(month)='21'

-- Solution:
select a.month, a.account_id, a.no_of_unique_patients
from (
		select x.month, x.account_id, no_of_unique_patients,
			row_number() over (partition by x.month order by x.no_of_unique_patients desc) as rn
		from (
				select pl.month, pl.account_id, count(1) as no_of_unique_patients
				from (select distinct month(date) as month, account_id, patient_id
						from patient_logs) pl
				group by pl.month, pl.account_id) x
     ) a
where a.rn < 3;
