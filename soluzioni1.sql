/*
1.Seleziona tutti gli studenti nati nel 1990
*/

SELECT *
FROM `students`
WHERE YEAR(`students`.`date_of_birth`) = 1990;

/*
2. Selezionare tutti i corsi che valgono più di 10 crediti 
*/

SELECT *
FROM `courses`
WHERE `courses`.`cfu` > 10;