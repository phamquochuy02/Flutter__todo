# To-Do List
Giới thiệu
Ứng dụng To-Do List là một ứng dụng giúp bạn quản lý danh sách công việc cần làm. Bạn có thể thêm và đánh dấu các công việc đã hoàn thành. Ứng dụng này sử dụng Flutter và lưu trữ dữ liệu bằng cách sử dụng SharedPreferences.

# Các chức năng chính
## Hiển thị danh sách công việc:
Danh sách công việc được hiển thị trong một ListView.
Mỗi công việc có một checkbox để đánh dấu là đã hoàn thành hoặc chưa hoàn thành.

## Thêm công việc mới:
Người dùng có thể nhập nội dung công việc mới vào một trường văn bản.
Sau khi người dùng nhấn nút "Thêm", công việc mới được thêm vào danh sách.

## Lưu trữ dữ liệu:
Danh sách công việc được lưu trữ bằng cách sử dụng SharedPreferences.
Khi ứng dụng khởi động lại, danh sách công việc sẽ được tải lại từ bộ nhớ.
Cấu trúc mã nguồn
Cấu trúc mã nguồn của ứng dụng To-Do App như sau:

task_model.dart: Định nghĩa lớp Task để biểu diễn một công việc.
task_controller.dart: Quản lý danh sách công việc, bao gồm thêm, sửa, xóa và lưu trữ dữ liệu.
task_list_view.dart: Hiển thị danh sách công việc và cung cấp giao diện để thao tác với danh sách.
main.dart: Hàm main để khởi chạy ứng dụng và tải danh sách công việc.

#Hướng dẫn sử dụng
Tải và cài đặt Flutter SDK.
Clone hoặc tải xuống mã nguồn từ kho lưu trữ.
Mở terminal và di chuyển đến thư mục chứa mã nguồn.
Chạy lệnh flutter pub get để cài đặt các gói phụ thuộc.
Kết nối thiết bị di động hoặc máy ảo và chạy lệnh flutter run để khởi chạy ứng dụng.

#Yêu cầu
Flutter SDK: [link](https://flutter.dev)

SharedPreferences package: [link](https://pub.dev/packages/shared_preferences)
