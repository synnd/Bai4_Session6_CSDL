-- so sánh 2 cách
-- cách 1(dùng having): gom nhóm xong mới lọc dữ liệu, gánh nặng ram cao vì phải lư
-- dữ liệu suốt quá trình tạo nhóm, tốn CPU vì máy tính pk tính toán cả các dữ liệu rác chưa được lọc
--  cách 2(dùng where) : lọc dữ liệu xong mới nhóm, loại bỏ được nhiều bản rác, 
-- chỉ tập trung vào tính toán trên các dữ liệu đã được dọn sạch  
-- vi dụ có 10tr dữ liệu
-- Cách 1 : sẽ pk xử lí 10tr dòng, tính toán case when cho từng dòng, pk giữ nhiều bộ nhớ kkhi group by 
--  và có nhiều dữ liệu không cần thiết 
-- ==> Dẫn đến việc tốn tài nguyên, query chậm rõ rệt 
-- Cách 2 : cpu chỉ pk xử lí dữ liệu khi đã lọc bớt rất nhiều bản ghi , bộ nhớ RAM pk lưu trữ ít dữ liệu hơn
-- ==> Kết quả là tính toán nhanh hơn, Query scale tốt hơn khi dữ liệu lơn


-- câu lệnh hoàn chỉnh
select hotel_id
from bookings
where status = 'COMPLETED'
group by hotel_id
having avg(total_price)>3000000 and count(booking_id)>50;
