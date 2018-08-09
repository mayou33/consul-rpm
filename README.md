 
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
