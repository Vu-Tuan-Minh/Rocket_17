DROP DATABASE IF EXISTS ANHDADEN;
CREATE DATABASE ANHDADEN;
USE ANHDADEN;

CREATE TABLE DEPARTMENT(
	DepartmentID 	TINYINT UNSIGNED auto_increment KEY,
	DepartmentName 	VARCHAR(20) NOT NULL
);

CREATE TABLE POSITION (
	PositionID 		TINYINT UNSIGNED PRIMARY KEY ,
	PositionName 	VARCHAR(20) NOT NULL
);

CREATE TABLE `ACCOUNT` (
	AccountID 		TINYINT UNSIGNED auto_increment PRIMARY KEY ,
    Email			VARCHAR(50) NOT NULL,
	Username 		VARCHAR(50) NOT NULL,
    FullName		NVARCHAR(50) NOT NULL,
    DepartmentID 	TINYINT UNSIGNED NOT NULL,
    PositionID		TINYINT UNSIGNED NOT NULL,
    CreateDate		DATETIME DEFAULT  NULL,
    
    FOREIGN KEY (DepartmentID) REFERENCES DEPARTMENT(DepartmentID),
    FOREIGN KEY (PositionID) REFERENCES POSITION (PositionID)
);

CREATE TABLE `Group` (
	GroupID 		TINYINT UNSIGNED auto_increment PRIMARY KEY,
    GroupName		VARCHAR(20) NOT NULL,
    CreatorID		TINYINT UNSIGNED NOT NULL,
	CreateDate 		DATETIME DEFAULT NULL,
    
FOREIGN KEY (CreatorID) REFERENCES `ACCOUNT`(AccountID)
);
CREATE TABLE GroupAccount (
	GroupID 		TINYINT UNSIGNED NOT NULL,
    AccountID		TINYINT UNSIGNED  NOT NULL,
    JoinDate		DATETIME DEFAULT  NULL,
    
    PRIMARY KEY (GroupID,AccountID),
    FOREIGN KEY (GroupID) REFERENCES `Group`(GroupID),
	FOREIGN KEY (AccountID) REFERENCES `Account`(AccountID)
);

CREATE TABLE TypeQuestion (
	TypeID 			MEDIUMINT UNSIGNED auto_increment PRIMARY KEY ,
    TypeName		NVARCHAR(20) NOT NULL
);

CREATE TABLE CategoryQuestion (
	CategoryID 		SMALLINT UNSIGNED auto_increment PRIMARY KEY ,
    CategoryName	NVARCHAR(20) NOT NULL
);

CREATE TABLE Question (
	QuestionID 		INT UNSIGNED  NOT NULL,
    Content			NVARCHAR(200) NOT NULL,
	CategoryID 		SMALLINT UNSIGNED NOT NULL,
    TypeID			MEDIUMINT UNSIGNED NOT NULL,
    CreatorID 		TINYINT UNSIGNED NOT NULL,
    CreateDate		DATETIME DEFAULT  NULL,
    
     PRIMARY KEY(QuestionID,CategoryID),
     FOREIGN KEY (CreatorID) REFERENCES `ACCOUNT`(AccountID),
     FOREIGN KEY (TypeID) REFERENCES TypeQuestion (TypeID),
     FOREIGN KEY (CategoryID) REFERENCES CategoryQuestion (CategoryID)
);

CREATE TABLE Exam (
	ExamID 			TINYINT UNSIGNED auto_increment PRIMARY KEY ,
    _Code			CHAR(10) NOT NULL,
	Title 			NVARCHAR(100) NOT NULL,
    CategoryID		SMALLINT UNSIGNED NOT NULL,
    Duration 		TINYINT NOT NULL, -- 60 90
    CreatorID		TINYINT UNSIGNED NOT NULL,
    CreateDate		DATETIME DEFAULT  NULL,
    
     FOREIGN KEY (CreatorID) REFERENCES `ACCOUNT`(AccountID),
	FOREIGN KEY (CategoryID) REFERENCES CategoryQuestion (CategoryID)
);

CREATE TABLE Answer (
	AnswerID 		TINYINT UNSIGNED NOT NULL,
    Content			NVARCHAR(200) NOT NULL,
	QuestionID 		INT UNSIGNED NOT NULL,
    isCorrect		BIT NOT NULL,
    
    PRIMARY KEY(AnswerID,QuestionID),
	FOREIGN KEY (QuestionID) REFERENCES Question (QuestionID)
);


CREATE TABLE ExamQuestion (
	ExamID 			TINYINT UNSIGNED auto_increment PRIMARY KEY ,
    QuestionID		INT UNSIGNED NOT NULL,
    
    FOREIGN KEY (QuestionID) REFERENCES Question (QuestionID)
);


insert into DEPARTMENT values ("1","SALES");
insert into DEPARTMENT values ("2","Marketing");
insert into DEPARTMENT values ("3","IT");


insert into POSITION values ("1","Dev");
insert into POSITION values ("2","Test");
insert into POSITION values ("3"," Scrum Master");
insert into POSITION values ("4","PM");


insert into `ACCOUNT` values ("1","a@gmail.com","Aphen","Phèn Văn A","1","1",default);
insert into `ACCOUNT` values ("2","b@gmail.com","Bom","Mai Nam Hải","1","2",default);
insert into `ACCOUNT` values ("3","N@gmail.com","Nghi","Trần Nguyễn Minh Nghi","1","3",default);

insert into `Group` values ("1","PJJ","1",default);
insert into `Group` values ("2","PtJ","2",default);
insert into `Group` values ("3","PxJ","3",default);
insert into `Group` values ("4","PzJ","2",default);
insert into `Group` values ("5","PiJ","1",default);

insert into GroupAccount values ("1","1",default);
insert into GroupAccount values ("2","2",default);
insert into GroupAccount values ("3","3",default);
insert into GroupAccount values ("4","2",default);
insert into GroupAccount values ("5","1",default);

insert into TypeQuestion values ("1","Essay");
insert into TypeQuestion values ("2","Multiple-Choice");



insert into CategoryQuestion values ("1","Java");
insert into CategoryQuestion values ("2","NET");
insert into CategoryQuestion values ("3","SQL");
insert into CategoryQuestion values ("4","Postman");
insert into CategoryQuestion values ("5","Ruby");


insert into Question values ("1","anh da den hoc nganh gi", "1", "1","3",default);
insert into Question values ("2","anh da vang hoc nganh gi", "2", "1","2",default);
insert into Question values ("3","anh da trang hoc nganh gi", "3", "1","1",default);
insert into Question values ("4","anh da do hoc nganh gi", "5", "1","1",default);

insert into Answer values ("1","java", "1", true);
insert into Answer values ("2","java", "3", false);
insert into Answer values ("3","java", "2", false);
insert into Answer values ("4","java", "4", true);


insert into Exam values ("1","A1", "anhdangnoidau", "1","60","2","2019/12/12");
insert into Exam values ("2","A2", "emdangnoidau", "2","60","3","2019/12/12");
insert into Exam values ("3","A3", "chidangnoidau", "3","60","1","2019/12/12");
insert into Exam values ("4","A4", "chaudangnoidau", "4","60","1","2019/12/12");



insert into ExamQuestion values ("1","4");
insert into ExamQuestion values ("2","3");
insert into ExamQuestion values ("3","2");
insert into ExamQuestion values ("4","1");





