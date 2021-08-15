use anhdaden;

-- Question 1: Tạo trigger không cho phép người dùng nhập vào Group có ngày tạo trước 1 năm trước

Drop trigger if exists t1;
DELIMITER $$
	create trigger t1
    before insert on `group`
    for each row
    begin
		if 	new.`CreateDate`< (now() - interval 1 year)
			then
            signal sqlstate '12345'
            set message_text = "cai nay de lam gi"; 
        end if;
    end $$
DELIMITER ;
 insert into `group` values ("6","a","3", "2018-8-8");
 
 --  QQQQQQ 
Drop trigger if exists t2;
DELIMITER $$
	create trigger t2
    before delete on `answer`
    for each row
    begin
		delete 
        from question a
        
        where QuestionID = old.a.QuestionID;
    end $$
DELIMITER ;

delete from question where QuestionID = 4;
 select * from question;
 insert into answer value ("6", "adouma", "1" ,true);
 insert into question values ();
 select * from answer;
 
--  Question 2: Tạo trigger Không cho phép người dùng thêm bất kỳ user nào vào 
		--  department "Sale" nữa, khi thêm thì hiện ra thông báo "Department
		--  "Sale" cannot add more user"
	DELIMITER $$
		create trigger q2
        before insert on `account`
        for each row
			begin 
            
				if 	new.DepartmentID = 1
						then
						signal sqlstate '12345'
						set message_text = "Department ""Sale"" cannot add more user"; 
				end if;
            end $$
        
    DELIMITER ;
-- Question 3: Cấu hình 1 group có nhiều nhất là 5 user
			DELIMITER $$
				create trigger q3
					before insert on groupaccount
                    for each row
                     begin 
						if
							new.groupID > 5
                            then 
                            signal sqlstate '12345'
                            set message_text = "max 5";
                        end if;
                     end $$
            DELIMITER ;

-- Question 4: Cấu hình 1 bài thi có nhiều nhất là 10 Question
-- Question 5: Tạo trigger không cho phép người dùng xóa tài khoản có email là 
--  admin@gmail.com (đây là tài khoản admin, không cho phép user xóa), 
--  còn lại các tài khoản khác thì sẽ cho phép xóa và sẽ xóa tất cả các thông 
--  tin liên quan tới user đó
-- Question 6: Không sử dụng cấu hình default cho field DepartmentID của table 
--  Account, hãy tạo trigger cho phép người dùng khi tạo account không điền 
--  vào departmentID thì sẽ được phân vào phòng ban "waiting Department"
-- Question 7: Cấu hình 1 bài thi chỉ cho phép user tạo tối đa 4 answers cho mỗi 
--  question, trong đó có tối đa 2 đáp án đúng.
-- Question 8: Viết trigger sửa lại dữ liệu cho đúng: 
--  Nếu người dùng nhập vào gender của account là nam, nữ, chưa xác định 
--  Thì sẽ đổi lại thành M, F, U cho giống với cấu hình ở database
-- Question 9: Viết trigger không cho phép người dùng xóa bài thi mới tạo được 2 ngày
-- Question 10: Viết trigger chỉ cho phép người dùng chỉ được update, delete các 
			--  question khi question đó chưa nằm trong exam nào
            
-- Question 12: Lấy ra thông tin exam trong đó:
			-- Duration <= 30 thì sẽ đổi thành giá trị "Short time"
			-- 30 < Duration <= 60 thì sẽ đổi thành giá trị "Medium time"
		-- Duration > 60 thì sẽ đổi thành giá trị "Long time"
        SELECT tenchuyenmuc, Code
(CASE code
WHEN 01 THEN 'Laptrinh-Quantrimang.com'
WHEN 02 THEN 'Congnghe-Quantrimang.com'
WHEN 03 THEN 'Cuocsong-Quantrimang.com'
ELSE 'Khoahoc-Quantrimang.com'
END) AS Chuyenmuc
FROM chuyenmuc
ORDER BY Code

        CASE bieuthuc_dauvao
WHEN bieuthuc_1 THEN ketqua_1
WHEN bieuthuc_2 THEN ketqua_2
...
WHEN bieuthuc_n THEN ketqua_n
ELSE ketqua_khac
END

Hoặc Searched CASE

CASE
WHEN dieukien_1 THEN ketqua_1
WHEN dieukien_2 THEN ketqua_2
...
WHEN dieukien_n THEN ketqua_n
ELSE ketqua_khac
END
        
        
         
        
        
-- Question 13: Thống kê số account trong mỗi group và in ra thêm 1 column nữa có tên 
			--  là the_number_user_amount và mang giá trị được quy định như sau
			--  Nếu số lượng user trong group =< 5 thì sẽ có giá trị là few
			-- Nếu số lượng user tr	ong group <= 20 và > 5 thì sẽ có giá trị là normal
			-- Nếu số lượng user trong group > 20 thì sẽ có giá trị là higher
			
-- Question 14: Thống kê số mỗi phòng ban có bao nhiêu user, nếu phòng ban nào 
			--  không có user thì sẽ thay đổi giá trị 0 thành "Không có User"
	

 