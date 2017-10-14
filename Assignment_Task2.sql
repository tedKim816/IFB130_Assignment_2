/* Ji Su Choi - n9678166 */
/* Min Ho Kim - n8051381   */
/* Task2, Task3, Task4, Task5 */

/* Task 2 */
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
SELECT b.badgeName, p.firstName, p.lastName, p.email
FROM player p, badge b, purchase pc
WHERE p.username = pc.username AND
b.badgeID = pc.badgeID
ORDER BY b.badgeName, p.firstName, p.lastName ASC;

/*Task2_question5*/
SELECT p.username, COUNT(*) AS theNumberOfCompletedCommonQuests
FROM player p, playertreasure pt, treasure t, quest qu
WHERE p.username = pt.username
AND t.treasureID = pt.treasureID AND t.type = 'common'
AND t.questID = qu.questID
GROUP BY p.username; 
                         
/* Task 3 */
/*Task3_question1*/
INSERT INTO badge (badgeName, badgeDescription)
VALUE ('Fools Gold','Trickiest trickster in all the seas');

/*Task3_question2*/
set sql_safe_updates = 0;
DELETE FROM playerprogress
WHERE progress = 'inactive';
set sql_safe_updates = 1;

/*Task3_question3*/
set sql_safe_updates = 0;
UPDATE player
SET streetNumber = '72', streetName = 'Evergreen Terrace', suburb= 'Springfield'
WHERE lastName = 'Smith' AND streetNumber = '180'
AND streetName = 'Zelda Street' AND suburb = 'Linkburb';
set sql_safe_updates = 1;

/* Task 4 */
/*Task4_Index*/
CREATE INDEX treasureWebpage
ON treasure(webpage);

/*Task4_Create View*/
CREATE VIEW newList AS 
SELECT DISTINCT firstName, lastName, creationDateTime
FROM player p, playerprogress prg
WHERE p.username = prg.username 
AND prg.progress NOT IN ('complete');

/* Task 5 */
CREATE USER IF NOT EXISTS 'nikki'@'localhost' IDENTIFIED BY 'password';
CREATE USER IF NOT EXISTS 'phil'@'localhost' IDENTIFIED BY 'password';

/*Task5_A*/
GRANT INSERT 
ON Player
TO 'nikki'@'localhost';

/*Task5_B*/
GRANT DELETE
ON Player
TO 'nikki'@'localhost';

/* Give Phil Privileges */
GRANT INSERT 
ON Player
TO 'phil'@'localhost';
GRANT DELETE
ON Player
TO 'phil'@'localhost';


/*Task5_C*/
REVOKE INSERT 
ON Player
FROM 'phil'@'localhost';

/*Task5_D*/
REVOKE DELETE 
ON Player
FROM 'phil'@'localhost';




