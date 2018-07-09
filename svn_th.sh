#!/bin/bash
for i in    `find /home/20180629tmp/svnfwq/uadminv4 -name .svn` 
do

    echo $i
    aa=`dirname $i`
    bb=`echo ${aa}|sed -n  "s#/home/20180629tmp/svnfwq/#/home/www/#gp"`
    echo "$i      $bb"
    #mv $i  $bb/
    
    
    

done
