select ID, name, dept_name
from student
order by name ASC;

select name, salary, dept_name
from instructor
where dept_name = 'Comp. Sci.' or dept_name = 'Elec. Eng.'
order by salary DESC;

select course_id, title
from course
where course_id like 'CS-1%';

select course_id, sec_id, semester,year, count(ID) as enrollment
from takes
group by course_id, sec_id
having count(ID)>=1;

select course_id, max(enrollment) as max, min(enrollment) as min
from (select course_id, sec_id, semester, year, count(ID) as enrollment
		from takes
        group by course_id, sec_id,semester,year) as sub
group by course_id;


create view faculty as
select ID, name, dept_name
from instructor;
select *
from faculty;

create view CSInstructors as
select *
from instructor
where dept_name = 'Comp. Sci.';
select *
from CSInstructors;