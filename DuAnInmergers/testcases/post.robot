*** Settings ***
Resource            ../keywords/common.robot
Library             Dialogs

Test Setup          Setup
Test Teardown       Tear Down


*** Test Cases ***
PO_01 Verify that Add New successfully with enter the data
    [Tags]    @smoketest    @regression
    When Background Happy paths
    When Click on the "Xóa" button in the "_@Tiêu đề@_" table line
    Then User look message "Đã xóa thành công" popup
    When Click on the "Xóa" button in the "Auto Test Post" item line
    Then User look message "Đã xóa thành công" popup

PO_02 Verify that add successfully with enter "Tiêu đề" and categories
    [Tags]    @smoketest    @regression
    When Background Happy paths
    When Click on the "Xóa" button in the "_@Tiêu đề@_" table line
    When Click "Tạo mới bài viết" button
    When Click select "Chuyên mục" with "Auto Test Post"
    When Click "English" tab button
    When Enter "test name" in "Tiêu đề" with "_RANDOM_"
    When Click "Japanese" tab button
    When Enter "test name" in "Tiêu đề" with "_RANDOM_"
    When Click "Chinese" tab button
    When Enter "test name" in "Tiêu đề" with "_RANDOM_"
    When Click "Vietnamese" tab button
    When Enter "test name" in "Tiêu đề" with "_RANDOM_"
    When Click "Lưu lại" button
    Then User look message "Thêm mới bài viết thành công" popup
    When Click on the "Xóa" button in the "_@Tiêu đề@_" table line
    Then User look message "Đã xóa thành công" popup
    When Click on the "Xóa" button in the "Auto Test Post" item line
    Then User look message "Đã xóa thành công" popup

PO_03 Verify that edit successfully
    [Tags]    @smoketest    @regression
    When Background Happy paths
    When Click on the "Sửa" button in the "_@Tiêu đề@_" table line
    When Click "English" tab button
    And Enter "test name" in "Tiêu đề" with "_RANDOM_"
    And Enter "paragraph" in textarea "Mô tả" with "_RANDOM_"
    And Enter "paragraph" in textarea "Giới thiệu" with "_RANDOM_"
    When Click "Vietnamese" tab button
    And Enter "test name" in "Tiêu đề" with "_RANDOM_"
    And Enter "paragraph" in textarea "Mô tả" with "_RANDOM_"
    And Enter "paragraph" in textarea "Giới thiệu" with "_RANDOM_"
    When Click "Lưu lại" button
    Then User look message "Cập nhật bài viết thành công" popup
    When Click on the "Xóa" button in the "_@Tiêu đề@_" table line
    Then User look message "Đã xóa thành công" popup
    When Click on the "Xóa" button in the "Auto Test Post" item line
    Then User look message "Đã xóa thành công" popup

PO_04 Verify that "Public" successfully
    [Tags]    @smoketest    @regression
    When Background Happy paths
    When Click on the "Đăng bài" button in the "_@Tiêu đề@_" table line
    Then User look message "Cập nhật thành công" popup
    When Click on the "Hủy đăng" button in the "_@Tiêu đề@_" table line
    When Click on the "Xóa" button in the "_@Tiêu đề@_" table line
    Then User look message "Đã xóa thành công" popup
    When Click on the "Xóa" button in the "Auto Test Post" item line
    Then User look message "Đã xóa thành công" popup

PO_05 Verify that "Hide" successfully
    [Tags]    @smoketest    @regression
    When Background Happy paths
    When Click on the "Đăng bài" button in the "_@Tiêu đề@_" table line
    Then User look message "Cập nhật thành công" popup
    When Click on the "Hủy đăng" button in the "_@Tiêu đề@_" table line
    Then User look message "Cập nhật thành công" popup
    When Click on the "Xóa" button in the "_@Tiêu đề@_" table line
    Then User look message "Đã xóa thành công" popup
    When Click on the "Xóa" button in the "Auto Test Post" item line
    Then User look message "Đã xóa thành công" popup

PO_06 Verify that "Delete" successfully
    [Tags]    @smoketest    @regression
    When Background Happy paths
    When Click on the "Xóa" button in the "_@Tiêu đề@_" table line
    Then User look message "Đã xóa thành công" popup
    When Click on the "Xóa" button in the "Auto Test Post" item line
    Then User look message "Đã xóa thành công" popup

