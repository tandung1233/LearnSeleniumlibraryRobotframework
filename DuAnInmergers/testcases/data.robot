*** Settings ***
Resource            ../keywords/common.robot

Test Setup          Setup
Test Teardown       Tear Down


*** Test Cases ***
DA-01 Verify that Add New successfully with enter the data
    [Tags]    @smoketest    @regression
    When Background Happy paths
    When Click on the "Xóa" button in the "_@Chuyên mục@_" item line

DA-02 Verify that add successfully with enter "Tiêu đề" and "Chuyên mục"
    [Tags]    @smoketest    @regression
    When Background Happy paths
    When Click on the "Xóa" button in the "_@Chuyên mục@_" item line
    When Click "Thêm mới" button
    When Click select "Chuyên mục" with "Mạng lưới chiến lược"
    When Enter "number" in "Thứ tự" with "_RANDOM_"
    When Enter for 4 languages
    When Select file in "Ảnh cover" with "image.jpg"
    When Click "Lưu lại" button
    Then User look message "Success" popup
    When Click on the "Xóa" button in the "_@Tên loại@_" table line
# Tí N xem lại

DA-03 Verify that edit successfully
    [Tags]    @smoketest    @regression
    When Background Happy paths
    When Click "AutoTest" button
    When Click on the "Sửa" button in the "_@Tên loại@_" table line
    When Wait Until Element Spin
    When Enter "test name" in "Tên loại" with "_RANDOM_"
    When Enter "paragraph" in textarea "Mô tả" with "_RANDOM_"
    When Click "Lưu lại" button
    Then User look message "Success" popup
    When Click on the "Xóa" button in the "_@Tên loại@_" table line
    When Click on the "Xóa" button in the "_@Chuyên mục@_" item line
    Then User look message "Success" popup

DA-06 Verify that "Xóa" successfully
    [Tags]    @smoketest    @regression
    When Background Happy paths
    Then User look message "Success" popup
    When Click "AutoTest" button
    When Click on the "Xóa" button in the "_@Tên loại@_" table line
    Then User look message "Delete Success" popup
    When Click on the "Xóa" button in the "_@Chuyên mục@_" item line
    Then User look message "Success" popup

DA-09 Verify when Create Data unsuccessfully when leaving all fields blank
    [Tags]    @smoketest    @regression
    When Go to page create data
    When Click "Lưu lại" button
    Then Required message "Chuyên mục" displayed under "Xin vui lòng chọn chuyên mục" field
    Then Required message "Tên loại" displayed under "Xin vui lòng nhập tên loại" field
    Then Scroll To    vertical=top
    When Click "Data" sub menu to "/vn/data"
    When Click on the "Xóa" button in the "AutoTest" item line
    Then User look message "Success" popup

DA-10 Verify when Create Post unsuccessfully when leaving Categories fields blank
    [Tags]    @smoketest    @regression
    When Go to page create data
    When Enter "test name" in "Tên loại" with "_RANDOM_"
    When Click "Lưu lại" button
    Then Scroll To    vertical=top
    Then Required message "Chuyên mục" displayed under "Xin vui lòng chọn chuyên mục" field
    When Click "Data" sub menu to "/vn/data"
    When Click on the "Xóa" button in the "AutoTest" item line
    Then User look message "Success" popup

DA-11 Verify when Create Post unsuccessfully when leaving "Tên loại" fields blank
    [Tags]    @smoketest    @regression
    When Go to page create data
    When Click select "Chuyên mục" with "Mạng lưới chiến lược"
    When Click "Lưu lại" button
    Then Scroll To    vertical=top
    Then Required message "Tên loại" displayed under "Xin vui lòng nhập tên loại" field
    When Click "Data" sub menu to "/vn/data"
    When Click on the "Xóa" button in the "AutoTest" item line
    Then User look message "Success" popup
