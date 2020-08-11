-- cross join
SELECT emp.ename,dept.dname FROM emp,dept;
SELECT ename,dname FROM emp CROSS JOIN dept;

-- Equal join
SELECT emp.ename,emp.deptno,dept.dname 
  FROM emp,dept
 WHERE emp.deptno = dept.deptno;
 
 SELECT emp.ename,emp.deptno,dept.dname 
  FROM emp JOIN dept
    ON emp.deptno = dept.deptno; -- 可用不同表格名稱
    
SELECT emp.ename,emp.deptno,dept.dname 
  FROM emp JOIN dept
 USING (deptno); -- 表格名稱一樣才能用，與上面不同
 
SELECT emp.ename,emp.deptno,dept.dname 
  FROM emp NATURAL JOIN dept ;
    
SELECT ename,emp.deptno,dname 
  FROM emp JOIN dept
    ON emp.deptno = dept.deptno;
    
SELECT emp.ename,emp.deptno,dept.dname 
  FROM emp,dept
 WHERE emp.deptno = dept.deptno
   AND title='manager';
    
SELECT e.ename,e.deptno,d.dname
  FROM emp e,dept d
 WHERE e.deptno=d.deptno;
 
SELECT e.ename,d.deptno,c.cname 
  FROM emp e,dept d, city c
 WHERE e.deptno = d.deptno
   AND d.cityno=c.cityno;
   
SELECT e.ename,d.deptno,c.cname 
  FROM emp e JOIN dept d ON e.deptno=d.deptno
			 JOIN city c ON d.cityno=c.cityno;
             
-- Non Equal join
SELECT e.ename,e.salary,g.level
  FROM emp e,grade g
 WHERE e.salary BETWEEN g.lowest AND g.highest;

SELECT e.ename,d.dname,e.salary,g.level
  FROM emp e,dept d,grade g
 WHERE e.deptno=d.deptno
   AND e.salary BETWEEN g.lowest AND g.highest; 
   
SELECT e.ename,d.dname,e.salary,g.level
  FROM emp e JOIN dept d 
    ON e.deptno=d.deptno 
  JOIN grade g
	ON e.deptno=d.deptno
   AND e.salary BETWEEN g.lowest AND g.highest;
   
-- outer join
SELECT e.ename,e.deptno,d.dname
  FROM emp e LEFT JOIN dept d
    ON e.deptno=d.deptno;
    
SELECT e.ename,d.deptno,d.dname
  FROM emp e RIGHT JOIN dept d
    ON e.deptno=d.deptno;    
    
SELECT e.ename,e.deptno,d.dname
  FROM emp e LEFT JOIN dept d
    ON e.deptno=d.deptno
UNION    
SELECT e.ename,d.deptno,d.dname
  FROM emp e RIGHT JOIN dept d
    ON e.deptno=d.deptno;     

SELECT worker.ename'worker name',
	   manager.ename'manager name'
  FROM emp worker,emp manager
 WHERE worker.mgrno=manager.empno; 