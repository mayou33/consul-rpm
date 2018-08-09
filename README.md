 
##wget http://rpms.adiscon.com/v8-stable/rsyslog.repo -P /etc/yum.repos.d/ 



#yum -y install rsyslog 


### 安装 ruby

yum install -y rpm-build ruby rubygems ruby-devel


### 安装 fpm

gem install fpm
 

##下载



git clone https://github.com/mayou33/consul-rpm.git

cd consul-rpm

### build rpm

``` sh
./build.sh 1.2.2
```

####安装 cousul

 rpm -ivh consul-1.2.2-1.x86_64.rpm 
 
 ###查看一下

rpm -ql consul

修改 /data/consul/config/consul.json

修改/usr/lib/systemd/system/consul.service


systemctl daemon-reload

systemctl start consul

systemctl enable consul

systemctl status consul

此时可访问任意一台 Server 节点的 UI 界面，http://IP:8500
