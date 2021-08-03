use EX2_3;
-- exer2
create table Data1(
ID 				mediumint UNSIGNED AUTO_INCREMENT PRIMARY KEY ,
`Name` 			VARCHAR(50) NOT NULL, 
`Code` 			VARCHAR(5) NOT NULL,
ModifiedDate 	datetime
);

create table data2(
data_id			MEDIUMINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
`name`			VARCHAR(50),
BirtDate		Date,
Gender			bit,
IsDeletedFlag 	bit
);