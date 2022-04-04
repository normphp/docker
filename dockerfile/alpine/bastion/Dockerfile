FROM alpine:3.15

ARG   ROOT_PASSWORD='123'
RUN   echo "#!/bin/bash" > /password.sh  \
&&  echo "expect <<EOF" >> /password.sh  \
&&  echo "set timeout 6" >> /password.sh \
&&  echo "spawn  passwd root" >> /password.sh \
&&  echo "expect {" >> /password.sh \
&&  echo '     "New password:" { send "$ROOT_PASSWORD\n"; exp_continue;}' >> /password.sh \
&&  echo '     "Retype password:" { send "$ROOT_PASSWORD\n"; }' >> /password.sh \
&&  echo "}" >> /password.sh \
&&  echo "expect eof" >> /password.sh \
&&  echo "EOF" >> /password.sh \
&& cat /etc/apk/repositories \
        && echo -e "\033[5;34m repositories \033[0m"  \
        && echo "https://mirrors.ustc.edu.cn/alpine/v3.15/main"              > /etc/apk/repositories  \
        && echo "https://mirrors.ustc.edu.cn/alpine/v3.15/community"         >> /etc/apk/repositories \
        && echo "https://mirrors.ustc.edu.cn/alpine/edge/community"     >> /etc/apk/repositories \
        && echo "https://mirrors.ustc.edu.cn/alpine/edge/testing"       >> /etc/apk/repositories \
        && cat /etc/apk/repositories  \
&&      apk add -U tzdata  \
&&      cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
&&      echo "Asia/Shanghai" > /etc/timezone \
&&      apk del tzdata \
&& apk upgrade --no-cache apk-tools \
&& apk add --no-cache  wget git vim  openssh  expect curl \
    && sed -i "s/#PermitRootLogin.*/PermitRootLogin yes/g" /etc/ssh/sshd_config  \
    && ssh-keygen -t dsa -P "" -f /etc/ssh/ssh_host_dsa_key  \
    && ssh-keygen -t rsa -P "" -f /etc/ssh/ssh_host_rsa_key  \
    && ssh-keygen -t ecdsa -P "" -f /etc/ssh/ssh_host_ecdsa_key  \
    && ssh-keygen -t ed25519 -P "" -f /etc/ssh/ssh_host_ed25519_key \
&& echo hostname \
&& date \
&& echo "bastion" > /etc/hostname  \
&& echo hostname \
&& /bin/sh /password.sh && rm -rf  /password.sh
CMD ["/usr/sbin/sshd", "-D"]
