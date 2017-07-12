*** Settings ***
Resource          ../../../UserKeywords/highkeywords.robot

*** Test Cases ***
登录测试1
    LogonCloud
    sleep    5
    Comment    ChooseBu    技术保障部
    ${dict}    获得BU列表字典
    [Teardown]    run keyword if test failed    simple teardown
