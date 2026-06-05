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

/* 4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui
sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e
nome */

select *
from departments d
     join degrees e 
          on d.id = e.department_id
     join students s
          on e.id = s.degree_id
order by s.surname, s.name;

-- 5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti

select *
from degrees d
     join courses c 
          on d.id = c.degree_id
     join course_teacher ct 
          on c.id = ct.course_id
     join teachers t 
          on ct.teacher_id = t.id;

-- 6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)

select distinct t.name, t.surname
from departments dep
     join degrees d
          on dep.id = d.department_id
	 join courses c 
          on d.id = c.degree_id
	 join course_teacher ct
          on c.id = ct.course_id
	 join teachers t
          on ct.teacher_id = t.id
where dep.id = 5;

-- GROUP BY

-- 1. Contare quanti iscritti ci sono stati ogni anno

select year(enrolment_date) 
       as anno, count(*) 
       as iscritti
from students
group by year(enrolment_date);

-- 2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio

select office_address, count(*) 
    as numero_insegnanti
from teachers t
group by office_address;

-- 3. Calcolare la media dei voti di ogni appello d'esame
select exam_id, avg(es.vote) as media_voti
from exam_student es
group by exam_id;

-- con JOIN

select e.id as appello_d_esame, avg(es.vote) as media_voti
from exams e
join exam_student es
on e.id = es.exam_id
group by appello_d_esame;

-- 4. Contare quanti corsi di laurea ci sono per ogni dipartimento

select department_id, count(*) as corsi_di_laurea
from degrees d 
group by department_id;

-- con JOIN

select dep.name as dipartimento, count(*) as corsi_di_laurea 
from departments dep
     join degrees d
          on dep.id = d.department_id
group by dipartimento;





