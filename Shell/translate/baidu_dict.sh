#!/bin/bash
#coding=utf-8

#================================================================
#   File Name   : baidu_dict.sh
#   Author      : ZhengFuYuan
#   Create Date : 2018-01-04
#   Description : 使用百度词典。注意：只能将英语翻译成中文
#                 依赖: wget, sed, awk
#                 用法: ./baidu_dict.sh keyword    支持英文句子，如下:
#                       $ ./baidu_dict.sh I like you
#                       我喜欢你
#                 原理: 从返回的html结果中，从"<a href="?wd=我喜欢你">我喜欢你</a>"提取出'>'和'<'之间的内容
#================================================================

#set -v

# 获取所有参数
keyword=$@
# 将参数中的空格替换成URL编码'%20'
keyword=`echo $keyword | sed "s/ /%20/g"`
url='http://dict.baidu.com/s?wd='$keyword'&f=3'
# 代理服务器（可选）
# wget_proxy='http_proxy=http://192.168.1.155:8888'

# 避免这次wget失败而使用上次的结果
rm /tmp/dict > /dev/null 2>&1

wget $url -e $wget_proxy -O /tmp/dict -nv > /dev/null 2>&1; cat /tmp/dict | awk '/href=\"\?wd=/{print $2}' | awk -F '[<>]' '{print $2}'

