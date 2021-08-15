use anhdaden;

drop procedure if exists get_account;
DELIMITER $$

-- 								`in` là thứ mình nhập vào `out` là thứ lấy ra tương ứng `in`
create procedure get_account (in account_ID INT,  OUT user_Name Varchar(50), out dp_name varchar(20))
	begin
		declare dpID int;
		select UserName, DepartmentID into user_Name,dpID from `Account` where AccountID = account_ID;
        select DepartmentName into dp_name from DEPARTMENT where DepartmentID = dpID;
    end $$
    DELIMITER ;
    	-- 					nhập 1 ra 2 giá trị tương ứng
    call  get_account (1, @usN, @dpName);

	select @usN, @dpName;
    select * from `department` where DepartmentID = @dpId;
    
    
    -- neu loi 1418 chay :SET GLOBAL log_bin_trust_function_creators = 1;
    -- cha insert thoải mái delete phải check con ngược lại 
    SET GLOBAL log_bin_trust_function_creators = 1;
    Drop function if exists `test_drop_f`
    DELIMITER $$
    create function test_drop_f (account_ID int) returns varchar(50)
    begin
		declare dpName  varchar(50);
        declare dpID int;
        
        select DepartmentID into dpID from  `Account` where AccountID = account_ID;
        select DepartmentName into dpName from DEPARTMENT where DepartmentID=dpID ;
        return dpName;
	end $$
    DELIMITER ;
	select test_drop_f (1);
    

    begin work;
		select * from Department;
		delete from Department;
    rollback;
    commit;
    
    -- Question 1: Tạo store để người dùng nhập vào tên phòng ban và in ra tất cả các account thuộc phòng ban đó
		DROP PROCEDURE IF EXISTS account_1;
        DELIMITER $$
			CREATE PROCEDURE account_1 (in ten_phong_ban nvarchar (50))
				begin
					select * 
                    from `account` a
                    join department d 
                    on a. DepartmentID = d.DepartmentID
                    where d.DepartmentName = ten_phong_ban;
                end $$
		DELIMITER ;
-- Question 2: Tạo store để in ra số lượng account trong mỗi group
		Drop procedure if exists account_2;
        DELIMITER $$
        Create procedure account_2 (in ten_group nvarchar (50))
			begin
            declare Acc_ID int;
				select *
                from `group` g
				join `Groupaccount` ga
                on ga.GroupID = g.GroupID
                where g.GroupName = ten_group;
			end $$
        DELIMITER ;
-- Question 3: Tạo store để thống kê mỗi type question có bao nhiêu question được tạo trong tháng hiện tại
		Drop procedure if exists type_question_mont;
        DELIMITER $$
			create procedure type_question_mont (in in_type_questin nvarchar(20))
				begin
					select count(q.QuestionID) , q.*
                    from typequestion tq
                    join question q
                    on tq.TypeID = q.TypeID
                    where tq.TypeName = in_type_questin
                    having q.CreateDate >= (now() - interval 2 month)
                    ;
                end $$
                
        DELIMITER ;
        
-- Question 4: Tạo store để trả ra id của type question có nhiều câu hỏi nhất
				-- Create function
CREATE OR REPLACE VIEW count_question AS (
		SELECT COUNT(QuestionID) AS countQuestion
        FROM question
        Group BY TypeID);  
