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

if [ ! -d "out" ]
  then
    mkdir out
fi

nohup tensorboard --logdir=$logdir --port=$port --reload-interval=5 >> out/$case.tb.out &


#linux 下shell中if的“-e，-d，-f”是什么意思
文件表达式
-e filename 如果 filename存在，则为真
-d filename 如果 filename为目录，则为真 
-f filename 如果 filename为常规文件，则为真
-L filename 如果 filename为符号链接，则为真
-r filename 如果 filename可读，则为真 
-w filename 如果 filename可写，则为真 
-x filename 如果 filename可执行，则为真
-s filename 如果文件长度不为0，则为真
-h filename 如果文件是软链接，则为真
filename1 -nt filename2 如果 filename1比 filename2新，则为真。
filename1 -ot filename2 如果 filename1比 filename2旧，则为真。


整数变量表达式
-eq 等于
-ne 不等于
-gt 大于
-ge 大于等于
-lt 小于
-le 小于等于


字符串变量表达式
If  [ $a = $b ]                 如果string1等于string2，则为真
                                字符串允许使用赋值号做等号
if  [ $string1 !=  $string2 ]   如果string1不等于string2，则为真       
if  [ -n $string  ]             如果string 非空(非0），返回0(true)  
if  [ -z $string  ]             如果string 为空，则为真
if  [ $sting ]                  如果string 非空，返回0 (和-n类似) 


    逻辑非 !                   条件表达式的相反
if [ ! 表达式 ]
if [ ! -d $num ]               如果不存在目录$num


    逻辑与 –a                   条件表达式的并列
if [ 表达式1  –a  表达式2 ]


    逻辑或 -o                   条件表达式的或
if [ 表达式1  –o 表达式2 ]


