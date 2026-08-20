CREATE DATABASE hospital_demo;
USE hospital_demo;

-- 1. Department Table (The parent table)
CREATE TABLE department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50) UNIQUE NOT NULL
);

-- 2. Doctor Table (Links to department)
CREATE TABLE doctor (
    doctor_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE,
    license_no VARCHAR(20) UNIQUE NOT NULL,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES department(dept_id)
);

-- 3. Patient Table 
CREATE TABLE patient (
    patient_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE,
    aadhar_no VARCHAR(12) UNIQUE NOT NULL,
    gender CHAR(1) CHECK (gender IN ('M', 'F', 'O'))
);

-- 4. Appointment Table (Composite Key & Junction Table)
CREATE TABLE appointment (
    patient_id INT,
    doctor_id INT,
    appointment_date DATE,
    token_no INT CHECK (token_no BETWEEN 1 AND 100),
    status VARCHAR(20) DEFAULT 'Scheduled',
    PRIMARY KEY (patient_id, doctor_id, appointment_date),
    FOREIGN KEY (patient_id) REFERENCES patient(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctor(doctor_id)
);
