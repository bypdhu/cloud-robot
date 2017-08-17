*** Settings ***
Variables         ../Variables/cloud.py
Library           Selenium2Library
Library           Collections
Library           Dialogs

*** Keywords ***
L_InputText
    [Arguments]    ${text}
    Comment    wait until element is visible
    Comment    input text

L_Open_Browser
    [Arguments]    ${url}    ${browser}
    open browser    ${url}    ${browser}

L_Logon_Erweima
    wait until element is visible    ${LO_Span_Erweima}
    click element    ${LO_Span_Erweima}

L_Logon_Account
    wait until element is visible    ${LO_Span_Account}
    click element    ${LO_Span_Account}

L_Logon_InputText
    [Arguments]    ${user}
    wait until element is visible    ${LO_Input_TxtLoginName}
    input text    ${LO_Input_TxtLoginName}    ${user}

L_Logon_InputPass
    [Arguments]    ${pass}
    wait until element is visible    ${LO_Input_TxtPass}
    input password    ${LO_Input_TxtPass}    ${pass}

L_Logon_Login
    wait until element is visible    ${LO_Div_Login}
    click element    ${LO_Div_Login}

L_Close_Browser
    close browser

L_Close_Browsers
    close all browsers

L_BuList_Click
    wait until element is visible    ${GE_A_BuList}
    click link    ${GE_A_BuList}

L_BuList_Choose_Bu
    [Arguments]    ${bu}
    [Documentation]    = L_BuList_Choose_Bu =
    ...    ---
    ...    *L_Choose_Bu* _${bu}_
    ...    ---
    ...    == 功能 ==
    ...    | \ \ \ \ 根据名字选择BU。
    ...
    ...
    ...    ---
    ...    == 范围 ==
    ...    | \ \ \ \ 私有云平台。
    ...
    ...
    ...    ---
    ...    == 参数 ==
    ...    | \ \ \ \ _${bu}_ --- _必填_ 表示要选择的BU名字。可选项有：
    ...    - 房友产品部 ---> 代表房友BU
    ...    - 易居营销
    ...    - 筑想科技
    ...    - 克而瑞信息
    ...    - 时钟教室
    ...    - 房金所产品部
    ...    - 在线金融产品部
    ...    - 首播产品部
    ...    - 库拍事业部
    ...    - 萌宠社区产品部
    ...    - 家装产品部
    ...    - VR产品部
    ...    - 流媒体产品部
    ...    - 支付产品部
    ...    - 云通讯产品部
    ...    - 前端技术部
    ...    - 技术保障部
    ...    - 数据技术部
    ...    - 信息技术部
    ...    - 易微链
    ...    - 在线宝库
    ...    - 实惠
    ...    - 房价点评
    ...    - 乐居
    ...    - 太德励拓
    ...
    ...    === 返回值 ===
    ...    | \ \ \ \ 无。
    ...    ---
    ...    == 说明 ==
    ...    | \ \ \ \ Bu名称可能会更改，以实际为准
    ${bu0}    set variable    ${GE_Link_Bu_Part}${bu}
    wait until element is visible    ${bu0}
    click link    ${bu0}
    wait until element is enabled    ${bu0}
    wait until element is visible    ${bu0}

L_BuList_OpenOrClose
    [Documentation]    ${status}: open/close/unknown
    ${c}    run keyword and return status    page should contain element    ${GE_Li_BuList_Close}
    ${o}    run keyword and return status    page should contain element    ${GE_Li_BuList_Open}
    ${status}=    set variable if    '${c}' == 'True' and '${o}' == 'False'    close    '${o}' == 'True' and '${c}' == 'False'    open    unknown
    [Return]    ${status}

L_LoadingCtrl_ShowOrHide
    [Documentation]    ${status}: show/hide/unknown
    ${c}    run keyword and return status    page should contain element    ${GE_Div_LoadingCtrl_Show}
    ${o}    run keyword and return status    page should contain element    ${GE_Div_LoadingCtrl_Hide}
    ${status}=    set variable if    '${c}' == 'True' and '${o}' == 'False'    show    '${o}' == 'True' and '${c}' == 'False'    hide    unknown
    [Return]    ${status}

L_LoadingCtrl_Show
    [Arguments]    ${timeout}
    Comment    wait until page contains    ${GE_Div_LoadingCtrl_Show}    ${timeout}
    wait until page does not contain element    ${GE_Div_LoadingCtrl_Hide}    ${timeout}

L_LoadingCtrl_Hide
    [Arguments]    ${timeout}
    Comment    wait until page contains    ${GE_Div_LoadingCtrl_Hide}    ${timeout}
    wait until page does not contain element    ${GE_Div_LoadingCtrl_Show}    ${timeout}

L_Logon_Timeout_Goto
    [Arguments]    ${timeout}=3
    wait until element is visible    ${LO_Button_Timeout_Goto}
    click button    ${LO_Button_Timeout_Goto}
