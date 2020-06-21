# Databases-Project
A Databases Project I was asked to do in 3rd Year Second Semester. It covers PHPMyAdmin,Wamp and MYSQL. The original Project was uploaded to a AWS Server and had to be queryable from a remote machine.


========================================================================

Steps to Deploy dental_practice Database Locally:
---------------------------------------
Run Create_Tables.sql script on local wamp mysql. Using -u root -p dental_practice < "Create_Tables File Location"
Then do run the Populate_Tables Script on the dental_practice database.
-----------------------------

Images
--------
To add Images to the Patients you must move the patient_images to the C:/ Drive's Root Directory. eg. C:/patient_images
then run the Add_Images File on the dental_practice database.
--------

Test Queries
------------
To Try Different Sample Queries. You can Run any lines from the Test_Queries.sql Script File.
-----------


To Run the PHP Server Pages:

------------------------------------
place dental_practice folder into WAMP's WWW Directory. eg. C:/wamp64/www/dental_practice
Open up both .php files in a text editor and change the $host parameter under <php /> to the Cloud Servers IP and Port.
eg. $host = "54.82.226.159:3308";

This will ensure the dental_database is able to connect and grab the information required for the php page.
Once finished this step you can go to the cloudsip/dental_practice/bills or cloudsip/dental_practice/appointment
and it should display all the info from the database correctly.

EG. http://54.82.226.159/dental_practice/bills

---------------------------------------


