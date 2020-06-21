-- James Porter G00327095
-- Database Management Project
-- Create Dental Practice Database
DROP database if exists dental_practice;
CREATE database dental_practice CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE dental_practice;


-- Create Patient Table 
CREATE TABLE patient (
	ppsn VARCHAR(9) NOT NULL,
	full_name VARCHAR(40) NOT NULL,
	sex ENUM('Male','Female','Other'),
	address VARCHAR(60) NOT NULL,
    phone VARCHAR(15) NOT NULL,
    dob DATE,
	next_appointment DATETIME,
	appointment_id smallint(6),
	outstanding_balance FLOAT(6,2),
	patient_images LONGBLOB,
    xray_image LONGBLOB,
	PRIMARY KEY(ppsn)
)Engine=InnoDB;


-- Create Treatment Table
CREATE TABLE treatment(
	treatment_id SMALLINT(6) NOT NULL AUTO_INCREMENT,
    treatment_type ENUM('Filling','Extraction','Root Canal','Braces','Cleaning') NOT NULL,
    treatment_price FLOAT(6,2) NOT NULL,
    UNIQUE(treatment_type),
    PRIMARY KEY(treatment_id)
) ENGINE=InnoDB;

-- Create Appointments Table
CREATE TABLE appointment (
	appointment_id SMALLINT(6) NOT NULL AUTO_INCREMENT,
	treatment_id SMALLINT(6) NOT NULL,
    ppsn VARCHAR(9) NOT NULL,
    appointment_time DATETIME NOT NULL,
	UNIQUE(ppsn),
	PRIMARY KEY (appointment_id),
	FOREIGN KEY (treatment_id) REFERENCES treatment(treatment_id) ON UPDATE RESTRICT,
    FOREIGN KEY(ppsn) REFERENCES patient(ppsn) ON DELETE CASCADE
)Engine=InnoDB;

-- Create Table Specialist
CREATE TABLE specialist(
	specialist_id SMALLINT(6) NOT NULL AUTO_INCREMENT,
    specialist_full_name VARCHAR(40),
    specialist_phone VARCHAR(15),
    treatment_id SMALLINT(3) NOT NULL,
    PRIMARY KEY(specialist_id),
    FOREIGN KEY(treatment_id) REFERENCES treatment(treatment_id) ON DELETE CASCADE
)Engine=InnoDB; 

-- Create Table Appointment Card
CREATE TABLE card(
	card_id SMALLINT(6) NOT NULL AUTO_INCREMENT,
	ppsn VARCHAR(9) NOT NULL,
    appointment_id SMALLINT(6) NOT NULL,
    note VARCHAR(60),
    refered_specialist VARCHAR(20),
    refered_specialist_id SMALLINT(6),
    UNIQUE (appointment_id),
    PRIMARY KEY(card_id),
    FOREIGN KEY(appointment_id) REFERENCES appointment(appointment_id) ON DELETE CASCADE,
    FOREIGN KEY (refered_specialist_id) REFERENCES specialist(specialist_id) ON DELETE CASCADE
)Engine=InnoDB; 

-- Create Bill Table
CREATE TABLE bill(
	bill_id SMALLINT(6) NOT NULL AUTO_INCREMENT,
    ppsn VARCHAR(9),
    amount FLOAT(6,2),
    bill_created_date DATE,
    UNIQUE(bill_id),
    PRIMARY KEY(bill_id),
    FOREIGN KEY(ppsn) REFERENCES patient(ppsn) ON DELETE RESTRICT
)Engine=InnoDB;

-- Create Payment Table
CREATE TABLE payment(
	payment_id SMALLINT(6) NOT NULL AUTO_INCREMENT,
	ppsn VARCHAR(9) NOT NULL,
	bill_id SMALLINT(6) NOT NULL,
	bill_paid_off BOOLEAN NOT NULL,
	date_payed DATETIME NOT NULL,
	payment_method ENUM('Card','Cash','Cheque','Post'),
	payment_amount FLOAT(6,2) NOT NULL,
	paid_online BOOLEAN NOT NULL,
	card_number VARCHAR(40),
	PRIMARY KEY(payment_id),
    FOREIGN KEY(ppsn) REFERENCES patient(ppsn) ON DELETE RESTRICT,
    FOREIGN KEY (bill_id) REFERENCES bill(bill_id) ON DELETE RESTRICT
)Engine=InnoDB;


-- Alter Patient Table Foreign Key + Index
ALTER TABLE patient ADD INDEX(appointment_id);
ALTER TABLE patient ADD FOREIGN KEY(appointment_id) REFERENCES appointment(appointment_id) ON DELETE SET NULL;

