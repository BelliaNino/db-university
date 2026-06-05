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

/*
3. Selezionare tutti gli studenti che hanno più di 30 anni
*/

SELECT *
FROM `students`
WHERE YEAR(current_date()) - YEAR(`date_of_birth`) > 30;

/*
4. Selezionare tutti i corsi del primo semestre del primo anno di un qualsiasi corso di laurea (286)
*/

SELECT *
FROM `courses`
WHERE (`courses`.`period`) = 'I semestre' AND
(`courses`.`year`) = '1';

/*
5. Selezionare tutti gli appelli d'esame che avvengono nel pomeriggio (dopo le 14) del 20/06/2020 (21)
*/

SELECT *
FROM `exams`
WHERE HOUR(`exams`.`hour`) >= 14 AND
`exams`.`date` = '2020-06-20';

/*
6. Selezionare tutti i corsi di laurea magistrale (38)
*/

SELECT *
FROM `degrees`
WHERE `degrees`.`level` = 'magistrale';

/*
7. Da quanti dipartimenti è composta l'università? (12)
*/

SELECT `departments`.`name`
FROM `departments`;

/*
8.  Quanti sono gli insegnanti che non hanno un numero di telefono? (50)
*/

SELECT *
FROM `teachers`
WHERE `teachers`.`phone` IS NULL;

--JOIN

-- 1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
select *
from degrees d
where d.name = 'Corso di Laurea in Economia';
	-- 53
select *
from degrees d
     join students s
     on d.id = s.degree_id
where d.id = 53;

-- 2. Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di Neuroscienze
select * 
from departments d
where d.name = 'Dipartimento di Neuroscienze';
-- 7

select * 
from departments d
     join degrees c
     on d.id = c.department_id
     where d.id = 7 and
     c.level = 'magistrale';

-- 3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)

select *
from teachers t
join course_teacher ct ON t.id = ct.teacher_id
join courses c ON ct.course_id = c.id
where t.id = 44;