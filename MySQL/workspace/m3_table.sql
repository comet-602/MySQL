CREATE TABLE employee(
	empno		decimal(4)		PRIMARY KEY,  -- (column-level constraint)
    ename		varchar(30)		NOT NULL,
    hiredate	date			NOT NULL,
    salary		int				NOT NULL,
    deptno		decimal(3)		NOT NULL,
    title		varchar(20)		NOT NULL
); -- 使用指令建立表格

CREATE TABLE `db01`.`department` (
  `deptno` DECIMAL(3) NOT NULL,
  `dname` VARCHAR(30) NOT NULL,
  `mgrno` DECIMAL(4) NULL,
  PRIMARY KEY (`deptno`)); -- 建立表格 (Table-level constraint)
  
  show table status in db01;
  show tables;
  DESC employee; 
  DESC department;
  
  CREATE TABLE t (a int, b double, c char(10));
  DESC t; -- 查看欄位設計
  alter table t add d decimal(3); -- 新增d欄
  alter table t add e decimal(3); -- 新增e欄
  alter table t modify c varchar(10) first; -- 修改c欄型態順序在最前
  alter table t modify e varchar(10) after b; -- 修改e欄型態順序在b欄後
  alter table t change d e decimal(1); -- 更改d名稱至e
  alter table t drop d;
  alter table t rename t1;
  drop table t;
  

  