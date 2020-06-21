-- UserName : GMIT
-- Password : GMIT

DROP USER 'GMIT'@'localhost';
CREATE USER 'GMIT'@'localhost' IDENTIFIED BY 'GMIT';
GRANT ALL PRIVILEGES ON *.* TO 'GMIT'@'localhost' WITH GRANT OPTION;

DROP USER 'GMIT'@'%';
CREATE USER 'GMIT'@'%' IDENTIFIED BY 'GMIT';
GRANT ALL PRIVILEGES ON *.* TO 'GMIT'@'%' WITH GRANT OPTION;

DROP USER 'GMIT'@'%.gmit.ie';
Create user 'GMIT'@'%.gmit.ie' identified by 'GMIT';
GRANT ALL PRIVILEGES ON *.* TO 'GMIT'@'%.gmit.ie' WITH GRANT OPTION;

