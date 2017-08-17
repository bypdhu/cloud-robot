#!/usr/bin/env python
# -*- coding:utf-8 -*-
"""
This is variables about elements of html.

@editor: bianbian, 
@email : bianyunpeng@ehousechina.com, 
"""

import sys
reload(sys)
sys.setdefaultencoding("utf-8")

##################################################################

			# opdog - cloud

##################################################################



######################    ͨ通用(General)    ######################
GE_Btn_Ok = None
GE_A_BuList = '//a[@class="dropdown-toggle dropdown-toggle-content ng-binding"]'
GE_Li_BuList_Open = '//li[@class="dropdown selectui selectui01 open"]'
GE_Li_BuList_Close = '//li[@class="dropdown selectui selectui01"]'
#GE_A_Bu_Part1 = '//a[@value="'
#GE_A_Bu_Part2 = '"]'
GE_Link_Bu_Part = "link="
GE_Li_Bu_Group_Part1 = '//ul[@class="dropdown-menu selectui01-memu"]/li['
GE_Li_Bu_Group_Part2 = ']'
GE_Span_Bu_Group_Part = '/span'
GE_A_Bu_Group_Part1 = '/div/a['
GE_A_Bu_Group_Part2 = ']'
# loading page
GE_Div_LoadingCtrl_Show = '//div[@class="loader"]'
GE_Div_LoadingCtrl_Hide = '//div[@class="loader ng-hide"]'


#######################    登录(Logon)    #######################
# 
LO_Span_Erweima = 'erweima'
LO_Span_Account = 'account'
LO_Input_TxtLoginName = 'txtLoginName'
LO_Input_TxtPass = 'txtPass'
LO_Div_Login = 'login_btn '
LO_Button_Timeout_Goto = '//button[@class="swal2-confirm swal2-styled"]'


######################    总览(Overview)    ######################
# 