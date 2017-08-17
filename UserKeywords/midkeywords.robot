*** Settings ***
Resource          lowKeywords.robot

*** Keywords ***
M_Logon_Account
    [Arguments]    ${user}    ${pass}
    L_Logon_InputText    ${user}
    L_Logon_InputPass    ${pass}
    L_Logon_Login

M_BuList_Open
    wait until element is visible    ${GE_A_BuList}
    ${status}    L_BuList_OpenOrCLose
    run keyword if    '${status}' == 'close'    L_BuList_Click

M_BuList_Close
    wait until element is visible    ${GE_A_BuList}
    ${status}    L_BuList_OpenOrCLose
    run keyword if    '${status}' == 'open'    L_BuList_Click

M_BuList_GetDic
    # todo: find usage of webelement
    Comment    wait until element is visible    ${GE_Li_Bu_Group}
    Comment    @{groups}    get webelements    ${GE_Li_Bu_Group}
    ${dict}    create dictionary
    : FOR    ${i}    IN RANGE    1    10
    \    ${group}    set variable    ${GE_Li_Bu_Group_Part1}${i}${GE_Li_Bu_Group_Part2}
    \    ${s1}    run keyword and return status    page should contain element    ${group}
    \    exit for loop if    '${s1}' == 'False'
    \    @{list}    M_BuList_GetDic_Of_Group    ${group}
    \    ${groupname}    get text    ${group}${GE_Span_Bu_Group_Part}
    \    set to dictionary    ${dict}    ${groupname}    ${list}
    [Return]    ${dict}

M_BuList_GetDic_Of_Group
    [Arguments]    ${element}
    @{list}    create list
    : FOR    ${i}    IN RANGE    1    20
    \    ${item}    set variable    ${element}${GE_A_Bu_Group_Part1}${i}${GE_A_Bu_Group_Part2}
    \    ${s2}    run keyword and return status    page should contain element    ${item}
    \    exit for loop if    '${s2}' == 'False'
    \    ${itemname}    get text    ${item}
    \    append to list    ${list}    ${itemname}
    [Return]    @{list}

M_BuList_GetList
    M_BuList_Open
    ${dict}    M_BuList_GetDic
    @{keys}    get dictionary keys    ${dict}
    @{list}    create list
    : FOR    ${key}    IN    @{keys}
    \    @{list1}    get from dictionary    ${dict}    ${key}
    \    append to list    ${list}    @{list1}
    [Return]    @{list}

M_Logon_Handle_Timeout
    ${status}    run keyword and return status    wait until page contains element    ${LO_Button_Timeout_Goto}    3
    run keyword if    '${status}'=='True'    L_Logon_Timeout_Goto
