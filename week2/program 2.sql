select * from car order by year asc;

select count(report_num) CNT from car c,participated p where c.reg_num=p.reg_num and model='Lancer';

select count(distinct driver_id) as total_people from participated a, accident b where a.report_num=b.report_num and b.accident_date like '2008-%';

SELECT * FROM participated ORDER BY damage_amount DESC;

SELECT AVG(damage_amount) FROM participated;

DELETE P FROM participated P
JOIN (
    SELECT AVG(damage_amount) AS avg_damage
    FROM PARTICIPATED
) A
ON P.damage_amount < A.avg_damage;
select * from participated;

SELECT name FROM person A, participated B WHERE A.driver_id = B.driver_id AND damage_amount<(SELECT AVG(damage_amount) FROM participated);

SELECT MAX(damage_amount) FROM participated;
