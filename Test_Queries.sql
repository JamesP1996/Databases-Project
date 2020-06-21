-- Test Queries

-- Patient Annette wants to make an appointment for cleaning but is new on the system
-- (ppsn,full_name,gender,address,phone,dob,next_appointment,appointment_id,oustandingbalance,xray,patient_images)
INSERT INTO patient VALUES('777777V','Annette Muldoon','Female','23 Bothar on Cona, Craughwell','0923302200','1990-02-01','2020-03-15',NULL,NULL,NULL,NULL);
-- (appointment_id,treatment_id,ppsn,appointment_time)
INSERT INTO appointment VALUES(7,5,'777777V','2020-03-15 11:30:00'); 

-- Set Annette's Appointment ID Equal to her appointment
UPDATE patient p, appointment a
SET p.appointment_id = a.appointment_id
WHERE p.ppsn = a.ppsn;

-- Set Annette's Bill
INSERT INTO BILL(ppsn,amount,bill_created_date) VALUES ('777777V',69.99,'2020-02-29');

-- Update Outstanding Balance
UPDATE patient p, bill b
SET p.outstanding_balance = b.amount
WHERE p.ppsn = b.ppsn;

-- Dr. Jin Yang wants to check what he's new patient is for the cleaning
SELECT * from patient where ppsn ='777777V';

-- Annette Is Given An Appointment Card at the Desk
INSERT INTO card(ppsn,appointment_id,note,refered_specialist,refered_specialist_id) VALUES('777777V',7,'Full Mouth Cleaning','Dr. Jin Yang',3);

-- Annette Decides later on in the week that the appointment is not good for her and wishes to change the date
UPDATE patient p, appointment a
SET a.appointment_time = '2020-03-18 12:30:00', p.next_appointment = '2020-03-18 12:30:00'
WHERE p.ppsn = '777777V' AND a.ppsn =  '777777V';

-- Annette Decides to pay off a portion of her bill in advance
INSERT INTO payment(ppsn,bill_id,bill_paid_off,date_payed,payment_method,payment_amount,paid_online,card_number) VALUES ('777777V',7,FALSE,'2020-03-04','Card',35.00,TRUE,SHA1("4771680518342710"));

-- Update Annette's outstanding balance - payment
UPDATE patient p, payment pay
SET p.outstanding_balance = p.outstanding_balance - pay.payment_amount
WHERE p.ppsn = pay.ppsn AND pay.date_payed = '2020-03-04';

-- Dr Mary Mulcahy wants to see who owes her practice an outstanding balance and from what date
SELECT p.ppsn,p.full_name,p.address,p.outstanding_balance,b.bill_created_date
FROM patient p
INNER JOIN bill b ON b.ppsn = p.ppsn
WHERE outstanding_balance > 0;

-- Miranda Killian has decided to switch Dentist_Practice and Wishes to Remove Her Records and Cancel Any Billings She Has
-- Must Delete bill and payment fields first due to ON DELETE RESTRICT. I implemented this so that you cannot delete a patient who owes a bill
-- as this may be useful in some circumstances where a patient calls in, tries to remove their record but it is found out they have outstanding money owed.
DELETE FROM bill 
WHERE ppsn = "222222W";

DELETE FROM payment 
WHERE ppsn = '222222W';

DELETE FROM card 
WHERE ppsn = '222222W';

DELETE FROM patient, appointment USING patient,appointment 
WHERE patient.ppsn = '222222W' AND patient.ppsn = appointment.ppsn;

