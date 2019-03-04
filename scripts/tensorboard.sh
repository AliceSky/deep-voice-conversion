#!/usr/bin/env bash

if [ $# -lt 2 ]  # $# 取得shell脚本参数个数，-lt  即 less than，小于
  then
    echo "insufficient arguments. case=$1, port=$2" # $1在shell中称为“位置参数”，表示传入的第1个参数（第1个入参）
    exit 0 # exit 0 代表正常运行程序并退出程序,exit 1 代表非正常运行导致退出程序。其实目的就是: 程序退出后, 用户可以 echo $? 来查看是 0 还是 1, 从而达到检测程序是正常结束退出还是产生错误而退出的目的.

fi # 用fi表示if语句块的结束

case=$1
port=$2
base_logdir="./logdir"
logdir="$base_logdir/$case"

echo "start. case=$case, port=$port"

# Stop the existing first.
sh scripts/tensorboard_stop.sh $case

if [ ! -d "out" ] #如果不存在目录名为out
  then
    mkdir out  #则创建out目录
fi

nohup tensorboard --logdir=$logdir --port=$port --reload-interval=5 >> out/$case.tb.out &


