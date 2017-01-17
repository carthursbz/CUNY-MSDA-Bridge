/* Week 2
   Assignment SQL Data Definition Language
   Curwen Arthurs
*/


-- CREATE NEW SCHEMA CALLED mysqlvids --

CREATE SCHEMA mysqlvids; 



-- OPENING SCHEMA AND RESETING TABLES -- 

USE mysqlvids; # letting mysql know which schema to run the script on 
DROP TABLE IF EXISTS tblVideos;
DROP TABLE IF EXISTS tblReviewers; # deletes any tables previously created ensuring that the table is created over from scratch


-- BEGIN CREATING TABLES --

/* TABLE 1 - Videos Table
   Create Videos Table    */
CREATE TABLE tblVideos
(video_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
 title VARCHAR(100) NOT NULL, # setting the charater length to the maximum for youtube which is 100 and cannot be null since all videos has to have titles
 length_hrs INT NULL DEFAULT 0,
 length_mins INT NULL DEFAULT 0, 
 length_secs INT NULL DEFAULT 0,
 url TEXT NOT NULL); # using text data type since do not want to limit the length of characters
 
 
 /* TABLE 2 - Reviewers Table
    Create Reviewers Table    */
CREATE TABLE tblReviewers
(reviewer_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL, # auto increment to number each new row and set a primary key which cannot be NULL 
 Name TEXT NOT NULL, # should not be null since reviewers would have an account 
 rating DECIMAL(2,1) NULL, # using decimal data type since rating can include halves eg: 4.5 etc... specify 2 digits, 1 decimal place 
 comments TEXT NULL,
 video_id INT NOT NULL REFERENCES tblVideos); # this is the foreign key that will link the 2 tables

 
 /* Validate Rating */
## Using Create Trigger to validate rating since Check command in create table does not work for validation
DELIMITER $$

CREATE TRIGGER rating_validate_insert
	BEFORE INSERT
	ON tblReviewers
	FOR EACH ROW
BEGIN
	IF NEW.rating NOT IN(0, 0.5, 1, 1.5, 2, 2.5, 3, 3.5, 4, 4.5, 5) THEN # rating must be between 0 to 5 and can include halves
		SIGNAL SQLSTATE VALUE '45000'
			SET MESSAGE_TEXT = '[table:rating] - `rating` column is not valid';
	END IF;
END;

$$
 
 -- END CREATING TABLES --
 
 
 
 -- BEGIN ADDING ROWS TO TABLES --
 
 /* TABLE 1 - Videos Table
    Add rows to the Videos Table */
INSERT INTO tblVideos
(title, length_hrs, length_mins, length_secs, url)
VALUES
('How to setup MySQL Workbench', NULL, 13, 36, 'https://www.youtube.com/watch?v=aY6LiTbfckA'),
('How to setup mysql,php,iis on windows server 2008 R2 clustering', 1, 6, 40, 'https://www.youtube.com/watch?v=E_7qjcBVwEU'),
('How to create database and tables in MySql Workbench 6.3 for beginners', NULL, 4, 10, 'https://www.youtube.com/watch?v=Q92CJTIAiQM'),
('Mysql Tutorial For Beginners - How to Join Tables', NULL, 8, 28, 'https://www.youtube.com/watch?v=hGgAZDEQV4Q'),
('How to allow remote access to a MySQL database', NULL, 1, 49, 'https://www.youtube.com/watch?v=xXOq9U9fzOo');

SELECT * FROM tblVideos; # checking that the number of rows in the table matches number of rows inserted 


 /* TABLE 2 - Reviewers Table
    Add rows to the Reviewers Table */
INSERT INTO tblReviewers
(Name, video_id, rating, comments)
VALUES
('Donald', 5, 5, 'Very usefull tutorial'),
('Donald', 2, NULL, NULL),
('Sofia_COL', 1, 4.5, 'I really learnt a lot from this'),
('Nicole', 3, 5, 'Great video, easy to understand'),
('Nicole', 4, 2.5, 'Short, needed more examples'),
('MJ', 4, 1, 'Really SUCKED!'),
('MJ', 5, 2, 'CRAP!!!');

SELECT * FROM tblReviewers;

 -- END ADDING ROWS TO TABLES --
 
 
 
  -- BEGIN JOINING TABLES --
/* Combining the 2 tables using a INNER JOIN */
                            # this calculated field converts video lengths that is in hours, mins, secs to minutes
SELECT v.video_id, v.title, ROUND(((IFNULL(v.length_hrs, 0) * 60)  + v.length_mins + (IFNULL(v.length_secs, 0)/60)), 2) AS 'Length in minutes', r.name, rating, comments 
FROM tblVideos v
INNER JOIN tblReviewers r
ON v.video_id = r.video_id
ORDER BY v.video_id, rating DESC;

  -- END JOINING TABLES --

  

 
 
 

   

   
 