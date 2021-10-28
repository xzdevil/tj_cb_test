#!/bin/bash
cd maker_lsm
VERSION=$1 #版本号为输入的第一个参数
if [ ! $1 ]; then echo "版本号为空";exit 1;fi 
	echo "正在解开版本为$VERSION的服务器压缩包"
	sh -x ServerExport.sh $VERSION
	if [ $? -ne 0 ]; then echo "no game-server-"$VERSION".zip";exit 1;fi
	sh -x ServerConfig_MatchTest.sh
	cd ..
	cmd /c game_start.bat