*** Settings ***
Resource                ../keywords/common.robot

*** Test Cases ***
Verify when create successful
  [Tags]                @smoketest               @regression
  [Template]            Verify when create successful
  MPG_01 Verify when create Medical Procedure Group successful                                                Business Roles

Verify that Sửa successful
  [Tags]                @smoketest               @regression
  [Template]            Verify that Sửa successful
  MPG_03 Verify that Sửa Medical Procedure Group successful                                                   Business Roles

Verify that "Xóa" successful
  [Tags]                @smoketest               @regression
  [Template]            Verify that "Xóa" successful
  MPG_04 Verify that "Xóa" Medical Procedure Group successful                                                 Business Roles

Verify when create unsuccessful beacause leaving "Tiêu đề" field blank
  [Tags]                @smoketest               @regression
  [Template]            Verify when create unsuccessful beacause leaving "Tiêu đề" field blank
  MPG_22 Verify when create Medical Procedure Group unsuccessful beacause leaving "Tiêu đề" field blank       Business Roles

Verify when create unsuccessful beacause leaving "Mã" field blank
  [Tags]                @smoketest               @regression
  [Template]            Verify when create unsuccessful beacause leaving "Mã" field blank
  MPG_23 Verify when create Medical Procedure Group unsuccessful beacause leaving "Mã" field blank            Business Roles

Verify when create unsuccessful beacause leaving all fields blank
  [Tags]                @smoketest               @regression
  [Template]            Verify when create unsuccessful beacause leaving all fields blank
  MPG_21 Verify when create Medical Procedure Group unsuccessful beacause leaving all fields blank            Business Roles

*** Keywords ***
Go to page create code types ${type}
  When Setup
  When Login to admin
  When Click "QUẢN LÝ DANH MỤC" menu
  When Click "Code Type" sub menu to "/vn/code-types"
  When Select on the "${type}" item line
  When Click "Thêm mới" button

Background ${type} Happy paths
  When Go to page create code types ${type}
  When Enter "test name" in "Tiêu đề" with "_RANDOM_"
  When Enter "number" in "Thứ tự" with "_RANDOM_"
  When Enter "text" in "Mã" with "_RANDOM_"
  When Enter "paragraph" in textarea "Mô tả" with "_RANDOM_"
  When Click "Lưu lại" button

Verify when create successful
  [Arguments]           ${code}                 ${type}
  Set Global Variable   ${TEST NAME}            ${code}
  When Background ${type} Happy paths
  Then User look message "Success" popup
  When Click on the "Xóa" button in the "_@Tiêu đề@_" table line
  When Tear Down

Verify that Sửa successful
  [Arguments]           ${code}                 ${type}
  Set Global Variable   ${TEST NAME}            ${code}
  When Background ${type} Happy paths
  Then User look message "Success" popup
  Then Click on the "Sửa" button in the "_@Tiêu đề@_" table line
  When Wait Until Element Spin
  When Enter "test name" in "Tiêu đề" with "_RANDOM_"
  When Enter "number" in "Thứ tự" with "_RANDOM_"
  When Enter "paragraph" in textarea "Mô tả" with "_RANDOM_"
  When Click "Lưu lại" button
  Then Click on the "Xóa" button in the "_@Tiêu đề@_" table line
  When Tear Down

Verify that "Xóa" successful
  [Arguments]           ${code}                 ${type}
  Set Global Variable   ${TEST NAME}            ${code}
  When Background ${type} Happy paths
  Then User look message "Success" popup
  When Click on the "Xóa" button in the "_@Tiêu đề@_" table line
  Then User look message "Đã xóa thành công" popup
  When Tear Down

Verify when create unsuccessful beacause leaving "Tiêu đề" field blank
  [Arguments]           ${code}                 ${type}
  Set Global Variable   ${TEST NAME}            ${code}
  When Go to page create code types ${type}
  When Enter "number" in "Thứ tự" with "_RANDOM_"
  When Enter "text" in "Mã" with "_RANDOM_"
  When Enter "paragraph" in textarea "Mô tả" with "_RANDOM_"
  When Click "Lưu lại" button
  Then Required message "Tiêu đề" displayed under "Xin vui lòng nhập tiêu đề" field
  When Tear Down

Verify when create unsuccessful beacause leaving "Mã" field blank
  [Arguments]           ${code}                 ${type}
  Set Global Variable   ${TEST NAME}            ${code}
  When Go to page create code types ${type}
  When Enter "test name" in "Tiêu đề" with "_RANDOM_"
  When Enter "number" in "Thứ tự" with "_RANDOM_"
  When Enter "paragraph" in textarea "Mô tả" with "_RANDOM_"
  When Click "Lưu lại" button
  Then Required message "Mã" displayed under "Xin vui lòng nhập mã" field
  When Tear Down

Verify when create unsuccessful beacause leaving all fields blank
  [Arguments]           ${code}                 ${type}
  Set Global Variable   ${TEST NAME}            ${code}
  When Go to page create code types ${type}
  When Click "Lưu lại" button
  Then Required message "Tiêu đề" displayed under "Xin vui lòng nhập tiêu đề" field
  Then Required message "Mã" displayed under "Xin vui lòng nhập mã" field
  When Tear Down
