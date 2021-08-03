DROP DATABASE IF EXISTS Ex1;
Create database Ex1;
USE Ex1;

create table Trainee(
TraineeID smallint auto_increment PRIMARY KEY,
FullName Nvarchar (50) not null,
BirthDate Date not null,
Gender enum('male', 'female','unknown') default"unknown",
ET_IQ tinyint unsigned check(ET_IQ <=20),
ET_Gmath tinyint unsigned check(ET_Gmath <=20),
ET_English tinyint unsigned check (ET_English <= 50),
TrainingClass varchar(15),
EvaluationNotes Nvarchar (50)
);

-- Change the table TRAINEE to add vti_acc
alter table Trainee
add column VTI_account smallint unsigned not null unique key;


