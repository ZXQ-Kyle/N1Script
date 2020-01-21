# N1Script

## 开源服务端和客户端源码

https://github.com/ZXQ-Kyle/Dc1Server

https://github.com/ZXQ-Kyle/Dc1Control

### 更新记录：

- 2019.12.16

  v2.10

  1.添加倒计时功能

---

- 2019.12.14

  v2.9 

  1.添加服务器设置历史记录

  2.添加github主页跳转按钮

---

- 2019.12.13

  v2.8 (需更新服务端及手机端)

  1.修改定时为单控模式

---

- 2019.12.6

  v2.6(需更新服务端及手机端)

  1.添加周期执行功能

  2.优化数据请求成功率，修改数据请求为http协议，原tcp连接只做推送（完成部分）

  现在需要使用3个端口，8000连接dc1，8800连接手机，8880作为http请求端口

---

- 2019.9.23

  v2.3(需更新服务端及手机端)

  1.添加星期定时功能

  2.添加验证token

  3.修复android 9升级异常

---

- 2019.9.3
  1.添加定时功能

---

- 2019.8.26
  1.添加在线升级

---

- 2019.8.22
  1.添加本地数据库保存，默认路径为/opt/dc1_database.db

---

TODO:
1.bug修复
2.添加DC1网络配置功能

---

### N1脚本

dc1.sh是安装dc1服务器的脚本

服务端安装
```
wget https://raw.githubusercontent.com/ZXQ-Kyle/N1Script/master/dc1.sh
bash dc1.sh
```

服务端卸载
```
wget https://raw.githubusercontent.com/ZXQ-Kyle/N1Script/master/dc1.sh
bash dc1.sh uninstall
```

手机使用8800端口连接服务器

全部文件都在files文件夹中

### docker安装
https://hub.docker.com/r/ponyopapa/dc1_server
