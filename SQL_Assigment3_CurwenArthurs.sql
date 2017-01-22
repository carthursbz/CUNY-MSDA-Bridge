/* Week 3
   Assignment SQL Building a Relational Database Management System
   Curwen Arthurs
*/


-- CREATE NEW SCHEMA CALLED mysqlvids --

CREATE SCHEMA employees; 



-- OPENING SCHEMA AND RESETING TABLES -- 

USE employees; # letting mysql know which schema to run the script on 
DROP TABLE IF EXISTS tblEmployees;
DROP TABLE IF EXISTS tblGroups; 
DROP TABLE IF EXISTS tblRooms;
DROP TABLE IF EXISTS tblGroupsRooms; # deletes any tables previously created ensuring that the table is created over from scratch



-- BEGIN CREATING TABLES --

/* TABLE 1 - Employees Table
   Create Employees Table    */
CREATE TABLE tblEmployees
(user_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
 employee_name VARCHAR(70) NOT NULL, # 70 is the suggested number of charaters for a full name
 group_id INT NULL REFERENCES tblGroups # Foriegn Key to link to Groups table, placed here as it would be easier to assign the group to the employee while inputing his/her information  
); 


/* TABLE 2 - Groups Table
   Create Groups Table    */
CREATE TABLE tblGroups
(group_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
 group_name VARCHAR(100) NOT NULL # 100, arbitrary number of characters, little more than 70 for the employee name 
); 


/* TABLE 3 - Rooms Table
   Create Rooms Table    */
CREATE TABLE tblRooms
(room_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
 room_name VARCHAR(100) NOT NULL  # 100, arbitrary number of characters, little more than 70 for the employee name
); 

 
/* TABLE 4 - GroupsRooms Table
   Create GroupsRooms Table    */
CREATE TABLE tblGroupsRooms # this is the link table for a one-many relationship from both Groups and Rooms tables i.e. the many-to-many linking table
(group_id INT NULL, # Primary Key from Groups table
 room_id INT NULL # Primary Key from Rooms table
);                

 -- END CREATING TABLES --
 
 
 
 -- BEGIN ADDING ROWS TO TABLES --
  
 /* TABLE 1 - Employees Table
    Add rows to the Employees Table */
INSERT INTO tblEmployees
(employee_name, group_id)
VALUES
('Modesto', 1),
('Ayine', 1),
('Christopher', 2),
('Cheong woo', 2),
('Saulat', 3),
('Heidy', NULL);

SELECT * FROM tblEmployees; # checking that the number of rows created matches the output


 /* TABLE 2 - Groups Table
    Add rows to the Groups Table */
INSERT INTO tblGroups
(group_name)
VALUES
('I.T.'),
('Sales'),
('Administration'),
('Operations');

SELECT * FROM tblGroups;


 /* TABLE 3 - Rooms Table
    Add rows to the Rooms Table */
INSERT INTO tblRooms
(room_name)
VALUES
('101'),
('102'),
('Auditorium A'),
('Auditorium B');

SELECT * FROM tblRooms;


 /* TABLE 4 - GroupsRooms Table
    Add rows to the GroupsRooms Table */
INSERT INTO tblGroupsRooms 
(group_id, room_id)
VALUES
(1, 1),		# assigning rooms to each group as prescribed
(1, 2),
(2, 2),
(2, 3),
(3, NULL),
(4, NULL);

SELECT * FROM tblGroupsRooms;

 -- END ADDING ROWS TO TABLES --
 
 
 
   -- BEGIN JOINING TABLES --
   
 /* SELCET 1 - All Groups & Users in each group */
        
SELECT g.group_name AS 'Groups', e.employee_name AS 'Users' # displays all groups even those without a user assigned
FROM tblGroups g
LEFT JOIN tblEmployees e
ON g.group_id = e.group_id;
  


 /* SELCET 2 - All Rooms & Groups assigned to each room */

SELECT r.room_name AS 'Rooms', g.group_name AS 'Groups'
FROM tblRooms r
LEFT JOIN tblGroupsRooms gr # join primary table rooms to link table then join groups table to link table 
ON r.room_id = gr.room_id
LEFT JOIN tblGroups g
ON gr.group_id = g.group_id;



/* SELCET 3 - All Rooms & Groups assigned to each room */

SELECT e.employee_name AS 'User', g.group_name AS 'Group', r.room_name AS 'Room'
FROM tblEmployees e
LEFT JOIN tblGroups g       
ON e.group_id = g.group_id
LEFT JOIN tblGroupsRooms gr		# join primary table employees to groups table then groups to link table then link table to rooms table 
ON g.group_id = gr.group_id
LEFT JOIN tblRooms r
ON gr.room_id = r.room_id
ORDER BY User, g.group_name, Room;
  
   
   