DA-15 Verify when Create Post unsuccessfully when article "Tên loại" already exist
    [Tags]    @smoketest    @regression
    When Go to page create data
    When Click select "Chuyên mục" with "Mạng lưới chiến lược"
    When Enter "number" in "Thứ tự" with "_RANDOM_"
    When Click "English" tab button
    When Enter "test name" in "Tên loại" with "_RANDOM_"
    When Click "Japanese" tab button
    When Enter "test name" in "Tên loại" with "_RANDOM_"
    When Click "Chinese" tab button
    When Enter "test name" in "Tên loại" with "_RANDOM_"
    When Click "Vietnamese" tab button
    When Enter "test name" in "Tên loại" with "_RANDOM_"
    When Click "Lưu lại" button
    Then User look message "Success" popup
    When Click "Thêm mới" button
    When Click select "Chuyên mục" with "Mạng lưới chiến lược"
    When Click "English" tab button
    When Enter "test name" in "Tên loại" with "_@Tên loại@_"
    When Click "Japanese" tab button
    When Enter "test name" in "Tên loại" with "_@Tên loại@_"
    When Click "Chinese" tab button
    When Enter "test name" in "Tên loại" with "_@Tên loại@_"
    When Click "Vietnamese" tab button
    When Enter "test name" in "Tên loại" with "_@Tên loại@_"
    When Click "Lưu lại" button
    Then User look message "Title is already existed." popup
    When Click "Đóng lại" button
    When Click on the "Xóa" button in the "_@Tên loại@_" table line

DA-16 Verify when Create Post unsuccessfully when click Cancel
    [Tags]    @smoketest    @regression
    When Go to page create data
    When Click select "Chuyên mục" with "Mạng lưới chiến lược"
    When Enter "number" in "Thứ tự" with "_RANDOM_"
    When Enter for 4 languages
    When Click "Đóng lại" button
    When Check to Delete Category Data on the "AutoTest" item line


*** Keywords ***
Go to page create data
    When Login to admin
    When Click "QUẢN LÝ DANH MỤC" menu
    When Click "Data" sub menu to "/vn/data"
    When Check to create Category Data on the "AutoTest" item line
    When Click "Thêm mới" button

Background Happy paths
    When Go to page create data
    When Click select "Chuyên mục" with "AutoTest"
    When Enter "number" in "Thứ tự" with "_RANDOM_"
    when Enter for 4 languages
    When Select file in "Ảnh cover" with "image.jpg"
    When Click "Lưu lại" button
    Then User look message "Success" popup

Check to create Category Data on the "${val}" item line
    When Wait Until Element Spin
    ${element}=    Get Element Item By Name    ${val}
    ${count}=    Get Element Count    ${element}
    IF    ${count} == 0
        When Click "Tạo mới" button
        When Enter "test name" in "Tên loại" with "${val}"
        When Enter "number" in "Mã" with "_RANDOM_"
        When Click radio "Địa điểm" in line "INMERGERS"
        When Click "Lưu lại" button
        Then User look message "Success" popup
    END

Check to Delete Category Data on the "${val}" item line
    When Wait Until Element Spin
    ${element}=    Get Element Item By Name    ${val}
    ${count}=    Get Element Count    ${element}
    IF    ${count} > 0
        When Click on the "Xóa" button in the "${val}" item line
        Then User look message "Success" popup
    END

Enter for 4 languages
    When Click "English" tab button
    When Enter "test name" in "Tên loại" with "_RANDOM_"
    When Enter "paragraph" in textarea "Mô tả" with "_RANDOM_"
    When Enter "paragraph" in editor "Nội dung" with "_RANDOM_"
    When Click "Japanese" tab button
    When Enter "test name" in "Tên loại" with "_RANDOM_"
    When Enter "paragraph" in textarea "Mô tả" with "_RANDOM_"
    When Enter "paragraph" in editor "Nội dung" with "_RANDOM_"
    When Click "Chinese" tab button
    When Enter "test name" in "Tên loại" with "_RANDOM_"
    When Enter "paragraph" in textarea "Mô tả" with "_RANDOM_"
    When Enter "paragraph" in editor "Nội dung" with "_RANDOM_"
    When Click "Vietnamese" tab button
    When Enter "test name" in "Tên loại" with "_RANDOM_"
    When Enter "paragraph" in textarea "Mô tả" with "_RANDOM_"
    When Enter "paragraph" in editor "Nội dung" with "_RANDOM_"
