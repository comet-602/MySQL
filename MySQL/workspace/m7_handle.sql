INSERT INTO department(deptno,dname,mgrno)
    VALUES  (400,'Research',1001);
INSERT INTO department
    VALUES  (500,'Personnel',1001);
INSERT INTO department(deptno,dname)
    VALUES  (601,'IT');
    INSERT INTO department
    VALUES  (602,'IT',NULL);
INSERT INTO department(deptno,dname,mgrno)
    VALUES  (603,'HDR',1003),(604,'STK',NULL);
    
INSERT INTO employee
    VALUES  (1009,'孫悟空','2013/11/10',56000,100,'senior engineer');
INSERT INTO employee
    VALUES  (1010,'李大文',CURDATE(),89000,200,'manager');

create table emp_copy like employee;
INSERT INTO emp_copy SELECT * FROM employee;  
  
create table emp_copy1 like employee;
alter table emp_copy1 drop title;
alter table emp_copy1 change empno empid decimal(4);

INSERT INTO emp_copy1 (empid,ename,deptno,hiredate,salary)
    SELECT  empno,ename,deptno,hiredate,salary
	FROM    employee
	WHERE   title NOT LIKE '%SA%';
    
-- update
UPDATE emp_copy
   SET salary=45000
 WHERE empno=1008;
 
 SHOW variables like'%safe_updates%';
 SET SQL_SAFE_UPDATES=0;
 SET SQL_SAFE_UPDATES=1;
UPDATE emp_copy1
   SET hiredate=CURDATE();

-- Error Code: 1093. You can't specify target table 'emp_copy' for update in FROM clause
UPDATE emp_copy
   SET salary=(SELECT salary
				FROM  emp_copy
			    WHERE empno=1006)
WHERE  empno = 1007;

UPDATE emp_copy
   SET salary=(SELECT salary
				FROM  (SELECT * FROM emp_copy)e
			    WHERE empno=1006)
WHERE  empno = 1007;

UPDATE emp_copy
   SET deptno=(SELECT deptno
                 FROM employee
				WHERE empno=1003)
  WHERE salary=(SELECT salary
                 FROM  employee
				WHERE empno=1001);

-- delete ---------------------
DELETE FROM emp_copy WHERE empno=1007;  -- 1
DELETE FROM emp_copy1; -- 0
DELETE FROM department
 WHERE      deptno BETWEEN 601 AND 604;
DELETE FROM emp_copy
 WHERE deptno = (SELECT deptno
				 FROM department
                 WHERE dname='Accounting');
  