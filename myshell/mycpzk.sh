#!/usr/bin/expect

SERVERS="192.168.79.129  192.168.79.131"
PASSWORD=123456

auto_ssh_copy_id() {
    echo "2"
    expect -c "set timeout -1;
        spawn scp -r /root/app root@$1:/root/;
        expect {
            *(yes/no)* {send -- yes\r;exp_continue;}
            *assword:* {send -- $2\r;exp_continue;}
            eof        {exit 0;}
        }";
}

sh_copy_id_to_all() {
    echo "111"
    for SERVER in $SERVERS
    do
        auto_ssh_copy_id $SERVER $PASSWORD
        echo ${SERVER}
    done
}
sh_copy_id_to_all
