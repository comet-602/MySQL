select ename,salary
from employee
where salary>(select salary
              from employee
              where ename='潘麗珍');
              
select ename,title,salary
from employee
where title=(select title
              from employee
              where empno=1002)
and salary>(select salary
              from employee
              where empno=1005);

select deptno,MIN(salary)
from employee
Group by deptno
having MIN(salary)>(select min(salary)
              from employee
              where deptno=200);         
              
select deptno,MIN(salary)
from employee;

SELECT ename,title,salary,
       ROUND(salary*100/(select SUM(salary)
                         FROM   employee
						 WHERE  deptno=100),1)'Percentage'
FROM employee
WHERE deptno=100;

SELECT ename,title,salary,
       ROUND(salary*100/t.total,1)'Percentage'
FROM employee,(select SUM(salary)'total'
                         FROM   employee
						 WHERE  deptno=100) t
WHERE deptno=100;

-- multiple Row Subquery ------------------------------------------
              
select ename,title,salary
from employee
WHERE salary < ANY
			(select salary
              from employee
              where title='senior engineer')
AND title <>'senior engineer';

select ename,title,salary
from employee
WHERE salary <(select MAX(salary)
              from employee
              where title='senior engineer')
AND title <>'senior engineer';

select ename,title,salary
from employee
WHERE salary < ALL
			(select salary
              from employee
              where title='senior engineer')
AND title <>'senior engineer';

select ename,title,salary
from employee
WHERE salary < (select MIN(salary)
              from employee
              where title='senior engineer')
AND title <>'senior engineer';


select ename
from emp
WHERE empno IN 
			(select DISTINCT mgrno
              from emp);
              
-- 0 row(s) returned---------------------------
select ename
from emp
WHERE empno NOT IN 
			(select DISTINCT mgrno
              from emp);

-- 6 row(s) returned
select ename
from emp
WHERE empno NOT IN 
			(select DISTINCT mgrno
              from emp
              WHERE mgrno IS NOT NULL);

-- correlated subquery
SELECT e.ename,e.title,e.salary,
       ROUND(salary*100/(select SUM(salary)
                         FROM   employee
						 WHERE  deptno=e.deptno),1)'Percentage'
FROM employee e
WHERE e.deptno=100;

SELECT e.ename,e.title,e.salary,
       ROUND(e.salary*100/(select SUM(e.salary)
                         FROM   employee e
						 WHERE  e.deptno),1)'Percentage'
FROM employee e
WHERE e.deptno=100;

select ename,salary,deptno
from employee e
WHERE salary IN 
             (select MIN(salary)
              FROM   employee
              GROUP BY deptno
              HAVING deptno=e.deptno);
              
select ename,salary,deptno
from employee e
WHERE salary =(select MIN(salary)
                 FROM   employee
                 WHERE deptno=e.deptno);              

-- create table with query
CREATE TABLE emp100 AS
  SELECT empno,ename,salary*12 'annualSalary', hiredate
    FROM  employee
   WHERE deptno = 100;

select * from employee;
select * from emp100;