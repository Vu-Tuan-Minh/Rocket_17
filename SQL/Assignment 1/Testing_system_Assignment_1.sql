DROP DATABASE IF EXISTS ANHDADEN;
CREATE DATABASE ANHDADEN;
USE ANHDADEN;

CREATE TABLE DEPARTMENT(
	DepartmentID 	INT,
	DepartmentName 	VARCHAR(50)
);

CREATE TABLE POSITION (
	PositionID 		INT,
	PositionName 	VARCHAR(50)
);

CREATE TABLE `ACCOUNT` (
	AccountID 		INT,
    Email			VARCHAR(50),
	Username 		VARCHAR(50),
    FullName		VARCHAR(50),
    DepartmentID 	INT,
    PositionID		INT,
    PositionID		DATE
);

CREATE TABLE `Group` (
	GroupID 		INT,
    AccountID		int,
	JoinDate 		date
);

CREATE TABLE TypeQuestion (
	TypeID 			INT,
    TypeName		VARCHAR(50)
);

CREATE TABLE CategoryQuestion (
	CategoryID 		INT,
    CategoryName	VARCHAR(50)
);

CREATE TABLE Question (
	QuestionID 		INT,
    Content			VARCHAR(50),
	CategoryID 		int,
    TypeID			int,
    CreatorID 		INT,
    CreateDate		date
);

CREATE TABLE Exam (
	ExamID 			INT,
    _Code			VARCHAR(50),
	Title 			VARCHAR(50),
    CategoryID		int,
    Duration 		INT, -- 60 90
    CreatorID		INT,
    CreateDate		DATE
);

CREATE TABLE Answer (
	AnswerID 		INT,
    Content			VARCHAR(50),
	QuestionID 		int,
    isCorrect		BIT
);


CREATE TABLE ExamQuestion (
	ExamID 			INT,
    QuestionID		int
);





