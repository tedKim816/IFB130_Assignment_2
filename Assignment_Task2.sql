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
WHERE username = ( SELECT username from Player ORDER By dob ASC LIMIT 1);

/*Task2_question4*/
SELECT badge.badgeName, player.firstName, player.lastName, player.email
FROM player, badge, purchase
WHERE player.username = purchase.username AND
badge.badgeID = purchase.badgeID
ORDER BY badge.badgeName,player.firstName,player.lastName ASC;

/*Task2_question5*/


