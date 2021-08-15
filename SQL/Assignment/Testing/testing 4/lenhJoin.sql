-- Exercise 1: Join 
		use anhdaden;
-- Question 1: Viết lệnh để lấy ra danh sách nhân viên và thông tin phòng ban của họ
		select A.* , D.DepartmentName
        from `Account` A
        join DEPARTMENT D on A.DepartmentID = D.DepartmentID;
-- Question 2: Viết lệnh để lấy ra thông tin các account được tạo sau ngày 20/12/2010 
		select A.*
        from `Account` A
		where CreateDate > 2010/12/20;
-- Question 3: Viết lệnh để lấy ra tất cả các developer 
		select A.*, P.PositionName
        from `Account` A
		join POSITION P on A.PositionID = P.PositionID 
        where PositionName = 'Dev';
-- Question 4: Viết lệnh để lấy ra danh sách các phòng ban có >3 nhân viên
		select D.* 
        from `Account` A
        join  DEPARTMENT D 
        on A.DepartmentID = D.DepartmentID
        group by D.DepartmentID
        having Count(D.DepartmentID) >= 2;
-- Question 5: Viết lệnh để lấy ra danh sách câu hỏi được sử dụng trong đề thi nhiều nhất
		select *
        from Question Q
        join ExamQuestion EQ
        on Q.QuestionID = EQ.QuestionID
        group by EQ.QuestionID
        order by count(EQ.QuestionID) DESC
        limit 1;
						-- SELECT q.content, COUNT(e.exam_id) as number_of_exams
						-- FROM question q
						-- INNER JOIN examquestion e ON q.question_id = e.question_id
						-- GROUP BY e.question_id
						-- HAVING number_of_exams = (SELECT MAX(nb) 
						-- 							FROM (SELECT COUNT(E.exam_id) AS nb
						-- 									FROM examquestion E
						-- 									GROUP BY e.question_id) AS COUNTEX);
-- Question 6: Thông kê mỗi category Question được sử dụng trong bao nhiêu Question
		select CQ.*, count(Q.CategoryID)
        from categoryQuestion CQ
        left join Question Q
        on CQ.CategoryID = Q.categoryID
        group by  CQ.CategoryID;
-- Question 7: Thông kê mỗi Question được sử dụng trong bao nhiêu Exam
		select Q.*, count(E.QuestionID)
        from Question Q
        left join ExamQuestion E
        on Q.QuestionID = E.QuestionID
        group by E.QuestionID;
        

-- Question 8: Lấy ra Question có nhiều câu trả lời nhất
		select Q.*, count(A.QuestionID)
        from Question Q
        join Answer A
        on Q.QuestionID = A.QuestionID
        group by A.QuestionID
        limit 4;
-- Question 9: Thống kê số lượng account trong mỗi group 
		select B.*, count(A.AccountID)
        from `Account` A
        right join GroupAccount B
        on A.AccountID = B.AccountID
        group by A.AccountID
        ;
-- Question 10: Tìm chức vụ có ít người nhất
		select B.*,count(A.AccountID) 
        from `Account` A
        join DEPARTMENT B
        on A.DepartmentID = B.DepartmentID
        group by A.DepartmentID 
        order by count(A.DepartmentID) asc
		limit 1;
-- Question 11: Thống kê mỗi phòng ban có bao nhiêu dev, test, scrum master, PM
		select c.* , count(A.DepartmentID)
        from `Account` A
        join DEPARTMENT b
        on A.DepartmentID = b.DepartmentID
        join POSITION c
        on A.PositionID = c.PositionID
        group by A.DepartmentID;
-- Question 12: Lấy thông tin chi tiết của câu hỏi bao gồm: thông tin cơ bản của question, loại câu hỏi, ai là người tạo ra câu hỏi, câu trả lời là gì, …
		select A.* , b.CategoryName , c.Content as 'cau tra loi'
        from Question A
        join CategoryQuestion b
        on A.CategoryID = b.CategoryID
        join Answer c
        on A.QuestionID = c.QuestionID
       
        ;
-- Question 13: Lấy ra số lượng câu hỏi của mỗi loại tự luận hay trắc nghiệm
SELECT t.TypeName, COUNT(q.TypeID)
FROM Question q
JOIN TypeQuestion t ON q.TypeID = t.TypeID
GROUP BY t.TypeName;
-- Question 14:Lấy ra group không có account nào
		select *
        from  `Group` G
        left join GroupAccount GA on G.GroupID = GA.GroupID
         where GA.GroupID IS NULL
        ;
-- Question 15: Lấy ra account không có group nào
		select *
        from `Account` A
        left join GroupAccount GA on A.AccountID = GA.AccountID
        where GA.AccountID is null;
        
-- Question 16: Lấy ra question không có answer nào
-- Exercise 2: Union
-- Question 17: 
-- a) Lấy các account thuộc nhóm thứ 1
-- b) Lấy các account thuộc nhóm thứ 2
-- c) Ghép 2 kết quả từ câu a) và câu b) sao cho không có record nào trùng nhau
		select GA.GroupID, A.FullName
        from GroupAccount GA
        join `Account` A 
        on Ga.AccountID = A.AccountID
        group by Ga.AccountID = 1
        union
        select;
-- Question 18: 
-- a) Lấy các group có lớn hơn 5 thành viên
-- b) Lấy các group có nhỏ hơn 7 thành viên
-- c) Ghép 2 kết quả từ câu a) và câu b)
SELECT a.account_id, a.full_name
FROM `account` a
JOIN groupaccount g ON a.account_id = g.account_id
WHERE g.group_id = 1
UNION
SELECT a.account_id, a.full_name
FROM `account` a
JOIN groupaccount g ON a.account_id = g.account_id
WHERE g.group_id = 2;