PO_16 Verify when Create Post unsuccessfully when leaving all fields blank
    [Tags]    @smoketest    @regression
    When Go to page create data
    When Click "Lưu lại" button
    Then Required message "Chuyên mục" displayed under "Xin vui lòng chọn chuyên mục" field
    When Click "English" tab button
    Then Required message "Tiêu đề" displayed under "Xin vui lòng nhập tiêu đề" field
    When Click "Vietnamese" tab button
    Then Required message "Tiêu đề" displayed under "Xin vui lòng nhập tiêu đề" field
    When Click "Đóng lại" button
    When Click on the "Xóa" button in the "Auto Test Post" item line
    Then User look message "Đã xóa thành công" popup

PO_17 Verify when Create Post unsuccessfully when leaving Categories fields blank
    [Tags]    @smoketest    @regression
    When Go to page create data
    When Click switch "Ghim" to be activated
    When Click "English" tab button
    And Enter "test name" in "Tiêu đề" with "_RANDOM_"
    And Enter "paragraph" in textarea "Mô tả" with "_RANDOM_"
    When Click "Japanese" tab button
    And Enter "test name" in "Tiêu đề" with "_RANDOM_"
    And Enter "paragraph" in textarea "Mô tả" with "_RANDOM_"
    When Click "Chinese" tab button
    And Enter "test name" in "Tiêu đề" with "_RANDOM_"
    And Enter "paragraph" in textarea "Mô tả" with "_RANDOM_"
    When Click "Vietnamese" tab button
    And Enter "test name" in "Tiêu đề" with "_RANDOM_"
    And Enter "paragraph" in textarea "Mô tả" with "_RANDOM_"
    When Click "Lưu lại" button
    Then Required message "Chuyên mục" displayed under "Xin vui lòng chọn chuyên mục" field
    When Click "Đóng lại" button
    When Click on the "Xóa" button in the "Auto Test Post" item line
    Then User look message "Đã xóa thành công" popup

PO_18 Verify when Create Post unsuccessfully when leaving "Tiêu đề" fields blank
    [Tags]    @smoketest    @regression
    When Go to page create data
    When Select file in "Ảnh thumbnail" with "avatar.jpg"
    When Select file in "Ảnh cover" with "image.jpg"
    When Click select "Chuyên mục" with "Auto Test Post"
    When Click switch "Ghim" to be activated
    When Click "English" tab button
    And Enter "paragraph" in textarea "Mô tả" with "_RANDOM_"
    And Enter "paragraph" in textarea "Giới thiệu" with "_RANDOM_"
    And Enter "paragraph" in editor "Nội dung" with "_RANDOM_"
    And Sleep    0.5s
    And Enter "text" in "Từ khóa SEO" with "_RANDOM_"
    And Enter "paragraph" in textarea "Mô tả SEO" with "_RANDOM_"
    When Click "Vietnamese" tab button
    And Enter "paragraph" in textarea "Mô tả" with "_RANDOM_"
    And Enter "paragraph" in textarea "Giới thiệu" with "_RANDOM_"
    And Enter "paragraph" in editor "Nội dung" with "_RANDOM_"
    And Sleep    0.5s
    And Enter "text" in "Từ khóa SEO" with "_RANDOM_"
    And Enter "paragraph" in textarea "Mô tả SEO" with "_RANDOM_"
    When Click "Lưu lại" button
    When Click "English" tab button
    Then Required message "Tiêu đề" displayed under "Xin vui lòng nhập tiêu đề" field
    When Click "Vietnamese" tab button
    Then Required message "Tiêu đề" displayed under "Xin vui lòng nhập tiêu đề" field
    When Click "Đóng lại" button
    When Click on the "Xóa" button in the "Auto Test Post" item line
    Then User look message "Đã xóa thành công" popup
PO_19 Verify when Create Post unsuccessfully when leaving "Tiêu đề" blank in VietNamese format
    [Tags]    @smoketest    @regression
    When Go to page create data
    When Click select "Chuyên mục" with "Auto Test Post"
    When Click "English" tab button
    When Enter "test name" in "Tiêu đề" with "_RANDOM_"
    When Click "Lưu lại" button
    When Click "Vietnamese" tab button
    Then Required message "Tiêu đề" displayed under "Xin vui lòng nhập tiêu đề" field
    When Click "Đóng lại" button
    When Click on the "Xóa" button in the "Auto Test Post" item line
    Then User look message "Đã xóa thành công" popup

