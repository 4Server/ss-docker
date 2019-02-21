#!  /bin/bash
cd ~ &&

curl -L -O https://github.com/vinsoncho/ss-docker/archive/master.zip &&

yum -y install zip unzip &&

unzip ~/master.zip &&

rm -rf ~/master.zip &&

sudo curl -sSL https://get.docker.com/ | sh &&

sudo curl -L https://github.com/docker/compose/releases/download/1.8.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose &&

sudo chmod a+x /usr/local/bin/docker-compose &&

cd ~/ss-docker-master &&

systemctl start docker &&

docker-compose up -d &&

crontab ~/ss-docker-master/timer.sh &&

echo '>>>>>>>>>> 安装成功，访问 https://yourip:53333，账号: admin@admin.com，密码：123456 ，请及时修改密码 <<<<<<<<<<'

# 定时任务，每天重启一次
# 0 0 */1 * * cd ~/ss-docker-master && docker-compose restart
