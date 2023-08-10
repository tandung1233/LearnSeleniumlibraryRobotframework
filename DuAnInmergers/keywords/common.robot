*** Settings ***
Library     Browser
Library     FakerLibrary    locale=en_IN
Library     String


*** Variables ***
${BROWSER}              chromium
${HEADLESS}             ${False}
${BROWSER_TIMEOUT}      60 seconds
${SHOULD_TIMEOUT}       0.1 seconds

${URL_DEFAULT}          http://localhost:4200
${STATE}                Evaluate    json.loads('''{}''')    json

# *** Variables ***
# ${BROWSER}    Chromium
# ${url}    https://the-internet.herokuapp.com/login
# ${tandung}    https://the-internet.herokuapp.com/secure

# *** Test Cases ***
# Vald
#    New Browser    browser=${BROWSER}    headless=false
#    New Page    ${url}
#    Type Text    id=username    tomsmith
#    Type Text    id=password    SuperSecretPassword!
#    Click    css=button >> text=login
#    Sleep    4

#    Từ khóa (keyword) tương đương với hàm (function) trong lập trình truyền thống. Bạn tự định nghĩa các từ khóa để thực hiện các hành động cụ thể và logic trong quá trình kiểm thử. Sau đó, trong các bài kiểm tra (test cases), bạn gọi các từ khóa này để thực hiện các hành động kiểm thử mong muốn.


*** Keywords ***
# Đây là tên của từ khóa mà bạn định nghĩa. Từ khóa này sẽ thực hiện việc đăng nhập vào trang admin khi được gọi trong bài kiểm tra (test case).
Login to admin
    Enter "email" in "Email" with "geneat.soft@gmail.com"
    Enter "text" in "Mật khẩu" with "123456"
    Click "Đăng nhập" button
    User look message "Success" popup

#### Setup e Teardown

Setup
    Set Browser Timeout    ${BROWSER_TIMEOUT}
    New Browser    ${BROWSER}    headless=false
    New Page    ${URL_DEFAULT}
    ${STATE}=    Evaluate    json.loads('''{}''')    json

Tear Down
    Close Browser    ALL

Wait Until Element Is Visible
    [Arguments]    ${locator}    ${message}=${EMPTY}    ${timeout}=${BROWSER_TIMEOUT}
    Wait For Elements State    ${locator}    visible    ${timeout}    ${message}

Wait Until Element Is Not Exist
    [Arguments]    ${locator}    ${message}=${EMPTY}    ${timeout}=${BROWSER_TIMEOUT}
    Wait For Elements State    ${locator}    detached    ${timeout}    ${message}

Element Should Be Exist
    [Arguments]    ${locator}    ${message}=${EMPTY}    ${timeout}=${SHOULD_TIMEOUT}
    Wait For Elements State    ${locator}    attached    ${timeout}    ${message}

Element Should Be Visible
    [Arguments]    ${locator}    ${message}=${EMPTY}    ${timeout}=${SHOULD_TIMEOUT}
    Wait For Elements State    ${locator}    visible    ${timeout}    ${message}

Element Text Should Be
    [Arguments]    ${locator}    ${expected}    ${message}=${EMPTY}    ${ignore_case}=${EMPTY}
    Get Text    ${locator}    equal    ${expected}    ${message}

Element Should Not Be Visible
    [Arguments]    ${locator}    ${message}=${EMPTY}    ${timeout}=${SHOULD_TIMEOUT}
    Wait For Elements State    ${locator}    hidden    ${timeout}    ${message}

Check Text
    [Arguments]    ${text}
    ${containsS}=    Get Regexp Matches    ${text}    _@(.+)@_    1
    ${cntS}=    Get length    ${containsS}
    IF    ${cntS} > 0
        ${text}=    Set Variable    ${STATE["${containsS[0]}"]}
    END
    RETURN    ${text}

###    -----    Form    -----    ###

