/*Task2_question1*/
SELECT firstName, lastName, dob, gender, email 
FROM player
Where suburb LIKE '%Sunnybank%';

/*Task2_question2*/
SELECT username, SUM(cost) 
FROM purchase
GROUP BY username
ORDER BY username DESC;

/*Task2_question3*/
SELECT *
FROM Phonenumber
WHERE username = ( SELECT username from Player ORDER BY dob ASC LIMIT 1);

/*Task2_question4*/
SELECT badge.badgeName, player.firstName, player.lastName, player.email
FROM player, badge, purchase
WHERE player.username = purchase.username AND
badge.badgeID = purchase.badgeID
ORDER BY badge.badgeName,player.firstName,player.lastName ASC;

/*Task2_question5*/
select username, progress,type, count(*) as theNumberOfCompletedCommonQeust
from playerprogress p, treasure t 
where  p.progress = 'complete' and t.type = 'common'
group by  p.username;




/*Task3_question1*/
INSERT INTO badge (badgeID, badgeName, badgeDescription)
VALUE ('18','Fools Gold','Trickiest trickster in all the seas');

/*Task3_question2*/

DELETE FROM playerprogress
WHERE progress = 'inactive';

/*Task3_question3*/
UPDATE player
SET streetNumber = '72', streetName = 'Evergreen Terrace', suburb= 'Springfield'
WHERE lastName = 'Smith';



