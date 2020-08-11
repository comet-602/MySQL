select name,expiredate,catalog,price,placeid FROM food;
-- 1題
select name,expiredate,price 
  FROM food
  WHERE price > ALL
                (select price
                   from food
                   where name='鳳梨酥'); 
                   
-- 2題                   
select name,catalog,expiredate,price 
  FROM food
  WHERE price < ALL
                (select price
                   from food
                   where name='曲奇餅乾')
  AND  catalog = '點心'; 
  
-- 3題  
select name,expiredate,price 
  FROM food
  WHERE expiredate IN
                (select expiredate
                   from food
                   where name='鳳梨酥'); 
                   
-- 4題(平均價格為331.54)                   
select name,expiredate,price 
  FROM food
  WHERE price > (select AVG(price)
                   from food);                    

-- 5題(平均價格為331.54)
select name,expiredate,price 
  FROM food
  WHERE price < (select AVG(price)
                   from food)
    AND placeid = 'TW';      

-- 6題
select name,expiredate,price 
  FROM food
  WHERE price < ALL
                (select price
                   from food
                   where name='仙貝')
    AND catalog IN (select catalog
                   from food
                   where name='仙貝');      

-- 7題
select name,expiredate,placeid,price 
  FROM food
  where placeid IN (select placeid
                   from food
                   where name='仙貝')
  AND   DATEDIFF(expiredate,curdate())<180; 
  
-- 8題  
select name,expiredate,price,placeid
  FROM food f
 WHERE price IN (select MIN(price)
                   from food
			   GROUP BY placeid
               HAVING placeid=f.placeid);  

select name,expiredate,price,placeid
  FROM food f
 WHERE price IN (select MIN(price)
                   from food
                  where placeid=f.placeid);  

             
-- 9題
select name,price,catalog
  FROM food f
 WHERE price IN (select MAX(price)
                   from food
			   GROUP BY catalog
               HAVING catalog=f.catalog);  

-- 10題               
select name,price,catalog
  FROM food               
  WHERE catalog != '點心' 
    AND price > ALL (select price 
					 from   food 
                     where catalog = '點心')
ORDER BY price DESC;

-- 11題
select name,price,catalog,placeid
  FROM food f
 WHERE price IN (select MAX(price)
                   from food
			   GROUP BY placeid
               HAVING placeid=f.placeid);                