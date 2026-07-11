ĐỀ BÀI
Tạo database và schema
Database: SalesDB
Schema: sales (giúp nhóm các bảng lại với nhau)
Tạo các bảng và cột
Bảng Customers (khách hàng)
customer_id: số nguyên tự tăng, khóa chính
first_name: tên, tối đa 50 ký tự, không được bỏ trống
last_name: họ, tối đa 50 ký tự, không được bỏ trống
email: email khách hàng, không trùng nhau, không được bỏ trống
phone: số điện thoại (có thể bỏ trống)
 

Bảng Products (sản phẩm)
product_id: số nguyên tự tăng, khóa chính
product_name: tên sản phẩm, tối đa 100 ký tự, không bỏ trống
price: giá sản phẩm, kiểu số thực, không bỏ trống
stock_quantity: số lượng còn trong kho, kiểu số nguyên, không bỏ trống
 

Bảng Orders (đơn hàng)
order_id: số nguyên tự tăng, khóa chính
customer_id: tham chiếu đến khách hàng (khóa ngoại)
order_date: ngày đặt hàng, không được bỏ trống
 

Bảng OrderItems (chi tiết đơn hàng, mỗi đơn hàng có nhiều sản phẩm)
order_item_id: số nguyên tự tăng, khóa chính
order_id: tham chiếu đến bảng Orders (khóa ngoại)
product_id: tham chiếu đến bảng Products (khóa ngoại)
quantity: số lượng sản phẩm trong đơn, không được nhỏ hơn 1
