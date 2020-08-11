select * from employee; -- 取得所有欄位employee
select empno,salary from employee; -- 取得部分欄位
select * from department; -- 取得所有欄位
select 17/4,17 div 4,17%4,17*null; -- 算數


-- Alias---
select ename as '員工姓名',salary*12 as'年薪' from employee;
select ename 'Employee Name',salary*12 'Annual Salary' from employee;

select substring(ename,1,1)'姓氏' FROM employee;
select substring(ename,2)'姓氏' FROM employee;
select substring('David Wang',1,5);
select substring('David Wang',7);
select substring('David Wang',-4);
select substring('David Wang',-4,2);
select concat(ename,'is a',title)'員工'FROM employee;
select length('我是一個student')'length';
select char_length('我是一個student')'length';

select sysdate();
select sysdate()+interval 5 day;
select sysdate(),sleep(2),sysdate();
select NOW(),sleep(2),NOW();
select curdate(),curtime();
select curdate() 'DATE',curtime() 'TIME'; -- 改變欄位名稱
select adddate(curdate(),5);
select adddate(curdate(),interval 5 day);


select empno,ename,hiredate,now(),
	DATEDIFF(NOW(),hiredate) div 365 'year',
    DATEDIFF(NOW(),hiredate) / 365 'year',
    round(DATEDIFF(NOW(),hiredate) / 365) 'year1', -- 四捨五入
    round(DATEDIFF(NOW(),hiredate) / 365 ,1) 'year2', -- 四捨五入,取小數第一位
	round(DATEDIFF(NOW(),hiredate) / 365 ,1)*12-(DATEDIFF(NOW(),hiredate) div 365)*12'month',
    (DATEDIFF(NOW(),hiredate) % 365) / 30.5 'month'
FROM employee;

select round(12593.567,-1)'num';






-- 條件運算
SELECT empno,ename,salary,
salary*IF(salary>=50000,2,1.5)'bonus'
FROM employee;

SELECT empno,ename,salary,
	CASE
		WHEN salary>100000 THEN 'A'
		WHEN salary BETWEEN 70000 AND 10000 THEN 'B'
		WHEN salary BETWEEN 50000 AND 69999 THEN 'C'
		WHEN salary BETWEEN 30000 AND 49999 THEN 'D'
		ELSE 'E'
	END 'Grade'
FROM employee;

SELECT DISTINCT deptno FROM employee;
SELECT  deptno FROM employee;
SELECT DISTINCT deptno,title FROM employee;

-- WHERE CLAUSE
SELECT * FROM employee WHERE deptno=100;
SELECT * FROM employee WHERE title='engineer';
SELECT * FROM employee WHERE hiredate>'2007/07/06';
SELECT * FROM employee WHERE salary>=50000;
SELECT * FROM employee WHERE salary BETWEEN 30000 AND 40000;
SELECT * FROM employee WHERE title IN ('manager','engineer');
SELECT * FROM department WHERE mgrno IS NULL;

-- LIKE 用法
SELECT * FROM employee WHERE ename LIKE '林%';
SELECT * FROM employee WHERE ename LIKE '%生';
SELECT * FROM employee WHERE ename LIKE '%麗%';
SELECT * FROM employee WHERE ename LIKE '_麗%';
SELECT * FROM employee WHERE title LIKE '%SA\_%';
SELECT * FROM employee WHERE title LIKE '%SA#_%'ESCAPE'#';
SELECT * FROM employee ;
SELECT * FROM department;

-- AND OR 運算子
SELECT * FROM employee WHERE salary>=45000 AND ename LIKE '林%';
SELECT * FROM employee WHERE salary>=45000 OR ename LIKE '林%';
SELECT * FROM employee WHERE salary >= 30000 AND salary<=40000;
SELECT * FROM employee WHERE title ='manager' OR title='engineer';

-- NOT運算子
SELECT * FROM employee WHERE title NOT IN ('manager','engineer');
SELECT * FROM department WHERE mgrno IS NOT NULL;
SELECT * FROM employee WHERE salary NOT BETWEEN 30000 AND 40000;
SELECT * FROM employee WHERE ename NOT LIKE '林%';

-- order by 用法
SELECT * FROM employee ORDER BY hiredate DESC;
SELECT ename,deptno,salary FROM employee ORDER BY deptno,salary DESC;
SELECT ename,deptno,salary FROM employee ORDER BY deptno DESC,salary DESC;
SELECT ename,salary*12 'Annual' FROM employee ORDER BY Annual;
SELECT ename,salary*12 'Annual' FROM employee ORDER BY salary*12;
SELECT ename,deptno,salary FROM employee ORDER BY 3;
SELECT * FROM employee ORDER BY 3;

-- Limit 
SELECT *FROM employee LIMIT 3;
SELECT *FROM employee LIMIT 4,3;
SELECT *FROM employee ORDER BY hiredate LIMIT 3;
SELECT *FROM employee ORDER BY salary DESC LIMIT 3;

-- Aggregate Function
SELECT SUM(salary),AVG(salary),MAX(salary),MIN(salary) FROM employee;
SELECT COUNT(*) FROM employee;
SELECT COUNT(salary) FROM employee;
SELECT COUNT(deptno) FROM employee;
SELECT COUNT(DISTINCT deptno) FROM employee; -- 傳回不重複的值

-- GROUP BY
SELECT deptno,AVG(salary)'Average'FROM employee;
SELECT deptno,AVG(salary)'Average'FROM employee GROUP BY deptno;
SELECT deptno,AVG(salary)'Average'FROM employee GROUP BY deptno ORDER BY AVG(salary);
SELECT COUNT(*)'Number' FROM employee;
SELECT COUNT(deptno)'Number' FROM employee;
SELECT COUNT(DISTINCT deptno)'Number' FROM employee;
SELECT deptno,COUNT(deptno)'COUNT' FROM employee GROUP BY deptno;

-- HAVING
SELECT deptno,AVG(salary)'Average'
FROM   employee
GROUP BY deptno
HAVING AVG(salary)>50000;

SELECT title,SUM(salary)'Total'
FROM employee
WHERE title NOT LIKE '%SA%'
GROUP BY title
HAVING SUM(salary)>100000
ORDER BY SUM(salary)DESC;