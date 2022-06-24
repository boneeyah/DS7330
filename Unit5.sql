use company;
#find the names, street address, and cities of residence of all employees who work for FBC and earm more than 10,000 per anum
select person_name, street, city, company_name, salary
from employee join works using(person_name)
where salary>10000;

#find the names of all employees in this datatabase who live in the same city as the company for which they work
select person_name, company_name,employee.city, company.city
from employee join works using (person_name) join company using (company_name)
where company.city = employee.city;

select person_name, employee.city, company_name, company.city
from employee left join works using(person_name) left join company using(company_name);

#find the names of all employees in this database who do not work for first bank corporation
select person_name,company_name
from employee join works using(person_name)
where company_name not in(select company_name where company_name = 'FBC' or company_name = 'FBC.');