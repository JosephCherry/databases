DROP DATABASE IF EXISTS coffinDodgersInc;
CREATE DATABASE coffinDodgersInc;
USE coffinDodgersInc; 

CREATE TABLE residents (
	first_name VARCHAR(1000) NOT NULL,
	last_name VARCHAR(1000) NOT NULL,
    ID INT NOT NULL PRIMARY KEY,
    family_contact_no INT NOT NULL,
	room_no INT,
	carer INT
);

CREATE TABLE carers(
	first_name VARCHAR(1000) NOT NULL,
	last_name VARCHAR(1000) NOT NULL,
    contact_no INT NOT NULL,
    ID INT NOT NULL PRIMARY KEY, 
	room_group INT
);

CREATE TABLE rooms( 
	room_no INT,
    size INT, 
    room_view BOOLEAN NOT NULL,
    room_group INT NOT NULL PRIMARY KEY
);

ALTER TABLE rooms ADD UNIQUE (room_no);

ALTER TABLE residents ADD CONSTRAINT FOREIGN KEY (room_no) REFERENCES rooms(room_no);
ALTER TABLE residents ADD CONSTRAINT FOREIGN KEY (carer) REFERENCES carers(ID);
ALTER TABLE carers ADD CONSTRAINT FOREIGN KEY (room_group) REFERENCES rooms(room_group);