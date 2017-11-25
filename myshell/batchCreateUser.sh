#创建账号  分组不分组只有一列useradd无法添加三个账号 添加账号  获取密码  执行最后一句
echo stu{4..6}|xargs -n 1|sed -r 's#(.*)#useradd \1;pass=$(date +%N|md5sum|cut -c 5-13);echo ${pass}|passwd --stdin \1;echo -e "\1 ${pass} \n">>/aa.log#g'|bash
#加入执行时间到日志
echo stu{4..6}|xargs -n 1|sed -r 's#(.*)#useradd \1;pass=$(date +%N|md5sum|cut -c 5-13);echo ${pass}|passwd --stdin \1;echo -e "\1 ${pass} $(date "+%F %T") \n">>/aa.log#g'|bash    