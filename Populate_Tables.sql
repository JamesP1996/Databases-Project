-- Populate Patient Table (ppsn,full_name,gender,address,phone,dob,next_appointment,appointment_id,oustandingbalance,xray,patient_images)
INSERT INTO patient VALUES ('111111V','John Doe','Male','32 Dun Dovanna Drive, Galway','0824403232','1992-02-01',NULL,NULL,NULL,NULL,NULL);
INSERT INTO patient VALUES ('222222W','Miranda Killian','Female','22 Aus LeBana, Galway','0822401212','1990-04-03',NULL,NULL,NULL,NULL,NULL);
INSERT INTO patient VALUES ('333333V','Matt Killian','Male','22 Aus LeBana, Galway','0871203201','1990-08-11',NULL,NULL,NULL,NULL,NULL);
INSERT INTO patient VALUES ('444444W','Ciara Hart','Female','10 Durden Drive, Loughrea','0817770223','1996-05-10',NULL, NULL,NULL,NULL,NULL);
INSERT INTO patient VALUES ('555555V','Moon Yanver','Male','1 Green Road, Oranmore','0840004010','1987-12-11',NULL,NULL,NULL,NULL,NULL);
INSERT INTO patient VALUES ('666666W','Ella OConnor','Female','64 Bridge Street, Loughrea','0858880101','2000-01-01',NULL, NULL,NULL,NULL,NULL);

-- Populate Treatment Table (treatment_id,treatment_type,treatment_price)
INSERT INTO treatment(treatment_type,treatment_price) VALUES('Filling',90.00);
INSERT INTO treatment(treatment_type,treatment_price) VALUES('Extraction',120.00);
INSERT INTO treatment(treatment_type,treatment_price) VALUES('Root Canal',450.00);
INSERT INTO treatment(treatment_type,treatment_price) VALUES('Braces',350.00);
INSERT INTO treatment(treatment_type,treatment_price) VALUES('Cleaning',69.99);

-- Populate Appointment Table (appointment_id,treatment_id,ppsn,appointment_time)
INSERT INTO appointment(treatment_id,ppsn,appointment_time) VALUES(1,'111111V','2020-03-01 11:00:00');
INSERT INTO appointment(treatment_id,ppsn,appointment_time) VALUES(2,'222222W','2020-03-01 12:30:00');
INSERT INTO appointment(treatment_id,ppsn,appointment_time) VALUES(3,'333333V','2020-03-02 11:15:00');
INSERT INTO appointment(treatment_id,ppsn,appointment_time) VALUES(4,'444444W','2020-03-02 13:15:00');
INSERT INTO appointment(treatment_id,ppsn,appointment_time) VALUES(5,'555555V','2020-03-04 10:30:00');
INSERT INTO appointment(treatment_id,ppsn,appointment_time) VALUES(2,'666666W','2020-03-04 14:30:00');

-- Populate Specialist Table (specialist_id,specialist_full_name,specialist_phone,treatment_id)
INSERT INTO specialist(specialist_full_name,specialist_phone,treatment_id) VALUES ('Dr. Mary Canary','0912274404',3);
INSERT INTO specialist(specialist_full_name,specialist_phone,treatment_id) VALUES ('Dr. Luke Nyugent','095870749',4);
INSERT INTO specialist(specialist_full_name,specialist_phone,treatment_id) VALUES ('Dr. Jin Yang','091777123',5);

-- Populate Table Appointment Card(card_id SMALLINT(6),	ppsn SMALLINT(6) , appointment_id SMALLINT(6), note VARCHAR(60), refered_specialist VARCHAR(20),refered_specialist_id SMALLINT(6))
INSERT INTO card(ppsn,appointment_id,note,refered_specialist,refered_specialist_id) VALUES('111111V',1,'Filling on Left Back Molar','Dr. Mary Mulcahy',NULL);
INSERT INTO card(ppsn,appointment_id,note,refered_specialist,refered_specialist_id) VALUES('222222W',2,'Extraction on Right Back Molar','Dr. Mary Mulcahy',NULL);
INSERT INTO card(ppsn,appointment_id,note,refered_specialist,refered_specialist_id) VALUES('333333V',3,'Root Canal Treatment on Left Back Molar','Dr. Mary Canary',1);
INSERT INTO card(ppsn,appointment_id,note,refered_specialist,refered_specialist_id) VALUES('444444W',4,'Braces Procedure','Dr. Luke Nyugent',2);
INSERT INTO card(ppsn,appointment_id,note,refered_specialist,refered_specialist_id) VALUES('555555V',5,'Full Mouth Cleaning','Dr. Jin Yang',3);
INSERT INTO card(ppsn,appointment_id,note,refered_specialist,refered_specialist_id) VALUES('666666W',6,'Extraction on Front Left Tooth','Dr. Mary Mulcahy',NULL);

-- Populate Table Bill(bill_id ,ppsn amount,  bill_created_date)
INSERT INTO bill(ppsn,amount,bill_created_date) VALUES ('111111V','90.00','2020-02-27');
INSERT INTO bill(ppsn,amount,bill_created_date) VALUES ('222222W','120.00','2020-02-27');
INSERT INTO bill(ppsn,amount,bill_created_date) VALUES ('333333V','450.00','2020-02-28');
INSERT INTO bill(ppsn,amount,bill_created_date) VALUES ('444444W','350.00','2020-02-28');
INSERT INTO bill(ppsn,amount,bill_created_date) VALUES ('555555V','69.99','2020-02-29');
INSERT INTO bill(ppsn,amount,bill_created_date) VALUES ('666666W','120.00','2020-02-29');

-- Populate Table Payment (payment_id , ppsn , bill_id ,bill_paid_off ,	date_payed , payment_method ENUM('Card','Cash','Cheque','Post'), payment_amount, paid_online ,card_number)
INSERT INTO payment(ppsn,bill_id,bill_paid_off,date_payed,payment_method,payment_amount,paid_online,card_number) VALUES('333333V',3,False,'2020-02-29','Card',250.00,True,SHA1('362545106069822'));
INSERT INTO payment(ppsn,bill_id,bill_paid_off,date_payed,payment_method,payment_amount,paid_online,card_number) VALUES('555555V',5,True,'2020-03-1','Cash',69.99,False,NULL);
INSERT INTO payment(ppsn,bill_id,bill_paid_off,date_payed,payment_method,payment_amount,paid_online,card_number) VALUES('666666W',6,False,'2020-03-1','Cheque',60.00,False,NULL);


-- Update Next Appointment and Appointment ID's in Patient Table
UPDATE patient p, appointment a
SET p.next_appointment = a.appointment_time, p.appointment_id = a.appointment_id
where p.ppsn = a.ppsn;

-- Update Outstanding Balance in Patient Table
UPDATE patient p, bill b 
SET p.outstanding_balance = b.amount
WHERE p.ppsn = b.ppsn;

-- Take Away Payment from Outstanding Balance
UPDATE patient p, payment pay
SET p.outstanding_balance = p.outstanding_balance - pay.payment_amount
WHERE p.ppsn = pay.ppsn;

-- Mark bill_paid_off in payment table as True if patient outstanding = 0
UPDATE payment pay, patient p 
SET pay.bill_paid_off = TRUE WHERE p.ppsn = pay.ppsn and p.outstanding_balance = 0;







