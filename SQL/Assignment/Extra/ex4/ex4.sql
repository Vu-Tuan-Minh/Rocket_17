DROP DATABASE IF EXISTS Extra;
CREATE DATABASE Extra;
USE Extra;

CREATE TABLE Department(
Department_Number 				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
Department_Name 				NVARCHAR(30)
);

CREATE TABLE Employee(
Employee_Number 				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
Employee_Name 					NVARCHAR(50),
Department_Number 				TINYINT UNSIGNED,

FOREIGN KEY (Department_Number) REFERENCES Department(Department_Number)
);


CREATE TABLE Employee_Skill_Table(
Employee_Number 				TINYINT UNSIGNED,
Skill_Code						NVARCHAR(50),
Date_Registered 				datetime DEFAULT NOW(),

FOREIGN KEY (Employee_Number) REFERENCES Employee(Employee_Number)
);

INSERT INTO Department 	( Department_Name)
VALUES 					('anhdaden'),
						('anhdaden1'),
						('anhdaden5'),
						('anhdaden6');

INSERT INTO Employee 	( Employee_Name, Department_Number)
VALUES 					('daden'		,  	1	),
						('daden1'		, 	2	),
						('anden2'		,	3	),
						('anhdn3'		,	4	),
						('anhen4'		,	1	),
						('ann5'			,	1	),
						('anhdaden6'	,	1	);
                        
INSERT INTO Employee_Skill_Table 
						( Employee_Number, Skill_Code)
VALUES 					( 		2		,  	"jav"	),
						(		3		, 	"ruby"	),
						(		6		,	"python"	),
						(		5		,	"C++"	),
						(		1		,	"node"	),
						(		7		,	"jav"	),
						(		4		,	"jav"	);
                        
-- Question 3: Viết lệnh để lấy ra danh sách nhân viên (name) có skill Java Hướng dẫn: sử dụng UNION
			select A.Employee_Number ,A.Employee_Name
            from Department A
            join Employee B 
            on A.Department_Number = B.Department_Number
		-- k chay
            union
            
            select Employee_Number, Employee_Name
            from Employee B
            join Employee_Skill_Table X
            on B.Employee_Number = X.Employee_Number
            where Skill_Code = "jav";
            
            
            
-- Question 4: Viết lệnh để lấy ra danh sách các phòng ban có >3 nhân viên
with aduto as (
		select Department_Number
        from Employee
        group by Department_Number
        having count(Department_Number) > 3
        )
select * from Department where Department_Number = (select * from aduto);
-- Question 5: Viết lệnh để lấy ra danh sách nhân viên của mỗi văn phòng ban. Hướng dẫn: sử dụng GROUP BY
select a.* ,count(b.Employee_Number) as soluong
from Department a
left join Employee b 
on a.Department_Number = b.Department_Number
group by b.Department_Number;
-- Question 6: Viết lệnh để lấy ra danh sách nhân viên có > 1 skills.Hướng dẫn: sử dụng DISTINCT
select distinct Skill_Code
from Employee_Skill_Table
where Skill_Code > 2
