SELECT name,id,placeid,price FROM food; -- 產地編號???
SELECT CONCAT (name,' ',placeid)'Food name&place' FROM food;
SELECT name,placeid,price FROM food WHERE placeid='TW';
SELECT name,placeid,price 
  FROM food 
 WHERE placeid='TW' OR placeid='JP' 
 ORDER BY price DESC; -- 4題
 SELECT name,placeid,price 
   FROM food 
   WHERE placeid='TW' 
   ORDER BY price DESC LIMIT 3; -- 5題
SELECT placeid,round(MAX(price))'Max',round(MIN(price))'Min',round(SUM(price))'Sum',round(AVG(price))'Avg'
FROM food GROUP BY placeid; -- 6題
SELECT placeid,catalog,count(*) FROM food GROUP BY placeid,catalog;