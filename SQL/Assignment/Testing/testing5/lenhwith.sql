use anhdaden;
-- cau lenh in ra acc co group la PJJ 

with a as (select GroupID 
									from `Group`
									where GroupName = "PJJ"),
b as ( select AccountID 
					from GroupAccount
					where	GroupID = (select * from a) )
select *
from `Account`
where AccountID IN ( select * from b );
                    
                    
-- Question 2: Tạo view có chứa thông tin các account tham gia vào nhiều group nhất
with adu as (select max(aduma)
				from	(select count(AccountID) as aduma
												from groupaccount
												group by AccountID) as Y)
select A.Email,A.Username,A.FullName,count(GA.AccountID) as soluong
from `Account` A
left join GroupAccount GA
on A.AccountID = GA.AccountID
group by GA.AccountID
having count(GA.AccountID) = (
								select * from adu
);



-- Question 3: Tạo view có chứa câu hỏi có những content quá dài (content quá 300 từ được coi là quá dài) và xóa nó đi
		with quadai as (select QuestionID 
							from question
                            where length(Content) > 30)
        delete from question
        where QuestionID = (select * from quadai);

-- Question 4: Tạo view có chứa danh sách các phòng ban có nhiều nhân viên nhất

with soluong  As
	(
    select DepartmentID, count(DepartmentID) as so_luong_nhan_vien 
    from `Account`
    group by DepartmentID
    ),
    max1 as (
    select max(so_luong_nhan_vien) as max_count
    from soluong
    )
    select *, count(DepartmentID) 
    from `Account`
    group by DepartmentID
    having count(DepartmentID) = (select * from max1) ;
    
-- Question 5: Tạo view có chứa tất các các câu hỏi do user họ Nguyễn tạ

with idname as (
select * 
from `Account` 
where FullName LIKE "Phèn%")
-- CreatorID
select QuestionID ,Content
from Question
where CreatorID = (select AccountID from idname);




