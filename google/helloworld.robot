*** Comments ***
# Setting này giúp ta
# - Cài đặt thư viện (Library): Đây là nơi bạn khai báo và chọn các thư viện mà bạn muốn sử dụng trong test case. Thư viện cung cấp các keyword (từ khóa) để thực hiện các hành động cụ thể, chẳng hạn như điều khiển trình duyệt, gửi yêu cầu HTTP, tương tác với cơ sở dữ liệu, v.v. Trong ví dụ của bạn, "SeleniumLibrary" là một thư viện được sử dụng để điều khiển trình duyệt và thao tác với các yếu tố trên trang web.
# - Import thư viện (Library): Ngoài việc chỉ định thư viện trực tiếp trong mục "Settings", bạn cũng có thể sử dụng từ khóa "Import Library" để nạp các thư viện và đặt biến để sử dụng trong test case.
# - Biến (Variables): Bạn có thể định nghĩa các biến trong mục "Settings". Những biến này có thể được sử dụng trong toàn bộ test case và cho phép bạn thay đổi các giá trị một cách dễ dàng mà không cần sửa đổi từng dòng code.
# - Cài đặt tùy chỉnh (Settings): Bạn có thể thêm các cài đặt tùy chỉnh khác nhau trong mục "Settings". Ví dụ, bạn có thể cấu hình thời gian chờ tối đa cho các yếu tố trên trang web, xác định trình duyệt mặc định, chế độ chạy (Run Mode), v.v.
# Tóm lại, mục "Settings" trong Robot Framework là nơi bạn định nghĩa các cài đặt toàn cục cho test case, bao gồm cài đặt thư viện, biến và cài đặt tùy chỉnh. Việc cấu hình các thông số này giúp cho việc viết và quản lý các test case trở nên dễ dàng hơn và tăng tính tự động hóa trong quá trình kiểm thử.


*** Settings ***
# Đây là cách khai báo thư viện SeleniumLibrary để sử dụng các keywords (từ khóa) liên quan đến Selenium trong test case.
Library     SeleniumLibrary
# *** Test Cases ***: Khai báo mục Test Cases, đây là nơi bạn định nghĩa các test case cụ thể.


*** Test Cases ***
# First Test: Tên của test case đầu tiên.
First Test
# Open Browser https://www.google.com/ chrome: Keyword "Open Browser" dùng để mở trình duyệt với URL được cung cấp ("https://www.google.com/") và trình duyệt sẽ là Chrome (được xác định bởi "chrome"). Điều này đảm bảo rằng trình duyệt Chrome được mở và trang web Google sẽ được tải lên.
    Open Browser    https://www.google.com/    chrome
    # Input Text //*[@name='q'] Hi Google: Keyword "Input Text" dùng để nhập văn bản "Hi Google" vào phần tử input trên trang web Google. Đoạn mã //*[@name='q'] là một XPath, đại diện cho ô tìm kiếm của Google. Thông qua XPath này, Robot Framework sẽ tìm và nhập dữ liệu vào ô tìm kiếm. Có thể dùng nhiều cách lấy theo id, class,...
    Input Text    //*[@name='q']    Hi Google
    #    Keyword "Sleep" dùng để đặt một khoảng thời gian ngủ (6 giây trong trường hợp này). Lệnh này cho phép trang web được tải hoàn tất hoặc chờ một thao tác nào đó trước khi tiếp tục thực hiện các bước tiếp theo.
    Sleep    6s
    # Keyword "Close Browser" dùng để đóng trình duyệt hiện đang được mở sau khi hoàn tất các thao tác trên trang web.
    Close Browser
