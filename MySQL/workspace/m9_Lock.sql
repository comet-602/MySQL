BEGIN;
SELECT salary
FROM   employee
WHERE  empno=1001;

UPDATE employee
SET    salary=600001
WHERE  empno=1001;

commit;

SELECT salary
FROM   employee
WHERE  empno=1001;
