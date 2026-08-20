# Hospital Management System Database

This repository contains the SQL scripts to initialize and build a relational database schema named hospital_demo. It demonstrates fundamental database design constraints such as Primary Keys, Foreign Keys, Unique attributes, Check validations, and Composite Junction Keys.

---

## SQL Commands & Schema Breakdown

### 1. Database Initialization

* *CREATE DATABASE hospital_demo;* - Creates a new separate database container named hospital_demo.
* *USE hospital_demo;* - Instructs MySQL to execute all subsequent table commands inside this specific database.

---

### 2. Department Table (department)

This is the parent lookup table for clinical departments within the hospital.

#### Structural Attributes:
* *dept_id INT PRIMARY KEY* - Uniquely identifies each hospital department (e.g., Cardiology, Pediatrics).
* *dept_name VARCHAR(50) UNIQUE NOT NULL* - Stores the department name. It is mandatory (NOT NULL) and prevents duplicates (UNIQUE), serving as an *Alternate Key*.

---

### 3. Doctor Table (doctor)

Stores medical staff profiles and maps them to their specialized departments.

#### Structural Attributes:
* *doctor_id INT PRIMARY KEY* - Unique identifier for each individual doctor.
* *name VARCHAR(50) NOT NULL* - Ensures every doctor record has a name.
* *email VARCHAR(50) UNIQUE* - Prevents duplicate email communication channels.
* *license_no VARCHAR(20) UNIQUE NOT NULL* - Validates and holds the state medical license uniquely per doctor.
* *FOREIGN KEY (dept_id) REFERENCES department(dept_id)* - Establishes a structural connection ensuring a doctor can only be assigned to an existing department.

---

### 4. Patient Table (patient)

Contains foundational registration profiles for hospital patients.

#### Structural Attributes:
* *patient_id INT PRIMARY KEY* - Unique identification key for each registered patient.
* *name VARCHAR(50) NOT NULL* - Requires a name string for every patient file.
* *email VARCHAR(50) UNIQUE* - Enforces unique personal contact entries.
* *aadhar_no VARCHAR(12) UNIQUE NOT NULL* - Holds the 12-digit government identification uniquely per patient record.
* *CHECK (gender IN ('M', 'F', 'O'))* - A domain validation rule restricting text entries strictly to Male ('M'), Female ('F'), or Other ('O').

---

### 5. Appointment Table (appointment)

A junction table tracking the many-to-many relationship mapping patients to their diagnostic doctors.

#### Structural Attributes:
* *PRIMARY KEY (patient_id, doctor_id, appointment_date)* - A *Composite Primary Key* combining three columns to ensure a single patient cannot book multiple appointments with the same doctor on the exact same day.
* *CHECK (token_no BETWEEN 1 AND 100)* - A check constraint that ensures queuing values are restricted between daily bounds of 1 and 100.
* *FOREIGN KEY (patient_id) REFERENCES patient(patient_id)* - Verifies the booking belongs to a real, pre-registered patient.
* *FOREIGN KEY (doctor_id) REFERENCES doctor(doctor_id)* - Confirms the booking points directly to a real doctor on staff.
*
