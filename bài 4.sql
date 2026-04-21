-- so sánh 2 cách
-- cách 1(dùng having): gom nhóm xong mới lọc dữ liệu, gánh nặng ram cao vì phải lư
-- dữ liệu suốt quá trình tạo nhóm, tốn CPU vì máy tính pk tính toán cả các dữ liệu rác chưa được lọc
--  cách 2(dùng where) : lọc dữ liệu xong mới nhóm, loại bỏ được nhiều bản rác, 
-- chỉ tập trung vào tính toán trên các dữ liệu đã được dọn sạch  

-- câu lệnh hoàn chỉnh

select *from bookings
where status = 'COMPLETED'
group by hotel_id
having avg(total_price)>3000000 and count(booking_id)>50;