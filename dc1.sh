#!/usr/bin/env bash

JAR_URL="https://raw.githubusercontent.com/ZXQ-Kyle/N1Script/master/Files/dc1server.jar"
SERVICE_URL="https://raw.githubusercontent.com/ZXQ-Kyle/N1Script/master/Files/dc1server.service"

#手动下载文件信息提示
function echoManualDownloadInfo(){
    echo -e "\033[31m 文件下载失败，请登陆网页 https://github.com/ZXQ-Kyle/N1Script/tree/master/Files 手动下载 \033[0m"
    echo -e "\033[31m 手动下载文件并放置到/opt/目录下，再执行该脚本 \033[0m"
    echo -e "\033[31m 共需下载两个文件 dc1server.jar和dc1server.service \033[0m"
}

function echoGreenInfo(){
    echo -e "\033[32m ${1} \033[0m"
}

function autoStart(){
    cp /opt/dc1server.service /etc/systemd/system/
    rm -f /opt/dc1server.service

    echo ""
    echo -n  "是否设置开机自动启动？【Y/N】"
    read  auto
    if [[ ${auto} == "Y" || ${auto} == "y" ]]
    then
        systemctl enable dc1server.service
    fi

    systemctl start dc1server.service
    systemctl status dc1server.service
    echo ""
    echoGreenInfo "脚本执行完成，可输入命令 systemctl status dc1server.service 查看状态"
    echoGreenInfo "手机apk请到 https://github.com/ZXQ-Kyle/N1Script/tree/master/Files 下载"
}

#安装jdk，部署开机启动服务
function install(){
    if !(test -d /opt/)
    then
        mkdir /opt/
    fi
	cd /opt/

	if test -e /opt/dc1server.jar
	then
	    echo ""
	    echo -n  "是否删除原/opt/dc1server.jar，重新下载？【Y/N】"
        read  deleteOriJarFile
        if [[ ${deleteOriJarFile} == "Y" || ${deleteOriJarFile} == "y" ]]
        then
            echoGreenInfo "删除原/opt/dc1server.jar，重新下载"
	        rm -f /opt/dc1server.jar
	        wget ${JAR_URL}
        fi
    else
        wget ${JAR_URL}
	fi

	if test -e /opt/dc1server.service
	then
	    echo ""
		echo -n  "是否删除原/opt/dc1server.service，重新下载？【Y/N】"
        read  deleteOriServiceFile
        if [[ ${deleteOriServiceFile} == "Y" || ${deleteOriServiceFile} == "y" ]]
        then
            echoGreenInfo "删除原/opt/dc1server.service，重新下载"
	        rm -f /opt/dc1server.service
	        wget ${SERVICE_URL}
        fi
    else
        wget ${SERVICE_URL}
	fi
	

	if  test -e /opt/dc1server.jar -a -e /opt/dc1server.service
	then
        apt install -y default-jdk
	    autoStart
	else
        echoManualDownloadInfo
	fi
}

#卸载
function uninstall() {
    systemctl stop dc1server.service
    rm -f /opt/dc1server.jar
    rm -f /etc/systemd/system/dc1server.service
    echoGreenInfo "卸载完成！"
}


if [[ $1 == "uninstall" ]]
then
	uninstall
else
	install
fi