Get Random Text
    [Arguments]    ${type}    ${text}
    ${symbol}=    Set Variable    _RANDOM_
    ${new_text}=    Set Variable
    ${containsS}=    Get Regexp Matches    ${text}    _@(.+)@_    1
    ${cntS}=    Get length    ${containsS}
    ${contains}=    Get Regexp Matches    ${text}    ${symbol}
    ${cnt}=    Get length    ${contains}
    IF    ${cntS} > 0
        ${new_text}=    Set Variable    ${STATE["${containsS[0]}"]}
        ${symbol}=    Set Variable    _@${containsS[0]}@_
    ELSE IF    ${cnt} > 0 and '${type}' == 'test name'
        ${random}=    FakerLibrary.Sentence    nb_words=3
        ${words}=    Split String    ${TEST NAME}    ${SPACE}
        ${new_text}=    Set Variable    ${words[0]} ${random}
    ELSE IF    ${cnt} > 0 and '${type}' == 'number'
        ${new_text}=    FakerLibrary.Random Int
        ${new_text}=    Convert To String    ${new_text}
    ELSE IF    ${cnt} > 0 and '${type}' == 'percentage'
        ${new_text}=    FakerLibrary.Random Int    max=100
        ${new_text}=    Convert To String    ${new_text}
    ELSE IF    ${cnt} > 0 and '${type}' == 'paragraph'
        ${new_text}=    FakerLibrary.Paragraph
    ELSE IF    ${cnt} > 0 and '${type}' == 'email'
        ${new_text}=    FakerLibrary.Email
    ELSE IF    ${cnt} > 0 and '${type}' == 'phone'
        ${new_text}=    FakerLibrary.Random Int    min=55555555    max=999999999999
        ${new_text}=    Convert To String    ${new_text}
    ELSE IF    ${cnt} > 0 and '${type}' == 'color'
        ${new_text}=    FakerLibrary.Safe Hex Color
    ELSE IF    ${cnt} > 0 and '${type}' == 'date'
        ${new_text}=    FakerLibrary.Date    pattern=%d-%m-%Y
    ELSE IF    ${cnt} > 0 and '${type}' == 'word'
        ${new_text}=    FakerLibrary.Sentence    nb_words=2
    ELSE IF    ${cnt} > 0
        ${new_text}=    FakerLibrary.Sentence
    END
    ${cnt}=    Get Length    ${text}
    IF    ${cnt} > 0
        ${text}=    Replace String    ${text}    ${symbol}    ${new_text}
    END
    RETURN    ${text}

Get Element Form Item By Name
    [Arguments]    ${name}    ${xpath}=${EMPTY}
    RETURN    xpath=//*[contains(@class, "ant-form-item-label")]/label[text()="${name}"]/../../*[contains(@class, "ant-form-item")]${xpath}

Required message "${name}" displayed under "${text}" field
    ${element}=    Get Element Form Item By Name    ${name}    //*[contains(@class, "ant-form-item-explain-error")]
    Element Text Should Be    ${element}    ${text}

# Trong lệnh này, bạn sử dụng ba biến là ${type}, ${name} và ${text} để truyền thông tin đến từ khóa con.
# Các thông tin này bao gồm:
# ${type}: Loại dữ liệu cần nhập vào trường (ví dụ: "email" hoặc "text").
# ${name}: Tên của trường cần nhập dữ liệu (ví dụ: "Email" hoặc "Mật khẩu").
# ${text}: Nội dung cần nhập vào trường.

# ${type}: Tham số này xác định loại dữ liệu mà bạn muốn tạo ngẫu nhiên. Nó được sử dụng để truyền vào từ khóa "Get Random Text" để tạo dữ liệu ngẫu nhiên phù hợp. Ví dụ, nếu bạn muốn tạo dữ liệu ngẫu nhiên cho trường địa chỉ email, bạn có thể sử dụng ${type} = email.
# ${name}: Tham số này là tên của trường nhập liệu trên giao diện người dùng. Nó được sử dụng trong từ khóa "Get Element Form Item By Name" để tìm và xác định phần tử trên trang web dựa vào tên trường nhập liệu. Ví dụ, nếu trên giao diện có một trường nhập liệu có tên là "Email", bạn có thể sử dụng ${name} = Email để xác định phần tử đó.
# ${text}: Tham số này là nội dung dữ liệu mà bạn muốn nhập vào trường. Trong đoạn mã của bạn, nó được tạo ngẫu nhiên bằng cách sử dụng từ khóa "Get Random Text". Sau đó, dữ liệu này được điền vào trường thông qua các bước thực hiện kiểm thử:
# Clear Text ${element}: Xóa nội dung hiện tại của trường.
# Fill Text ${element} ${text} True: Điền nội dung dữ liệu ${text} vào trường.
# Sau khi điền dữ liệu vào trường, đoạn mã kiểm tra kích thước ${text} bằng từ khóa "Get Length". Nếu kích thước lớn hơn 0 (tức là dữ liệu có giá trị), nó sẽ thiết lập một biến toàn cục ${STATE["${name}"]} để lưu trữ dữ liệu đó. Biến toàn cục ${STATE["${name}"]} được sử dụng để lưu trữ thông tin đã nhập vào các trường, có thể sử dụng trong các bài kiểm tra khác.

