USE hp;
SELECT * FROM hp.assi;
SELECT namee FROM assi;
SELECT Price FROM assi; 
SELECT namee,Price FROM assi WHERE Price <=200;
SELECT namee,Price FROM assi WHERE Price BETWEEN 60 AND 120;
SELECT namee,Price, (price*100) FROM assi;
SELECT AVG(price) FROM assi;
SELECT AVG(price) AS avg_manufacture_two FROM assi WHERE manufacturer = 2;
SELECT count(price) FROM assi WHERE price>=180;
SELECT namee,Price FROM assi WHERE price>=180 ORDER BY Price DESC;
SELECT namee,Price FROM assi WHERE price>=180 ORDER BY namee ASC;
SELECT * FROM assi
INNER JOIN assi2
ON assi.Code=assi2.Codee;
SELECT namee,Price,namme FROM assi INNER JOIN assi2 ON assi.Code=assi2.Codee;
SELECT codee, AVG(Price) AS avgofmanufactureprice FROM assi
INNER JOIN assi2
ON assi.Code=assi2.Codee GROUP BY Codee;
SELECT namme, AVG(Price) AS avgofmanufactureprice FROM assi
INNER JOIN assi2
ON assi.Code=assi2.Codee GROUP BY namme;
SELECT namme, AVG(Price) AS avgofmanufactureprice FROM assi
INNER JOIN assi2
ON assi.Code=assi2.Codee WHERE Price>=150 GROUP BY namme;
SELECT namee,Price 
FROM assi WHERE Price= (SELECT MIN(Price) from assi);
SELECT namee,Price,namme FROM assi INNER JOIN assi2 ON assi.Code=assi2.Codee
WHERE Price = (SELECT MAX(Price) from assi INNER JOIN assi2 ON assi.Code=assi2.Codee);
insert into assi
values
(11,"loudspeakers",70,2);
SELECT * FROM assi;
UPDATE assi SET namee = "laser printer" where code = 8;
SELECT price-(Price*10/100) AS discount from assi ;
SELECT price-(Price*10/100) AS discount from assi where Price >= 120; 
SELECT * FROM assi INNER JOIN assi2 ON assi.Code=assi2.Codee
