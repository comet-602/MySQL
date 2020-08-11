select * from department; 
delete from department where deptno between 601 and 606;

-- 外顯式交易(rollback)
START TRANSACTION;                                -- 開始交易
INSERT INTO department VALUES (601,'RD',1001);    -- 存入資料
INSERT INTO department VALUES (602,'IT',NULL);    -- 存入資料
select * from department;                         -- 2筆資料尚在暫存區
ROLLBACK;                                         -- 回復
select * from department;                         -- 2筆資料已從暫存區刪除

-- 外顯式交易(commit)
START TRANSACTION;                                -- 開始交易
INSERT INTO department VALUES (601,'RD',1001);    -- 存入資料
INSERT INTO department VALUES (602,'IT',NULL);    -- 存入資料
select * from department;                         -- 2筆資料尚在暫存區
COMMIT;                                           -- 確認
select * from department;                         -- 2筆資料已從暫存區輸入到資料庫


-- 隱含式交易
SET AutoCommit = 0;                               -- 開始交易
INSERT INTO department VALUES (603,'RD',1001);    -- 存入資料
INSERT INTO department VALUES (604,'IT',NULL);    -- 存入資料
select * from department;                         -- 2筆資料尚在暫存區
ROLLBACK;                                         -- 回復
select * from department;                         -- 2筆資料已從暫存區刪除
INSERT INTO department VALUES (605,'RD',1001);    -- 存入資料
INSERT INTO department VALUES (606,'IT',NULL);    -- 存入資料
select * from department;                         -- 2筆資料尚在暫存區
COMMIT;                                           -- 確認
select * from department;                         -- 2筆資料已從暫存區輸入到資料庫    
SET AutoCommit = 1;                               -- 結束交易   

-- SAVE POINT
BEGIN;                                              -- 開始交易
SELECT empno,ename,salary                           -- 查詢
 FROM  employee
 WHERE empno IN (1001,1002,1003);
UPDATE employee SET salary=60000 WHERE empno=1001;  -- 更新
SAVEPOINT A;                                        -- 設定儲存點A
UPDATE employee SET salary=40000 WHERE empno=1002;  -- 更新
SAVEPOINT B;                                        -- 設定儲存點B
UPDATE employee SET salary=80000 WHERE empno=1003;  -- 更新
ROLLBACK TO A;                                      -- 回復到儲存點A，A之後的暫存資料刪掉
COMMIT;                                             -- 確認
SELECT empno,ename,salary                           -- 查詢
 FROM  employee
 WHERE empno IN (1001,1002,1003);



