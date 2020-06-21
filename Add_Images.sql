-- Add Images to Patients
-- Does Not Need to Be Ran if Test_Queries.sql is Ran First

UPDATE patient 
SET patient.patient_images = load_file('C:/patient_images/patient#1.jpg'), patient.xray_image = load_file('C:/patient_images/xray#1.jpg') 
WHERE patient.ppsn = '111111V';

UPDATE patient 
SET patient.patient_images = load_file('C:/patient_images/patient#2.jpg'), patient.xray_image = load_file('C:/patient_images/xray#2.jpg') 
WHERE patient.ppsn = '222222W';

UPDATE patient 
SET patient.patient_images = load_file('C:/patient_images/patient#3.jpg'), patient.xray_image = load_file('C:/patient_images/xray#3.jpg') 
WHERE patient.ppsn = '333333V';

UPDATE patient 
SET patient.patient_images = load_file('C:/patient_images/patient#4.jpg'), patient.xray_image = load_file('C:/patient_images/xray#4.jpg') 
WHERE patient.ppsn = '444444W';

UPDATE patient 
SET patient.patient_images = load_file('C:/patient_images/patient#5.jpg'), patient.xray_image = load_file('C:/patient_images/xray#5.jpg') 
WHERE patient.ppsn = '555555V';

UPDATE patient 
SET patient.patient_images = load_file('C:/patient_images/patient#6.jpg'), patient.xray_image = load_file('C:/patient_images/xray#6.jpg') 
WHERE patient.ppsn = '666666W';

