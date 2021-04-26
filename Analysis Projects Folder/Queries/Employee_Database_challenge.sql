-- -- Use Dictinct with Orderby to remove duplicate rows
-- SELECT DISTINCT ON (______) _____,
-- ______,
-- ______,
-- ______

-- INTO nameyourtable
-- FROM _______
-- ORDER BY _____, _____ DESC;

CREATE TABLE employees (
	 emp_no INT NOT NULL,
     birth_date DATE NOT NULL,
     first_name VARCHAR NOT NULL,
     last_name VARCHAR NOT NULL,
     PRIMARY KEY (emp_no)
);

CREATE TABLE Titles (
  emp_no INT NOT NULL,
  title VARCHAR(4) NOT NULL,
  from_date DATE NOT NULL,
  to_date DATE NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
  PRIMARY KEY (emp_no)
);



students = ("Frank", "Mary", "Jasmine", "Ivana", "Ahmed")
students.append("Serena")
print(students)
