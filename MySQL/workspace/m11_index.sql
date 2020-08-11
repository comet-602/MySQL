CREATE INDEX ename_idx ON employee(ename);
SHOW INDEX FROM employee;


ALTER TABLE employee DROP INDEX ename_idx;
DROP INDEX ename_idx ON employee;