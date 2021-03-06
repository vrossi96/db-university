-- #1. Selezionare tutti gli studenti nati nel 1990 (160)
SELECT *
FROM `students`
WHERE YEAR(`date_of_birth`) = 1990 
ORDER BY `date_of_birth` ASC;

-- oppure
SELECT *
FROM `students`
WHERE `date_of_birth` LIKE '1990-%'
ORDER BY `date_of_birth` ASC;


-- #2. Selezionare tutti i corsi che valgono più di 10 crediti (479)
SELECT * 
FROM `courses` 
WHERE `cfu` > 10
ORDER BY `cfu` ASC;


-- #3. Selezionare tutti gli studenti che hanno più di 30 anni
-- !3369 risultati - PIU' ACCURATO, PERFETTO, MENO DISPENDIOSO
-- 09/03/2022 risultati spaziano da 1971-06-09... - 1992-03-08
SELECT * 
FROM `students`
WHERE `date_of_birth` < DATE_SUB(CURDATE(), INTERVAL 30 YEAR)
ORDER BY `students`.`date_of_birth`  DESC;
-- !3369 risultati - PIU' ACCURATO e PERFETTO con divisione per 365.25
-- 09/03/2022 risultati spaziano da 1971-06-09... - 1992-03-08
SELECT *
FROM `students`
WHERE (TIMESTAMPDIFF(DAY, `date_of_birth`, CURDATE()) / 365.25) > 30 
ORDER BY `students`.`date_of_birth`  DESC;
-- !3371 risultati - ACCURATO ma non perfetto
-- 09/03/2022 risultati spaziano da 1971-06-09... - 1992-03-15
SELECT *
FROM `students`
WHERE (TIMESTAMPDIFF(DAY, `date_of_birth`, CURDATE()) / 365) > 30  
ORDER BY `students`.`date_of_birth`  DESC;

-- oppure - 3338 risultati - meno accurato
-- 09/03/2022 risultati spaziano da 1971-06-09... - 1991-12-28
SELECT * 
FROM `students` 
WHERE (2022 - YEAR(`date_of_birth`)) > 30  
ORDER BY `students`.`date_of_birth`  DESC;

-- oppure - 3209 risultati - meno accurato
-- 09/03/2022 risultati spaziano da 1971-06-09... - 1991-03-06
SELECT * 
FROM `students`
WHERE TIMESTAMPDIFF(YEAR, `date_of_birth`, CURDATE()) > 30  
ORDER BY `students`.`date_of_birth`  DESC;


-- #4. Selezionare tutti i corsi del primo semestre del primo anno di un qualsiasi corso di laurea (286)
SELECT * 
FROM `courses` 
WHERE `year` = 1
AND `period` = 'I semestre'
ORDER BY `id` ASC;


-- #5. Selezionare tutti gli appelli d'esame che avvengono nel pomeriggio (dopo le 14) del 20/06/2020 (21)
SELECT *
FROM `exams`
WHERE `date` = '2020-06-20'
AND HOUR(`hour`) > 14
ORDER BY `id` ASC;


-- #6. Selezionare tutti i corsi di laurea magistrale (38)
SELECT * 
FROM `degrees`
WHERE `level` = 'magistrale'
ORDER BY `id` ASC;


-- #7. Da quanti dipartimenti è composta l'università? (12)
SELECT COUNT(*)
FROM `departments`;


-- #8. Quanti sono gli insegnanti che non hanno un numero di telefono? (50)
SELECT COUNT(*) 
FROM `teachers`
WHERE `phone` IS NULL;


