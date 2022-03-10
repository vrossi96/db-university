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


-- #4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome


-- #5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti


-- #6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)


-- #7. BONUS: Selezionare per ogni studente quanti tentativi d’esame ha sostenuto per superare ciascuno dei suoi esami

