#!/bin/bash
for user in $(echo user{1..10})
do
        userdel -r $user && mv /var/spool/mail/$user /tmp

done