Enter "${type}" in "${name}" with "${text}"
# Đây là một bước trong từ khóa con, dùng để tạo dữ liệu ngẫu nhiên cho việc nhập vào trường.
# Điều này có thể hữu ích trong việc tạo dữ liệu ngẫu nhiên khi bạn cần đăng nhập với các tài khoản khác nhau trong quá trình kiểm thử.
    ${text}=    Get Random Text    ${type}    ${text}
    # Đây là một bước trong từ khóa con, dùng để tìm phần tử trên trang web cần thao tác dựa trên tên của trường.
    # Tìm kiếm phần tử có tên "${name}" (ví dụ: "Email" hoặc "Mật khẩu") và kiểu input là "ant-
    ${element}=    Get Element Form Item By Name    ${name}    //input[contains(@class, "ant-input")]
    # Đây là một bước trong từ khóa con, dùng để xóa nội dung hiện tại của trường nhập liệu.
    Clear Text    ${element}
# Đây là một bước trong từ khóa con, dùng để điền dữ liệu vào trường nhập liệu đã được xác định trước đó.
# ${element}: Đối tượng phần tử đã được tìm thấy trước đó.
# ${text}: Nội dung dữ liệu cần điền vào trường.
# True: Sử dụng để kiểm tra dữ liệu điền vào.
    Fill Text    ${element}    ${text}    True
    # Đây là một bước trong từ khóa con, dùng để lấy độ dài của nội dung dữ liệu "${text}" đã được tạo ra ngẫu nhiên trước đó.
    ${cnt}=    Get Length    ${text}
    # Đây là một bước trong từ khóa con, dùng để kiểm tra nếu nội dung "${text}" có độ dài lớn hơn 0 (tức là có dữ liệu) thì sẽ thiết lập một biến toàn cục "${STATE["${name}"]}" bằng giá trị của "${text}".
# Biến toàn cục "${STATE["${name}"]}" được sử dụng để lưu trữ thông tin đã nhập vào các trường, có thể sử dụng trong các bài kiểm tra khác.
    IF    ${cnt} > 0    Set Global Variable    ${STATE["${name}"]}    ${text}

Enter "${type}" in textarea "${name}" with "${text}"
    ${text}=    Get Random Text    ${type}    ${text}
    ${element}=    Get Element Form Item By Name    ${name}    //textarea
    Clear Text    ${element}
    Fill Text    ${element}    ${text}
    ${cnt}=    Get Length    ${text}
    IF    ${cnt} > 0    Set Global Variable    ${STATE["${name}"]}    ${text}

Enter date in "${name}" with "${text}"
    ${text}=    Get Random Text    date    ${text}
    ${element}=    Get Element Form Item By Name    ${name}    //*[contains(@class, "ant-picker-input")]/input
    Click    ${element}
    Clear Text    ${element}
    Fill Text    ${element}    ${text}
    Press Keys    ${element}    Tab
    Press Keys    ${element}    Tab
    ${cnt}=    Get Length    ${text}
    IF    ${cnt} > 0    Set Global Variable    ${STATE["${name}"]}    ${text}

Click select "${name}" with "${text}"
    ${text}=    Get Random Text    Text    ${text}
    ${element}=    Get Element Form Item By Name    ${name}    //*[contains(@class, "ant-select-show-arrow")]
    Click    ${element}
    ${element}=    Get Element Form Item By Name
    ...    ${name}
    ...    //*[contains(@class, "ant-select-selection-search-input")]
    Fill Text    ${element}    ${text}
    Click    xpath=//*[contains(@class, "ant-select-item-option") and @title="${text}"]
    ${cnt}=    Get Length    ${text}
    IF    ${cnt} > 0    Set Global Variable    ${STATE["${name}"]}    ${text}

Enter "${type}" in editor "${name}" with "${text}"
    ${text}=    Get Random Text    ${type}    ${text}
    ${element}=    Get Element Form Item By Name    ${name}    //*[contains(@class, "ce-paragraph")]
    Clear Text    ${element}
    Fill Text    ${element}    ${text}

Select file in "${name}" with "${text}"
    ${element}=    Get Element Form Item By Name    ${name}    //input[@type = "file"]
    Upload File By Selector    ${element}    DuAnInmergers/upload/${text}

Click radio "${name}" in line "${text}"
    ${element}=    Get Element Form Item By Name
    ...    ${name}
    ...    //*[contains(@class, "ant-radio-button-wrapper")]/span[contains(text(), "${text}")]
    Click    ${element}

Click switch "${name}" to be activated
    ${element}=    Get Element Form Item By Name    ${name}    //button[contains(@class, "ant-switch")]
    Click    ${element}

