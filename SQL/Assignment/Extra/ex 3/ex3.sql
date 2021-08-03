-- Question 1: Thêm ít nhất 10 bản ghi vào table
use add_colum;
	insert into Trainee(FullName, 		BirthDate, 			Gender, 		ET_IQ , 		ET_Gmath,			 ET_English, 			TrainingClass,			EvaluationNotes , 		VTI_account)
    value
						("Vũ Thánh",		"2000/5/15",		"Male",		"1"	,				"1",				"1",					"1"	,						"pro1",					"acc01"),
                        ("Quan Vân Trường",	"2000/4/15",		"Male",		"16"	,			"10",				"2",					"L3Q",						"pro1",					"acc02"),
                        ("Lưu Bị",			"1998/8/1",			"Male",		"18"	,			"19",				"3",					"L3Q",						"pro1",					"acc03"),
                        ("Trương Phi",		"2001/1/18",		"Male",		"13"	,			"18",				"4",					"L3Q",						"pro1",					"acc04"),
                        ("Tào Tháo",		"1999/4/6",			"Male",		"19"	,			"17",				"5",					"L3Q",						"pro1",					"acc05"),
                        ("Quách Gia",		"2000/4/16",		"Male",		"20"	,			"16",				"6",					"L3Q",						"pro1",					"acc06"),
                        ("Quan Bình",		"2009/10/5",		"Male",		"15"	,			"15",				"7",					"L3Q",						"pro1",					"acc07"),
                        ("Khổng Minh",		"2000/6/19",		"Male",		"19"	,			"14",				"8",					"L3Q",						"pro1",					"acc08"),
                        ("Triệu Vân",		"2004/7/7",			"female",	"17"	,			"13",				"9",					"L3Q",						"pro1",					"acc09"),
                        ("Lý Tín",			"1899/7/13",		"Male",		"12"	,			"12",				"10",					"L3Q",						"pro1",					"acc10")
                        
    ;
-- Question 2: Viết lệnh để lấy ra tất cả các thực tập sinh đã vượt qua bài test đầu vào, 
-- nhóm chúng thành các tháng sinh khác nhau
select * from Trainee
where ET_IQ >= 5 and ET_Gmath >=5 and ET_English>=10
group by month(BirthDate);
-- Question 3: Viết lệnh để lấy ra thực tập sinh có tên dài nhất, lấy ra các thông tin sau: 
-- tên, tuổi, các thông tin cơ bản (như đã được định nghĩa trong table)
select max(length(FullName)),FullName, BirthDate,Gender from Trainee;
-- Question 4: Viết lệnh để lấy ra tất cả các thực tập sinh là ET, 1 ET thực tập sinh là 
-- những người đã vượt qua bài test đầu vào và thỏa mãn số điểm như sau:
--  ET_IQ + ET_Gmath>=20
--  ET_IQ>=8
--  ET_Gmath>=8
--  ET_English>=18
select * from Trainee
where ET_IQ >= 8 and ET_Gmath >=8 and ET_English>=18;
-- Question 5: xóa thực tập sinh có TraineeID = 3
delete from Trainee where TraineeID = 3;
-- Question 6: Thực tập sinh có TraineeID = 5 được chuyển sang lớp "2". Hãy cập nhật 
-- thông tin vào database
update Trainee set TrainingClass = 3 where TraineeID = 5;