-- #1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
SELECT D.`name`, S.`name`, S.`surname`, S.`email`, S.`enrolment_date`
FROM `degrees` D
JOIN `students` S
ON D.`id` = S.`degree_id`
WHERE D.`name` = 'Corso di Laurea in Economia'  
ORDER BY S.`name`  ASC;


-- #2. Selezionare tutti i Corsi di Laurea del Dipartimento di Neuroscienze
SELECT DP.`name` AS 'Dipartimento', DG.`name` AS 'Corso di laurea'
FROM `departments` DP
JOIN `degrees` DG
ON DP.`id` = DG.`department_id`
WHERE DP.`name` = 'Dipartimento di Neuroscienze'
ORDER BY DG.`name` ASC;


-- #3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)
SELECT T.`name`, T.`surname`, C.`name`
FROM `teachers` T
JOIN `course_teacher` CT
ON T.`id` = CT.`teacher_id`
JOIN `courses` C
ON C.`id` = CT.`course_id`
WHERE T.`id` = 44
ORDER BY C.`name`;


-- #4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome
SELECT S.`surname` AS 'Cognome', S.`name` AS 'Nome', DG.`name` AS 'Corso', DG.`level`, DG.`address`, DG.`email`, DG.`website`, DP.`name` AS 'Dipartimento'
FROM `students` S
JOIN `degrees` DG
ON DG.`id` = S.`degree_id`
JOIN `departments` DP
ON DP.`id` = DG.`department_id`
ORDER BY S.`surname`, S.`name` ASC;


-- #5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti
SELECT D.`name` AS 'Corso di laurea', C.`name` AS 'Corso', T.`name` AS 'Nome', T.`surname` AS 'Cognome'
FROM `degrees` D
JOIN `courses` C
ON D.`id` = C.`degree_id`
JOIN `course_teacher` CT
ON C.`id` = CT.`course_id`
JOIN `teachers` T
ON T.`id` = CT.`teacher_id`
ORDER BY D.`name` ASC;


-- #6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)
SELECT T.`name` AS 'Nome', T.`surname` AS 'Cognome', DP.`name` AS 'Dipartimento'
FROM `teachers` T
JOIN `course_teacher` CT
ON T.`id` = CT.`teacher_id`
JOIN `courses` C
ON C.`id` = CT.`course_id`
JOIN `degrees` DG
ON DG.`id` = C.`degree_id`
JOIN `departments` DP
ON DP.`id` = DG.`department_id`
WHERE DP.`name` = 'Dipartimento di Matematica'
GROUP BY T.`name`, T.`surname`
ORDER BY T.`name`, T.`surname` ASC;

-- Con DINSTINCT
SELECT DISTINCT T.`name` AS 'Nome', T.`surname` AS 'Cognome', DP.`name` AS 'Dipartimento'
FROM `teachers` T
JOIN `course_teacher` CT
ON T.`id` = CT.`teacher_id`
JOIN `courses` C
ON C.`id` = CT.`course_id`
JOIN `degrees` DG
ON DG.`id` = C.`degree_id`
JOIN `departments` DP
ON DP.`id` = DG.`department_id`
WHERE DP.`name` = 'Dipartimento di Matematica'
ORDER BY T.`name`, T.`surname` ASC;


-- #7. BONUS: Selezionare per ogni studente quanti tentativi d’esame ha sostenuto per superare ciascuno dei suoi esami
SELECT S.`name` AS 'Nome studente', S.`surname` AS 'Cognome studente', C.`id` AS 'Codice esame', C.`name` AS 'Nome esame', COUNT(C.`name`) AS 'Numero di tentativi', MAX(ES.`vote`) AS `voto_massimo`
FROM `students` S
JOIN `exam_student` ES
ON S.`id` = ES.`student_id`
JOIN `exams` E
ON E.`id` = ES.`exam_id`
JOIN `courses` C
ON C.`id` = E.`course_id`
GROUP BY S.`name`, S.`surname`, C.`id`, C.`name`
ORDER BY S.`name`, S.`surname`, C.`id` ASC;
HAVING `voto_massimo` >= 18