Click tree select "${name}" with "${text}"
    ${text}=    Get Random Text    Text    ${text}
    ${element}=    Get Element Form Item By Name    ${name}    //*[contains(@class, "ant-tree-select")]
    Click    ${element}
    Fill Text    ${element}//input    ${text}
    Click    xpath=//*[contains(@class, "ant-select-tree-node-content-wrapper") and @title="${text}"]

Click assign list "${list}"
    ${words}=    Split String    ${list}    ,${SPACE}
    FOR    ${word}    IN    @{words}
        Click    xpath=//*[contains(@class, "ant-checkbox-wrapper")]/*[text()="${word}"]
    END
    Click    xpath=//*[contains(@class, "ant-transfer-operation")]/button[2]

###    -----    Table    -----    ###

Get Element Item By Name
    [Arguments]    ${name}    ${xpath}=${EMPTY}
    RETURN    xpath=//*[contains(@class, "item-text") and contains(text(), "${name}")]/ancestor::*[contains(@class, "item")]${xpath}

Click on the "${text}" button in the "${name}" item line
    Wait Until Element Spin
    ${name}=    Check Text    ${name}
    ${element}=    Get Element Item By Name    ${name}    //button[@title = "${text}"]
    Click    ${element}
    Click Confirm To Action

Get Element Table Item By Name
    [Arguments]    ${name}    ${xpath}
    RETURN    xpath=//*[contains(@class, "ant-table-row")]//*[contains(text(), "${name}")]/ancestor::tr${xpath}

Click on the "${text}" button in the "${name}" table line
    Wait Until Element Spin
    ${name}=    Check Text    ${name}
    ${element}=    Get Element Table Item By Name    ${name}    //button[@title = "${text}"]
    Click    ${element}
    Click Confirm To Action

###    -----    Tree    -----    ###

Get Element Tree By Name
    [Arguments]    ${name}    ${xpath}=${EMPTY}
    RETURN    xpath=//*[contains(@class, "ant-tree-node-content-wrapper") and @title = "${name}"]/*[contains(@class, "group")]${xpath}

Click on the previously created "${name}" tree to delete
    Wait Until Element Spin
    ${name}=    Check Text    ${name}
    ${element}=    Get Element Tree By Name    ${name}
    Scroll To Element    ${element}
    Mouse Move Relative To    ${element}    0
    Click    ${element}//*[contains(@class, "la-trash")]
    Click Confirm To Action

Click on the previously created "${name}" tree to edit
    Wait Until Element Spin
    ${name}=    Check Text    ${name}
    ${element}=    Get Element Tree By Name    ${name}
    Click    ${element}

###    -----    Element    -----    ###

Click "${text}" button
    Click    xpath=//button[@title = "${text}"]
    Click Confirm To Action
    Scroll By    ${None}

Click "${text}" tab button
    Click    xpath=//*[contains(@class, "ant-tabs-tab-btn") and contains(text(), "${text}")]

Select on the "${text}" item line
    Wait Until Element Spin
    ${element}=    Get Element Item By Name    ${text}
    Click    ${element}

Click "${text}" menu
    Click    xpath=//li[contains(@class, "menu") and descendant::span[contains(text(), "${text}")]]

Click "${text}" sub menu to "${url}"
    Wait Until Element Spin
    Click    xpath=//a[contains(@class, "sub-menu") and descendant::span[contains(text(), "${text}")]]
    ${curent_url}=    Get Url
    Should Contain    ${curent_url}    ${URL_DEFAULT}${url}

User look message "${message}" popup
    ${contains}=    Get Regexp Matches    ${message}    _@(.+)@_    1
    ${cnt}=    Get length    ${contains}
    IF    ${cnt} > 0
        ${message}=    Replace String    ${message}    _@${contains[0]}@_    ${STATE["${contains[0]}"]}
    END
    Element Text Should Be    id=swal2-html-container    ${message}
    ${element}=    Set Variable    xpath=//*[contains(@class, "swal2-confirm")]
    ${passed}=    Run Keyword And Return Status
    ...    Element Should Be Visible    ${element}
    IF    '${passed}' == 'True'    Click    ${element}
    Wait Until Element Spin

Click Confirm To Action
    ${element}=    Set Variable    xpath=//*[contains(@class, "ant-popover")]//*[contains(@class, "ant-btn-primary")]
    ${count}=    Get Element Count    ${element}
    IF    ${count} > 0
        Click    ${element}
        Sleep    ${SHOULD_TIMEOUT}
    END

Wait Until Element Spin
    Sleep    ${SHOULD_TIMEOUT}
    ${element}=    Set Variable    xpath=//*[contains(@class, "ant-spin-spinning")]
    ${count}=    Get Element Count    ${element}
    IF    ${count} > 0    Wait Until Element Is Not Exist    ${element}

scrolltop
    Scroll To    None    vertical=top