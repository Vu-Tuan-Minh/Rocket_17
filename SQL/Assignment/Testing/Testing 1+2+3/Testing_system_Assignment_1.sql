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

CREATE TABLE `Account` (
	AccountID 		TINYINT UNSIGNED auto_increment PRIMARY KEY ,
    Email			VARCHAR(50) NOT NULL,
	Username 		VARCHAR(50) NOT NULL,
    FullName		NVARCHAR(50) NOT NULL,
    DepartmentID 	TINYINT UNSIGNED NOT NULL,
    PositionID		TINYINT UNSIGNED NOT NULL,
    CreateDate		DATETIME DEFAULT NOW(),
    
    FOREIGN KEY (DepartmentID) REFERENCES DEPARTMENT(DepartmentID) ,
    FOREIGN KEY (PositionID) REFERENCES POSITION (PositionID)
);

CREATE TABLE `Group` (
	GroupID 		TINYINT UNSIGNED auto_increment PRIMARY KEY,
    GroupName		VARCHAR(20) NOT NULL,
    CreatorID		TINYINT UNSIGNED NOT NULL,
	CreateDate 		DATETIME DEFAULT NOW(),
    
FOREIGN KEY (CreatorID) REFERENCES `Account`(AccountID)
);
CREATE TABLE GroupAccount (
	GroupID 		TINYINT UNSIGNED NOT NULL,
    AccountID		TINYINT UNSIGNED  NOT NULL,
    JoinDate		DATETIME DEFAULT  NOW(),
    
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
    CreateDate		DATETIME DEFAULT  NOW(),
    
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
    CreateDate		DATETIME DEFAULT  NOW(),
    
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
insert into POSITION values ("3","Scrum Master");
insert into POSITION values ("4","PM");


insert into `ACCOUNT` values ("1","a@gmail.com","Aphen","Ph??n V??n A","1","1","2019/5/2");
insert into `ACCOUNT` values ("2","b@gmail.com","Bom","Mai Nam H???i","3","2","2019/2/2");
insert into `ACCOUNT` values ("3","N@gmail.com","Nghi","Tr???n Nguy???n Minh Nghi","2","3","2019/2/2");
insert into `ACCOUNT` values ("4","C@gmail.com","Red","Cream","2","3","2019/2/2");
insert into `ACCOUNT` values ("5","X@gmail.com","XD","Xdrex","2","3","2019/2/2");
insert into `ACCOUNT` values ("6","T@gmail.com","SKT","T1","1","3","2019/2/2");

insert into `Group` values ("1","PJJ","1","2010/9/9");
insert into `Group` values ("2","PtJ","2","2018/9/9");
insert into `Group` values ("3","PxJ","1","2019/9/9");
insert into `Group` values ("4","PzJ","2","2020/9/9");
insert into `Group` values ("5","PiJ","1","2021/9/9");

insert into GroupAccount values ("1","1","2019/5/2");
insert into GroupAccount values ("2","2","2019/6/1");
insert into GroupAccount values ("3","3","2019/7/12");
insert into GroupAccount values ("4","4","2019/8/11");
insert into GroupAccount values ("4","5","2019/9/10");
insert into GroupAccount values ("1","4","2019/8/11");
insert into GroupAccount values ("2","5","2019/9/10");
insert into GroupAccount values ("5","6","2019/8/11");
insert into GroupAccount values ("5","6","2019/9/10");

insert into TypeQuestion values ("1","Essay");
insert into TypeQuestion values ("2","Multiple-Choice");



insert into CategoryQuestion values ("1","Java");
insert into CategoryQuestion values ("2","NET");
insert into CategoryQuestion values ("3","SQL");
insert into CategoryQuestion values ("4","Postman");
insert into CategoryQuestion values ("5","Ruby");


insert into Question values ("1","anh da den hoc nganh gi", "1", "1","3","2019/1/2");
insert into Question values ("2","anh da vang hoc nganh gi", "2", "1","2","2019/1/3");
insert into Question values ("3","anh da trang hoc nganh gi", "3", "1","1","2019/1/4");
insert into Question values ("4","anh da do hoc nganh gi", "5", "1","1","2019/1/5");

insert into Answer values ("1","java", "1", true);
insert into Answer values ("2","jav", "1", true);
insert into Answer values ("3","ava", "1", true);
insert into Answer values ("4","java", "4", true);


insert into Exam values ("1","A1", "anhdangnoidau", "1","60","2","2019/12/12");
insert into Exam values ("2","A2", "emdangnoidau", "2","60","3","2019/11/12");
insert into Exam values ("3","A3", "chidangnoidau", "3","60","1","2019/10/12");
insert into Exam values ("4","A4", "chaudangnoidau", "4","60","1","2019/9/12");



insert into ExamQuestion values ("1","4");
insert into ExamQuestion values ("2","3");
insert into ExamQuestion values ("3","2");
insert into ExamQuestion values ("4","1");




-- Question 2: l???y ra t???t c??? c??c ph??ng ban
		select * from DEPARTMENT;
-- Question 3: l???y ra id c???a ph??ng ban "Sale"
		select DepartmentID 
        from DEPARTMENT 
        where DepartmentName = "SALES";
-- Question 4: l???y ra th??ng tin account c?? full name d??i nh???t
		SELECT		*
		FROM		`Account`
		WHERE		length(FullName) IN (SELECT	max(length(FullName)) 
										FROM	`Account`);
-- Question 5: L???y ra th??ng tin account c?? full name d??i nh???t v?? thu???c ph??ng ban c?? id = 3
		SELECT		*
		FROM		`Account`
		WHERE		length(FullName) IN (SELECT	max(length(FullName)) 
										FROM	`Account`) AND DepartmentID = 3;
-- Question 6: L???y ra t??n group ???? tham gia tr?????c ng??y 20/12/2019
		select * 
        from `Group`
        where CreateDate < '2019/12/20';
-- Question 7: L???y ra ID c???a question c?? >= 4 c??u tr??? l???i
		select QuestionID ,count(AnswerID) as answers_amount
		from Answer 
		group by QuestionID
		having count(AnswerID) >= 2;
-- Question 8: L???y ra c??c m?? ????? thi c?? th???i gian thi >= 60 ph??t v?? ???????c t???o tr?????c ng??y 20/12/2019
		select ExamID
		from Exam
		where CreateDate < '2019/12/20'
		and Duration >= 60;
-- Question 9: L???y ra 5 group ???????c t???o g???n ????y nh???t
		select * from `Group` 
		order by CreateDate DESC
		limit 5;
-- Question 10: ?????m s??? nh??n vi??n thu???c department c?? id = 2
		select count(AccountID)
		from `Account`
		where DepartmentID = 2; 
-- Question 11: L???y ra nh??n vi??n c?? t??n b???t ?????u b???ng ch??? "D" v?? k???t th??c b???ng ch??? "o"
		select * 
        from `account`
        where FullName LIKE ("%D%o") or ('%Do');
-- Question 12: X??a t???t c??? c??c exam ???????c t???o tr?????c ng??y 20/12/2019
		delete from Exam
		where CreateDate > '2019/12/11';
-- Question 13: X??a t???t c??? c??c question c?? n???i dung b???t ?????u b???ng t??? "c??u h???i"
		Delete from Question
		where Content  Like  'c??u h???i%';
-- Question 14: Update th??ng tin c???a account c?? id = 5 th??nh t??n "Nguy???n B?? L???c" v?? email th??nh loc.nguyenba@vti.com.vn
		Update `Account` 
		set FullName ='Nguy???n B?? L???c',
		Email = 'loc.nguyenba@vti.com.vn'
		where AccountID = 5;
-- Question 15: update account c?? id = 5 s??? thu???c group c?? id = 4
		Update `Group`
		set GroupID = 4
		where AccountID = 5;





