INSERT INTO food
   VALUES ('GX099','可樂','2020/10/20','JP',60,'飲料');

INSERT INTO food (id,name,expiredate,placeid,price,catalog)
   VALUES ('GX099','可樂','2020/10/20','JP',60,'飲料');   
   
INSERT INTO place 
   VALUES ('EN','英國'),('CH','中國');
   
update food
   set price=1000
 where name='曲奇餅乾';

update food
   SET price = (CASE
                 WHEN price <=250 THEN floor(price*1.08)
				 WHEN price BETWEEN 251 AND 500 THEN floor(price*1.05)
                 WHEN price >=501 THEN floor(price*1.03)
				END);

DELETE FROM food where id='GX099';
