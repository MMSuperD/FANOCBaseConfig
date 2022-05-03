#!/bin/bash

num=$1

if [[ $# -lt 1 ]]; then
	#没有参数
	#这个是推送
	pod repo push FANSpec FANOCBaseConfig.podspec --use-libraries --allow-warnings
fi

if [[ $num == 1 ]]; then
	#本地验证
	echo "本地验证开始"
	pod lib lint --use-libraries --allow-warnings
	echo "本地验证结束"

fi

if [[ $num == 2 ]]; then
	#远程验证
	echo "远程验证开始"
	pod spec lint --use-libraries --allow-warnings
	echo "远程验证结束"
fi