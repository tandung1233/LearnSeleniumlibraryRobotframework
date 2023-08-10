*** Settings ***
Resource            ../keywords/common.robot
# Test Setup: Trước khi thực hiện test case, Robot Framework sẽ thực hiện các bước được định nghĩa trong phần "Test Setup". Điều này thường được sử dụng để chuẩn bị các tài nguyên, thiết lập môi trường hoặc điều kiện cần thiết trước khi bắt đầu thực hiện test case.
Test Setup          Setup
# Test Teardown: Sau khi hoàn thành test case (dù test case thành công hay không thành công), Robot Framework sẽ thực hiện các bước được định nghĩa trong phần "Test Teardown". Điều này thường được sử dụng để dọn dẹp tài nguyên, giải phóng bộ nhớ hoặc thực hiện các công việc kết thúc sau khi test case kết thúc.
Test Teardown       Tear Down
# when, then chỉ có tác dụng giúp người đọc dễ hiểu hơn thôi chứ không có gì to tác cả 

*** Test Cases ***
# Đây là tên của bài kiểm tra (test case). Mỗi bài kiểm tra được đặt tên sao cho dễ hiểu, mô tả đủ thông tin về nội dung của bài kiểm tra. Trong trường hợp này, tên bài kiểm tra là "DN-01 Verify that Đăng nhập successfully with valid Email and Mật khẩu" có thể hiểu là "Xác minh rằng Đăng nhập thành công với Email và Mật khẩu hợp lệ".
DN-01 Verify that Đăng nhập successfully with valid Email and Mật khẩu
# [Tags] được sử dụng để gán các nhãn (tags) cho bài kiểm tra. Các nhãn này là các từ khóa dùng để phân loại và chạy nhóm bài kiểm tra cụ thể.
# Trong trường hợp này, bài kiểm tra được gán hai nhãn là @smoketest và @regression. Các nhãn này có thể được định nghĩa theo nhu cầu của dự án hoặc công ty, để giúp quản lý và thực thi các bài kiểm tra một cách có tổ chức hơn. Ví dụ, nhãn @smoketest thường được sử dụng để chạy các bài kiểm tra cơ bản và nhanh chóng để đảm bảo tính ổn định của ứng dụng, trong khi nhãn @regression có thể được sử dụng để chạy các bài kiểm tra kiểm tra lại tính năng sau khi đã thực hiện thay đổi.
    [Tags]    @smoketest    @regression
    # Đây là bước thực hiện kiểm thử trong bài kiểm tra. Trong Robot Framework, bạn sử dụng từ khóa (keyword) để thực hiện các hành động trong bài kiểm tra.
    # Trong trường hợp này, từ khóa được gọi là "Login to admin". "Then" là một từ khóa dùng để định nghĩa bước thực hiện kiểm thử (action step).
    # Từ khóa "Login to admin" được định nghĩa bên dưới và sẽ thực hiện các hành động cần thiết để đăng nhập vào trang admin, như là một tập hợp các bước cụ thể mà bạn đã định nghĩa trước đó. Việc sử dụng từ khóa giúp mã kiểm thử trở nên ngắn gọn, dễ đọc và tái sử dụng lại.
    Then Login to admin
# Debug coi từng dong code để hiểu
DN-03 Verify that Đăng nhập unsuccessfully with invalid Email
    [Tags]    @smoketest    @regression
    # Cái này để sử dụng random email thay vì mình hay ghi gmail cứng
    When Enter "email" in "Email" with "_RANDOM_"
    When Enter "text" in "Mật khẩu" with "123456"
    When Click "Đăng nhập" button
    Then User look message "Tài khoản _@Email@_ không tồn tại trong hệ thống. Vui lòng đăng ký mới." popup

DN-04 Verify that Đăng nhập unsuccessfully with invalid Mật khẩu
    [Tags]    @smoketest    @regression
    When Enter "email" in "Email" with "geneat.soft@gmail.com"
    When Enter "text" in "Mật khẩu" with "_RANDOM_"
    When Click "Đăng nhập" button
    Then User look message "Sai mật khẩu cho tài khoản _@Email@_" popup

DN-07 Verify that Đăng nhập unsuccessfully because no enter Email and Mật khẩu
    [Tags]    @smoketest    @regression
    When Click "Đăng nhập" button
    Then Required message "Email" displayed under "Xin vui lòng nhập email" field
    Then Required message "Mật khẩu" displayed under "Xin vui lòng nhập mật khẩu" field

DN-05 Verify that Đăng nhập unsuccessfully because no enter Email
    [Tags]    @smoketest    @regression
    When Enter "text" in "Mật khẩu" with "123456"
    When Click "Đăng nhập" button
    Then Required message "Email" displayed under "Xin vui lòng nhập email" field

DN-06 Verify that Đăng nhập unsuccessfully because no enter Password
    [Tags]    @smoketest    @regression
    When Enter "email" in "Email" with "geneat.soft@gmail.com"
    When Click "Đăng nhập" button
    Then Required message "Mật khẩu" displayed under "Xin vui lòng nhập mật khẩu" field
