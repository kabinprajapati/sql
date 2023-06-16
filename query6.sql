-- Query 6:

-- From the students table, write a SQL query to interchange the adjacent student names.

Note: If there are no adjacent student then the student name should stay the same.

--Table Structure:

drop table students;
CREATE TABLE students (
    id INT PRIMARY KEY,
    student_name VARCHAR(50) NOT NULL
);
insert into students values
(1, 'James'),
(2, 'Michael'),
(3, 'George'),
(4, 'Stewart'),
(5, 'Robin');

select * from students;

--Solution:

select id,student_name,
case when id%2 <> 0 then lead(student_name,1,student_name) over(order by id)
when id%2 = 0 then lag(student_name) over(order by id) end as new_student_name
from students;
