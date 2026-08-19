-- Primary Key: project_id
-- Foreign Key: dept_id referencing department
CREATE TABLE project (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(50) NOT NULL,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES department(dept_id)
);

-- 5. Assignment Table (Composite Key & Foreign Keys)
-- Composite Primary Key: (emp_id, project_id, role_id)
-- Foreign Keys: emp_id referencing employee, project_id referencing project
CREATE TABLE assignment (
    emp_id INT,
    project_id INT,
    role_id INT CHECK (role_id BETWEEN 1 AND 8),
    grade CHAR(2),
    PRIMARY KEY (emp_id, project_id, role_id),
    FOREIGN KEY (emp_id) REFERENCES employee(emp_id),
    FOREIGN KEY (project_id) REFERENCES project(project_id)
);

-- =========================================================
-- Sample Data Insertion
-- =========================================================

-- Insert into department
INSERT INTO department VALUES 
(1, 'Software Engineering'), 
(2, 'Hardware & Embedded');

-- Insert into employee
INSERT INTO employee VALUES 
(101, 'Nilesh', 'nilesh@mail.com', '123456789012', 1),
(102, 'Rahul', 'rahul@mail.com', '987654321098', 2);

-- Insert into project
INSERT INTO project VALUES 
(501, 'DBMS Project', 1), 
(502, 'Circuits Design', 2);

-- Insert into assignment
INSERT INTO assignment VALUES 
(101, 501, 3, 'A'),
(101, 502, 3, 'O'); -- Same employee, different project allowed
