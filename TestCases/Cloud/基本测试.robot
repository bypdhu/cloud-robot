*** Settings ***
Test Teardown     test simple teardown
Resource          ../../UserKeywords/highkeywords.robot

*** Test Cases ***
登录测试
    LogonCloud
    CloseAllWindows

获得所有BU信息
    LogonCloud
    ${dict}    获得BU列表字典
    log dictionary    ${dict}
    @{keys}    get dictionary keys    ${dict}
    : FOR    ${key}    IN    @{keys}
    \    log    ${key}
    \    @{list}    get from dictionary    ${dict}    ${key}
    \    log list    ${list}
    CloseAllWindows

对比所有BU信息
    log    ${Bu_Dict_List}
    LogonCloud
    ${dict}    获得BU列表字典
    lists should be equal    ${Bu_Dict_List}    ${dict}
    @{keys}    get dictionary keys    ${dict}
    : FOR    ${key}    IN    @{keys}
    \    @{list1}    get from dictionary    ${dict}    ${key}
    \    @{list2}    get from dictionary    ${Bu_Dict_List}    ${key}
    \    lists should be equal    ${list1}    ${list2}
    CloseAllWindows

选择某一个BU
    LogonCloud
    ChooseBu    ${Choose_One_Bu_Name}
    sleep    5
    CloseAllWindows

依次选择所有BU
    LogonCloud
    Comment    ${dict}    获得BU列表字典
    Comment    @{keys}    get dictionary keys    ${dict}
    Comment    @{list}    create list
    Comment    : FOR    ${key}    IN    @{keys}
    Comment    \    @{list1}    get from dictionary    ${dict}    ${key}
    Comment    \    append to list    ${list}    @{list1}
    Comment    log list    ${list}
    @{list}    get bu list
    : FOR    ${bu}    IN    @{list}
    \    ChooseBu    ${bu}
    CloseAllWindows
