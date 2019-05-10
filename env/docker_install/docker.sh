# Docker installation and unloading

user=$(env | grep USER | cut -d "=" -f 2)
if [ "$user" == "root" ];then
	echo "The current user is root------Permission Allow"
else
	echo "The current user is $user------Permission Deny"
	exit
fi

if [ "$1" == "--help" -o "$1" == "" ];then
	echo "Usage:"
	echo "		--help:		using help"
	echo "		install:	install docker in your centos"
	echo "		uninstall:	uninstall docker from your centos"
	echo "		start:		start docker service"
	echo "		restart:	restart docker service"
	echo "		stop:		stop docker service"
	exit
	
elif [ "$1" == "install" ];then
	# docker
	# Install the necessary system tools
	yum install -y yum-utils device-mapper-persistent-data lvm2
	# Add software source information
	yum-config-manager --add-repo http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo
	# Update yum cache
	yum makecache fast && yum -y install docker-ce
	# install docker-compose
	pip install docker-compose --ignore-installed requests
	echo "-----------Install docker successfully--------------"
elif [ "$1" == "uninstall" ];then
	yum remove docker*
	# pip uninstall docker-compose
	rm -rf /usr/local/bin/docker-compose
	echo "-----------Uninstall docker successfully--------------"
elif [ "$1" == "start" ];then
	systemctl start docker
	echo "-----------Start docker successfully-------------"
elif [ "$1" == "stop" ];then
	systemctl stop docker
	echo "-----------Stop docker successfully-------------"
elif [ "$1" == "restart" ];then
	systemctl restart docker
	echo "------------Restart docker successfully-------------"
else
	echo "Error option -- [$1]"
	echo "Please use the options below:"
	echo "Usage:"
        echo "          --help:         using help"
        echo "          install:        install docker in your centos"
        echo "          uninstall:      uninstall docker from your centos"
        echo "          start:          start docker service"
        echo "          restart:        restart docker service"
        echo "          stop:           stop docker service"
	exit

fi
