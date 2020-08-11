SELECT * FROM food; 
SELECT name,expiredate,price FROM food; 
SELECT name'食物',expiredate'到期日',price'價格' FROM food; 
SELECT DISTINCT catalog FROM food; 
SELECT CONCAT (name,' ',catalog)'Food name&catalog' FROM food; 
SELECT name,price FROM food WHERE price>400; 
SELECT name,price FROM food WHERE price BETWEEN 250 AND 530; 
SELECT name,price FROM food WHERE price NOT BETWEEN 250 AND 530; 
SELECT name,catalog,price FROM food WHERE catalog='點心';
SELECT name,catalog,price FROM food WHERE catalog='點心' OR catalog='飲料';
SELECT name,placeid,price FROM food WHERE placeid='TW' OR placeid='JP';
SELECT name,expiredate,price FROM food WHERE name LIKE '%油%';
SELECT name,price,expiredate FROM food WHERE expiredate<'2020/12/31';
SELECT name,price,expiredate FROM food WHERE expiredate<'2021/06/30';
SELECT name,price,expiredate FROM food WHERE expiredate BETWEEN now() AND now()+interval 6 month;
SELECT name,expiredate,price FROM food ORDER BY price DESC;
SELECT name,expiredate,price FROM food ORDER BY price DESC LIMIT 3;
SELECT name,price FROM food WHERE catalog='點心' AND price<=250 ORDER BY price ASC;
SELECT name,price,round(price*1.05) 'New Price' FROM food;
SELECT name,price,round(price*1.05) 'New Price',round(price*1.05)-price 'Increase' FROM food;
SELECT name,price,
  CASE
   WHEN price <=250 THEN floor(price*1.08)
   WHEN price BETWEEN 251 AND 500 THEN floor(price*1.05)
   WHEN price >=501 THEN floor(price*1.03)
  END 'New Price'
FROM food; -- 21題

SELECT name,catalog,DATEDIFF(expiredate,curdate()),
  case
       WHEN DATEDIFF(expiredate,curdate())>0 THEN '未過期'
  END 'Days of expired',
  case
       WHEN DATEDIFF(expiredate,curdate())<0 THEN '已過期'
  END 'expired or not'
FROM food; -- 22題

SELECT name,catalog,DATEDIFF(expiredate,curdate()),
  case
       WHEN DATEDIFF(expiredate,curdate())>0 THEN '未過期'
  END 'Days of expired',
  case
       WHEN DATEDIFF(expiredate,curdate())<0 THEN '已過期'
  END 'expired or not'
FROM food
ORDER BY expiredate; -- 23題

SELECT round(MAX(price))'Max',round(MIN(price))'Min',round(SUM(price))'Sum',round(AVG(price))'Avg'
FROM food; -- 24題

SELECT catalog,round(MAX(price))'Max',round(MIN(price))'Min',round(SUM(price))'Sum',round(AVG(price))'Avg'
FROM food
GROUP BY catalog; -- 25題

SELECT catalog,round(MAX(price))'Max',round(MIN(price))'Min',round(SUM(price))'Sum',round(AVG(price))'Avg'
FROM food
GROUP BY catalog
HAVING AVG(price)>300
ORDER BY AVG(price) DESC; -- 26題

select catalog,count(*) FROM food GROUP BY catalog; -- 27題
select placeid,catalog,count(*) FROM food GROUP BY placeid,catalog; -- 28題