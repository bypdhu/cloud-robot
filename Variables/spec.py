#!/usr/bin/env python
#-*- coding:utf-8 -*-
"""
This is for user and environment variables.
@editor: bianbian, 
@email : bianyunpeng@ehousechina.com, 
"""

import sys
reload(sys)
sys.setdefaultencoding("utf-8")

import os
import getpass


_FILEPATH = os.path.split(os.path.abspath(__file__))[0]
CURRENT_USER = getpass.getuser()

##################################################################

			# opdog - cloud

##################################################################



#####################  用户通用(UserGeneral)  #####################
Cloud_Version = '2.2.1'
Base_Browser = 'ff'
Base_Url = "http://ejucloud.cn"
User_Name = ''
User_Pass = ""
CaptureImages_Path = unicode(os.path.realpath(os.path.join(_FILEPATH,"..","Results","CaptureImages")))
Resources_Path = unicode(os.path.realpath(os.path.join(_FILEPATH,"..","Resources")))
Scripts_Path = unicode(os.path.realpath(os.path.join(_FILEPATH,"..","Scripts")))
Results_Path = unicode(os.path.realpath(os.path.join(_FILEPATH,"..","Results")))
# Bu_Dict_List = {
# unicode('企业集团'): [unicode('房友产品部'), unicode('易居营销'), unicode('筑想科技'), unicode('克而瑞信息')],
# unicode('托管与指导'): [unicode('时钟教室'), unicode('房金所产品部'), unicode('在线金融产品')],
# unicode('孵化与投资'): [unicode('首播产品部'), unicode('库拍事业部'), unicode('萌宠社区产品部'), unicode('家装产品部')],
# unicode('专业技术'): [unicode('VR产品部'), unicode('流媒体产品部'), unicode('支付产品部'), unicode('云通讯产品部'),unicode('前端技术部')],
# unicode('公共服务'): [unicode('技术保障部'), unicode('数据技术部'), unicode('信息技术部')],
# unicode('其它'): [unicode('易微链'), unicode('在线宝库'), unicode('实惠'), unicode('房价点评'), unicode('乐居'), unicode('太德励拓')],
# }
Bu_Dict_List = {
u'企业集团': [u'房友产品部', u'易居营销', u'筑想科技', u'克而瑞信息'],
u'托管与指导': [u'时钟教室', u'房金所产品部', u'在线金融产品部'],
u'孵化与投资': [u'首播产品部', u'库拍事业部', u'萌宠社区产品部', u'家装产品部'],
u'专业技术': [u'VR产品部', u'流媒体产品部', u'支付产品部', u'云通讯产品部',u'前端技术部'],
u'公共服务': [u'技术保障部', u'数据技术部', u'信息技术部'],
u'其它': [u'易微链', u'在线宝库', u'实惠', u'房价点评', u'乐居', u'太德励拓'],
}
Choose_One_Bu_Name = u'技术保障部'
