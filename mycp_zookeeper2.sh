SERVER="192.168.79.129  192.168.79.131"

auto_zookp_cp() {
    expect {*yes/no* {send "yes\r"}
    expect {*password* {send "123456\r"}
}


for myserver in ${SERVER}
do
    scp -r /root/app root@${myserver}:/root/
    auto_zookp_cp
done
