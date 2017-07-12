*** Settings ***
Resource          midkeywords.robot
Variables         ../Variables/spec.py

*** Keywords ***
test
    [Documentation]    = WifiBeaconInterval =
    ...    ---
    ...    *WifiBeaconInterval* _${interval}_ _*${Act}*_
    ...    ---
    ...    == 功能 ==
    ...    | \ \ \ \ 设置802.11 信标帧间隔时间（ _Beacon Interval_ ）。
    ...
    ...
    ...    ---
    ...    == 范围 ==
    ...    | \ \ \ \ DUT具备对此设置的功能。
    ...
    ...
    ...    ---
    ...    == 参数 ==
    ...    | \ \ \ \ _${interval}_ --- _必填_ 表示信标帧间隔微秒数。 _*默认值： 100*_ ， 允许的取值范围是 _*20-1000*_ 。
    ...
    ...    | \ \ \ \ _*${Act}*_ --- _可选_ 默认为： _*set*_ 。该参数是一个控制关键字行为的开关。可选项有：
    ...    - _set_ ---> 表示希望通过此关键字对WiFi的Beacon Interval 进行设置 默认为此选项；
    ...    - _get_ ---> 表示希望通过此关键字获取当前DUT的WiF的Beacon Interval。
    ...
    ...    === 返回值 ===
    ...    | \ \ \ \ ${status} --- 表示操作结果。
    ...    - 当 _*${Act}*_ 为 _set_ 时，此参数返回 _ok_ 或者 _fail_ 分别表示设置成功或者失败 ；
    ...    - 当 _*${Act}*_ 为 _get_ 时，此参数返回当前WiFi的Beacon Interval 。
    ...    ---
    ...    == 说明 ==

InitSuiteSetUp
    # set screenshot dir
    set screenshot directory    ${CaptureImages_Path}
    # input user name and password
    ${loglevel}    set log level    NONE
    ${name}    run keyword if    '${User_Name}' == ''    get value from user    Input user name
    ${pass}    run keyword if    '${User_Pass}' == ''    get value from user    Input user password    hidden=true
    ${name}    set variable if    '${name}' == 'None'    ${User_Name}    ${name}
    ${pass}    set variable if    '${pass}' == 'None'    ${User_Pass}    ${pass}
    set global variable    ${User_Name}    ${name}
    set global variable    ${User_Pass}    ${pass}
    set log level    ${loglevel}
    # set suite metadata
    set suite metadata    测试版本    ${Cloud_Version}

TestSimpleTeardown
    run keyword if test failed    close all browsers

LogonCloud
    L_Open_Browser    ${Base_Url}    ${Base_Browser}
    Maximize Browser Window
    L_Logon_Account
    M_Logon_Account    ${User_Name}    ${User_Pass}
    sleep    5

CloseAllWindows
    L_Close_Browsers

获得BU列表字典
    M_BuList_Open
    ${dict}    M_BuList_GetDic
    [Return]    ${dict}

ChooseBu
    [Arguments]    ${bu}
    [Documentation]    = ChooseBu =
    ...    ---
    ...    *ChooseBu* _${bu}_
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
    M_BuList_Open
    L_BuList_Choose_Bu    ${bu}
    L_LoadingCtrl_Hide    15

GetBuList
    @{list}    M_BuList_GetList
    [Return]    @{list}
