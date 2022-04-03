#!/bin/bash
echo -e "\033[5;34m 配置默认密码方便ssh登录 \033[0m"
expect <<EOF
set timeout 6
spawn  passwd root
expect {
     "New password:" { send "$ROOT_PASSWORD\n"; exp_continue;}
     "Retype password:" { send "$ROOT_PASSWORD\n"; }
}
expect eof
EOF
