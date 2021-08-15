DROP DATABASE Ex6;
CREATE DATABASE Ex6;
USE Ex6;



create table Employee(
EmployeeID 						smallint unsigned auto_increment primary key,
EmployeeLastName 				Nvarchar (50) not null,
EmployeeFirtName 				Nvarchar (50) not null,
EmployeeHideDate				datetime not null,
EmployeeStatus					Nvarchar (50),
SupervisorID					smallint unsigned UNIQUE not null,
ProjectDetailt					Nvarchar(50),
SocialSecurityNumber 			varchar (20) not null,

foreign key (EmployeeID) references Employee(SupervisorID)
);
CREATE TABLE Projects(
ProjectID 						tinyint unsigned auto_increment primary key,
managerID 						smallint unsigned  not null,
ProjectName 					tinyint unsigned  not null,
ProjectStarDate					date  not null,
ProjectDescription				datetime  not null,
ProjectCompletedOn				date  not null,
ProjectDetailt					Nvarchar(50),

foreign key (managerID) references Employee(EmployeeID)

);
CREATE TABLE ProjectModules(
ModuleID 						tinyint unsigned auto_increment primary key,
ProjectID 						tinyint unsigned not null,
EmployeeID 						smallint unsigned not null,
ProjectModulesDate 				date  not null,
ProjectModulesCompledOn			datetime  not null,
ProjectModulesDescription		Nvarchar(50),

foreign key (ProjectID) references Projects(ProjectID),
foreign key (EmployeeID) references Employee(EmployeeID)
);

create table WorkDone(
WorkDoneID 						tinyint unsigned auto_increment primary key,
ModuleID 						tinyint unsigned not null,
EmployeeID 						smallint unsigned not null,
WorkDoneDate	 				datetime  not null,
WorkDoneDescription				datetime  not null,
WorkDoneStatus					Nvarchar(50),

foreign key (ModuleID) references ProjectModules (ModuleID),
foreign key (EmployeeID) references Employee(EmployeeID)
);