/*

SELECT students.name as student_name, avg(assignment_submissions.duration) as average_assignment_duration, avg(assignment_seeds.duration) as assignment_
FROM students
JOIN assignment_submissions ON student_id = students.id
JOIN assignment_seeds ON assignments_id = assignments.id
GROUP BY student
WHERE end_date = NULL
ORDER BY average_assignment_duration ASC;
*/

SELECT students.name as student, avg(assignment_submissions.duration) as average_assignment_duration, avg(assignments.duration) as average_estimated_duration
FROM students
JOIN assignment_submissions ON student_id = students.id
JOIN assignments ON assignments.id = assignment_id
WHERE end_date IS NULL
GROUP BY student
HAVING avg(assignment_submissions.duration) < avg(assignments.duration)
ORDER BY average_assignment_duration;