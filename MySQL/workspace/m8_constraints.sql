CREATE TABLE emp1(
 -- column level constraint
	empno		decimal(4)		PRIMARY KEY,
    ename		varchar(30)		NOT NULL,
    hiredate	date			NOT NULL,
    email       varchar(30)     UNIQUE,
    deptno		decimal(3)		NOT NULL,
    salary		int,				
    title		varchar(20)		NOT NULL DEFAULT 'engineer',
-- table level constraint
    CONSTRAINT emp_deptno_fk FOREIGN KEY (deptno)
         REFERENCES department(deptno)
);

INSERT INTO dept
   VALUES   (600,'Public Relations',DEFAULT);
UPDATE dept
SET    cityno=DEFAULT
WHERE  deptno=500;

INSERT INTO emp1
    VALUES  (1001,'李悟空','2013/11/10','lee@gmail.com',100,56000,'senior engineer');
-- Error Code: 1062. Duplicate entry '1009' for key 'PRIMARY'
INSERT INTO emp1
    VALUES  (1001,'李悟空','2013/11/10','lee@gmail.com',100,56000,'senior engineer');

-- Error Code: 1062. Duplicate entry 'lee@gmail.com' for key 'email'
INSERT INTO emp1
    VALUES  (1002,'李悟空','2013/11/10','lee@gmail.com',100,56000,'senior engineer');

-- 可執行 1 row(s) affected
INSERT INTO emp1
    VALUES  (1002,'李悟空','2013/11/10','lee1@gmail.com',200,56000,'senior engineer');

-- Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`db01`.`emp1`, CONSTRAINT `emp_deptno_fk` FOREIGN KEY (`deptno`) REFERENCES `department` (`deptno`))
INSERT INTO emp1
    VALUES  (1003,'李大文','2013/11/10','lee2@gmail.com',600,56000,'senior engineer');

-- Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`db01`.`emp1`, CONSTRAINT `emp_deptno_fk` FOREIGN KEY (`deptno`) REFERENCES `department` (`deptno`))
update emp1 set deptno=600 where empno=1001;

-- Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint fails (`db01`.`emp1`, CONSTRAINT `emp_deptno_fk` FOREIGN KEY (`deptno`) REFERENCES `department` (`deptno`))
delete from department where deptno =100;

ALTER TABLE `db01`.`emp1` 
DROP FOREIGN KEY `emp_deptno_fk`;
ALTER TABLE `db01`.`emp1` 
ADD CONSTRAINT `emp_deptno_fk`
  FOREIGN KEY (`deptno`)
  REFERENCES `db01`.`department` (`deptno`)
  ON UPDATE CASCADE;

update department set deptno=101 where deptno=100;

ALTER TABLE `db01`.`emp1` 
DROP FOREIGN KEY `emp_deptno_fk`;
ALTER TABLE `db01`.`emp1` 
ADD CONSTRAINT `emp_deptno_fk`
  FOREIGN KEY (`deptno`)
  REFERENCES `db01`.`department` (`deptno`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;
  
delete from department  where deptno=101;


-- AUTO increment
CREATE TABLE mem(
	memno		int		PRIMARY KEY AUTO_INCREMENT,
    mname		varchar(30)		NOT NULL
    )AUTO_INCREMENT=100;
    
INSERT INTO mem (mname)
      VALUES ('David HO'),('Maria Wang'),('Pam Pan'),('Tina Lee'),('Jean Tsao');

SELECT LAST_INSERT_ID();

INSERT INTO mem(mname) VALUES ('David Ho');

DELETE FROM mem WHERE memno=110;

TRUNCATE TABLE mem;
DROP TABLE mem;