SET GLOBAL log_bin_trust_function_creators = 1;


				-- DROP FUNCTION IF EXISTS f_max_question;
				-- DELIMITER $$
				-- CREATE FUNCTION f_max_question() RETURNS TINYINT
				-- BEGIN
				-- 	DECLARE max_question TINYINT;
				-- 	SELECT q.type_id  INTO max_question
				-- 	FROM question q
				--     JOIN typequestion tq ON tq.type_id = q.type_id
				--     GROUP BY q.type_id
				--     HAVING COUNT(q.type_id) = (SELECT MAX(countQuestion) 
				-- 								FROM count_question) 
				-- 	LIMIT 1;
				-- 	RETURN max_question;
				--     END $$
				-- DELIMITER ; 
				-- SELECT F_MAX_QUESTION() AS Type_id;
				--     
				-- -- Create Procedure    
				-- DROP PROCEDURE IF EXISTS p_max_question;
				-- DELIMITER $$
				-- CREATE PROCEDURE p_max_question(OUT max_question TINYINT) 
				-- BEGIN
				-- 	SELECT q.type_id  INTO max_question
				-- 	FROM question q
				--     JOIN typequestion tq ON tq.type_id = q.type_id
				--     GROUP BY q.type_id
				--     HAVING COUNT(q.type_id) = (SELECT MAX(countQuestion) 
				-- 								FROM count_question) 
				-- 	LIMIT 1;
				--     END $$
				-- DELIMITER ; 
				-- CALL p_max_question(@max_question);
				-- SELECT @max_question AS Type_id;

-- Question 5: Sử dụng store ở question 4 để tìm ra tên của type question
	SELECT type_name AS typeQuestionName
	FROM typequestion 
	WHERE type_id = @max_question;
-- Question 6: Viết 1 store cho phép người dùng nhập vào 1 chuỗi và trả về group có tên 
			--  chứa chuỗi của người dùng nhập vào hoặc trả về user có username chứa 
			--  chuỗi của người dùng nhập vào
-- Question 7: Viết 1 store cho phép người dùng nhập vào thông tin fullName, email và 
				--  trong store sẽ tự động gán:
				-- username sẽ giống email nhưng bỏ phần @..mail đi
				-- positionID: sẽ có default là developer
				-- departmentID: sẽ được cho vào 1 phòng chờ
				--  Sau đó in ra kết quả tạo thành công
-- Question 8: Viết 1 store cho phép người dùng nhập vào Essay hoặc Multiple-Choice
			-- 		 để thống kê câu hỏi essay hoặc multiple-choice nào có content dài nhất
-- Question 9: Viết 1 store cho phép người dùng xóa exam dựa vào ID
-- Question 10: Tìm ra các exam được tạo từ 3 năm trước và xóa các exam đó đi (sử 
			--  dụng store ở câu 9 để xóa)
			--  Sau đó in số lượng record đã remove từ các table liên quan trong khi 
			--  removing
-- Question 11: Viết store cho phép người dùng xóa phòng ban bằng cách người dùng 
			--  nhập vào tên phòng ban và các account thuộc phòng ban đó sẽ được 
			--  chuyển về phòng ban default là phòng ban chờ việc
-- Question 12: Viết store để in ra mỗi tháng có bao nhiêu câu hỏi được tạo trong năm nay
-- 2
DROP PROCEDURE IF EXISTS sp_CountQuesInMonth; 
DELIMITER $$ 
CREATE PROCEDURE sp_CountQuesInMonth() 
	BEGIN
    WITH CTE_12Months AS ( 
    SELECT 1 AS MONTH 
    UNION SELECT 2 AS MONTH 
    UNION SELECT 3 AS MONTH 
    UNION SELECT 4 AS MONTH 
    UNION SELECT 5 AS MONTH 
    UNION SELECT 6 AS MONTH 
    UNION SELECT 7 AS MONTH 
    UNION SELECT 8 AS MONTH 
    UNION SELECT 9 AS MONTH 
    UNION SELECT 10 AS MONTH 
    UNION SELECT 11 AS MONTH 
    UNION SELECT 12 AS MONTH ) 
    SELECT M.MONTH, count(month(Q.create_date)) AS SL 
    FROM CTE_12Months M 
    LEFT JOIN 
		(SELECT * 
        FROM question Q1 
        WHERE year(Q1.create_date) = year(now()) ) Q ON M.MONTH = month(Q.create_date) 
        GROUP BY M.MONTH; 
	END$$ 
    DELIMITER ;
Call sp_CountQuesInMonth();
-- Question 13: Viết store để in ra mỗi tháng có bao nhiêu câu hỏi được tạo trong 6 
			--  tháng gần đây nhất
			--  (Nếu tháng nào không có thì sẽ in ra là "không có câu hỏi nào trong 
			-- tháng")

    