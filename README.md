# ss-docker

本项目使用 docker 部署 shadowsocks

网页使用https加密，支持多用户，多种加密方式，流量控制，定期清除账号等功能

**注意：** 要求系统为 centos7 ，或其他完美支持docker的系统，请不要使用 centos6 。

## 部署

1. 安装docker和docker-compose

    ```bash
    // 下载docker，Docker 官方提供了一键安装脚本
    $ sudo curl -sSL https://get.docker.com/ | sh

    // 下载docker-compose并赋予运行权限
    $ sudo curl -L https://github.com/docker/compose/releases/download/1.8.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose

    $ sudo chmod a+x /usr/local/bin/docker-compose
    ```

2. 下载并进入项目

    ```bash
    // 下载项目
    $ git clone https://github.com/vinsoncho/ss-docker.git

    //进入项目
    $ cd ss-docker
    ```

3. 运行项目

    ```bash
    docker-compose up -d    # 如果提示docker daemon未启动，则执行 `systemctl start docker` 后再试
    ```

4. 访问 `https://yourip:53333`，使用账号: `admin@admin.com`，密码：`123456` 登录，请及时修改密码。

## 重启和迁移

1. 重启项目：进入ss-docker文件夹，执行 `docker-compose up -d`
2. 迁移：只需将ss-docker文件夹打包到新的服务器即可

## 说明

1. 本项目不具有用户注册的功能，如有需要，自行配置 `webgui.yml` 里的email参数
2. 如果要修改manager文件夹中的内容，请先进行配置，配置完成后删除manager文件夹下的`webgui.sql`,`db.sql`,`logs`，（删除此3个文件后，用户数据将丢失，并且admin账号也无法使用，要配置email，第一个注册的用户会成为管理员）然后回到项目根目录执行`docker-compose rm`，最后执行`docker-compose up -d`
3. 如果你修改了nginx文件夹中的内容，请先进行配置，配置完成后执行`docker-compose rm`，然后执行`docker-compose build`，最后启动项目 `docker-compose up -d`