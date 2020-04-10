# 安装说明

## 1.dc1配网

https://www.right.com.cn/forum/thread-543860-1-1.html

按教程配置dc1无线密码，确保连接到路由器，

**最好在路由器上固定dc1的ip地址**



## 2.域名劫持

https://www.right.com.cn/forum/thread-794878-1-1.html

按教程劫持斐讯服务器域名到你要安装服务器的ip上

要劫持的斐讯服务器域名：**Smartplugconnect.phicomm.com**



## 3.安装dc1server

脚本安装和 docker安装二选一

### 3.1 脚本安装

```bash
//安装
wget https://raw.githubusercontent.com/ZXQ-Kyle/N1Script/master/dc1.sh
bash dc1.sh

//卸载
wget https://raw.githubusercontent.com/ZXQ-Kyle/N1Script/master/dc1.sh
bash dc1.sh uninstall
```

>  手动下载地址 https://github.com/ZXQ-Kyle/N1Script



### 3.2 docker安装

docker安装要区分平台架构

#### 3.2.1 N1之类的盒子产品，arm架构的

```
docker run -d  \
        --name=dc1server  \
        --restart=always  \
        -p 8000:8000  \
        -p 8800:8800  \
        -p 8880:8880  \
        -v /dc1server/:/opt/  \
        ponyopapa/dc1_server
```

#### 3.2.2 电脑或群晖

```
docker run -d  \
        --name=dc1server  \
        --restart=always  \
        -p 8000:8000  \
        -p 8800:8800  \
        -p 8880:8880  \
        -v /dc1server/:/opt/  \
        ponyopapa/dc1_server:amd64
```



按上述指令启动后：

数据库文件位置/dc1server/dc1_database.db

token配置文件/dc1server/dc1.conf

```
//配置文件内容
token=dc1server
```

8000是dc1的数据端口，不要更改！！！

8800是手机端的推送端口，按需修改

8880是手机端的http端口，按需修改



> 启动容器后可以使用以下命令监听日志   docker logs -f -t dc1server 



## 4.安装手机端

安装手机前可以先检测下服务端是否工作

在浏览器中打开以下网址：http://你的ip:8880/api/queryDeviceList?token=111

如果显示结果如下，说明服务端已经启动

```json
{
    "code": 403,
    "message": "token验证失败！"
}
```



1. 安装apk，下载地址：https://github.com/ZXQ-Kyle/N1Script/tree/master/Files

2. 点击右上角齿轮进入设置页面

3. 按说明设置服务器地址，然后点击确定

   ![设置](http://lc-6ru2eSdD.cn-e1.lcfile.com/9e92034548644b187b02/md_%E5%AE%89%E8%A3%85%E8%AF%B4%E6%98%8E01.jpg)

   

## 5.相关网址

恩山帖子地址：https://www.right.com.cn/forum/thread-907351-1-1.html

docker地址：https://hub.docker.com/r/ponyopapa/dc1_server

源码及安装脚本、安装文件：https://github.com/ZXQ-Kyle/N1Script

https://github.com/ZXQ-Kyle/Dc1Server

https://github.com/ZXQ-Kyle/Dc1Control