#!/bin/bash
push () {
mkdir -p /push_static
if [ ! -e /push_static/static ];then
	 echo "没放置上传的statc目录,退出";
         exit;
fi

if [ ! -e /push_static/index.html ];then
	echo "index.html上传的文件不存在,退出"
        exit;
fi

mv /home/www/v48/public/static  /home/www/v48/public/static_$(date +%F)
mv /home/www/v48/public/index.html  /home/www/v48/public/index.html_$(date +%F)
cp -a  /push_static/static/ /home/www/v48/public/
cp -a  /push_static/index.html  /home/www/v48/public/
find /home/www/v48/public/ -name "static_2018*" -mtime +3|xargs rm -rf
find /home/www/v48/public/ -name "index.html_2018*" -mtime +3|xargs rm -f

}
rollbackup(){
	mv /home/www/v48/public/static /push_static/static_fail_$(date +%F)
        mv /home/www/v48/public/index.html  /push_static/index.html_fail_$(date +%F)
	mv /home/www/v48/public/static_$(date +%F) /home/www/v48/public/static
        mv /home/www/v48/public/index.html_$(date +%F)  /home/www/v48/public/index.html
}
case $1  in 
	p)
	push		
	;;
	rb)
	rollbackup
	;;
	*)
	echo "输入p上传,rb参数回滚"
	;;
esac