PO_20 Verify when Create Post unsuccessfully when leaving "Tiêu đề" blank in English format
    [Tags]    @smoketest    @regression
    When Go to page create data
    When Click select "Chuyên mục" with "Auto Test Post"
    When Click "Vietnamese" tab button
    When Enter "test name" in "Tiêu đề" with "_RANDOM_"
    When Click "Lưu lại" button
    When Click "English" tab button
    Then Required message "Tiêu đề" displayed under "Xin vui lòng nhập tiêu đề" field
    When Click "Đóng lại" button
    When Click on the "Xóa" button in the "Auto Test Post" item line
    Then User look message "Đã xóa thành công" popup

PO_22 Verify when Create Post unsuccessfully when article "Tiêu đề" already exist
    [Tags]    @smoketest    @regression
    When Go to page create data
    When Click select "Chuyên mục" with "Auto Test Post"
    When Click "English" tab button
    When Enter "test name" in "Tiêu đề" with "_RANDOM_"
    When Click "Japanese" tab button
    When Enter "test name" in "Tiêu đề" with "_RANDOM_"
    When Click "Chinese" tab button
    When Enter "test name" in "Tiêu đề" with "_RANDOM_"
    When Click "Vietnamese" tab button
    When Enter "test name" in "Tiêu đề" with "_RANDOM_"
    When Click "Lưu lại" button
    Then User look message "Thêm mới bài viết thành công" popup
    When Click "Tạo mới bài viết" button
    When Click select "Chuyên mục" with "Auto Test Post"
    When Click "English" tab button
    When Enter "test name" in "Tiêu đề" with "_@Tiêu đề@_"
    When Click "Japanese" tab button
    When Enter "test name" in "Tiêu đề" with "_@Tiêu đề@_"
    When Click "Chinese" tab button
    When Enter "test name" in "Tiêu đề" with "_@Tiêu đề@_"
    When Click "Vietnamese" tab button
    When Enter "test name" in "Tiêu đề" with "_@Tiêu đề@_"
    When Click "Lưu lại" button
    Then User look message "Duplicate title of the same language" popup
    When Click "Đóng lại" button
    When Click on the "Xóa" button in the "Auto Test Post" item line
    Then User look message "Đã xóa thành công" popup
*** Keywords ***
Go to page create data
    When Login to admin
    When Click "QUẢN LÝ DANH MỤC" menu
    When Click "Post" sub menu to "/vn/posts"
    When Check to create Category Post on the "Auto Test Post" item line
    When Click "Tạo mới bài viết" button

Background Happy paths
    When Go to page create data
    When Select file in "Ảnh thumbnail" with "avatar.jpg"
    When Select file in "Ảnh cover" with "image.jpg"
    When Click select "Chuyên mục" with "Auto Test Post"
    When Click switch "Ghim" to be activated
    when Enter for 4 languages
    When Click "Lưu lại" button
    Then User look message "Thêm mới bài viết thành công" popup
    When Click "Auto Test Post" button

Check to create Category Post on the "${val}" item line
    When Wait Until Element Spin
    ${element}=    Get Element Item By Name    ${val}
    ${count}=    Get Element Count    ${element}
    IF    ${count} == 0
        When Click "Tạo mới" button
        When Enter "test name" in "Tiêu đề" with "${val}"
        When Enter "text" in "Slug" with "_RANDOM_"
        When Enter "paragraph" in textarea "Giới thiệu" with "_RANDOM_"
        When Click "Lưu lại" button
        Then User look message "Thêm mới thành công" popup
    END

Check to Delete Category Post on the "${val}" item line
    When Wait Until Element Spin
    ${element}=    Get Element Item By Name    ${val}
    ${count}=    Get Element Count    ${element}
    IF    ${count} > 0
        When Click on the "Xóa" button in the "${val}" item line
        Then User look message "Đã xóa thành công" popup
    END

Enter for "${val}" languages
    When Click "${val}" tab button
    And Enter "test name" in "Tiêu đề" with "_RANDOM_"
    And Enter "paragraph" in textarea "Mô tả" with "_RANDOM_"
    And Enter "paragraph" in textarea "Giới thiệu" with "_RANDOM_"
    And Enter "paragraph" in editor "Nội dung" with "_RANDOM_"
    And Sleep    0.5s
    And Enter "text" in "Từ khóa SEO" with "_RANDOM_"
    And Enter "paragraph" in textarea "Mô tả SEO" with "_RANDOM_"

Enter for 4 languages
    When Enter for "English" languages
    When Enter for "Japanese" languages
    When Enter for "Chinese" languages
    When Enter for "Vietnamese" languages
