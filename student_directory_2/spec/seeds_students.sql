CREATE TABLE students(
  id SERIAL PRIMARY KEY,
  student_name text,
  cohort_id int,
  constraint fk_cohort foreign key(cohort_id) references cohorts(id)
)