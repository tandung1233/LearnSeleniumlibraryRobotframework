# Biến c=10 được khai báo như global như thế này ???
*** Variables ***
${c}                                     ${10}

*** Test Cases ***
# Lesson 2.1: Khai báo 2 số nguyên a=5; b=4 và tính tổng 2 số nguyên đó
TC002.1-Lesson 2.1
    ${a}                 Set Variable    ${5}
    ${b}                 Set Variable    ${4}
    ${c}                 Evaluate        ${a} + ${b}
    Log To Console       Tổng 2 số nguyên: ${a} + ${b} là ${c}

# Lesson 2.2: Khai báo 3 số nguyên a=5; b=4; c=10 và tính tổng 3 số nguyên đó
TC002.2-Lesson 2.2
    ${a}                 Set Variable    ${5}
    ${b}                 Set Variable    ${4}
    ${tong}              Evaluate        ${a}+${b}+${c}
    Log To Console       Tổng 3 số nguyên: ${a} + ${b} + ${c} là ${tong}