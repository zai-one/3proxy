# Подготавливаем инструментарий
sudo su
apt update && apt upgrade -y
apt-get install -y build-essential
# Скачиваем и распаковываем исходники
cd ~
wget https://github.com/z3APA3A/3proxy/archive/0.9.3.tar.gz
tar xzf 0.9.3.tar.gz
# Компилируем
cd ~/3proxy-0.9.3
sudo make -f Makefile.Linux
# Устанавливаем
sudo mkdir /etc/3proxy
cd ~/3proxy-0.9.3/bin
sudo cp 3proxy /usr/bin/
sudo adduser --system --no-create-home --disabled-login --group proxy3

cd src
mkdir /etc/3proxy/
mv 3proxy /etc/3proxy/
cd /etc/3proxy/
wget --no-check-certificate https://github.com/SnoyIatk/3proxy/raw/master/3proxy.cfg
chmod 600 /etc/3proxy/3proxy.cfg
mkdir /var/log/3proxy/
wget --no-check-certificate https://github.com/SnoyIatk/3proxy/raw/master/.proxyauth
chmod 600 /etc/3proxy/.proxyauth
cd /etc/init.d/
wget --no-check-certificate  https://raw.github.com/SnoyIatk/3proxy/master/3proxy
chmod  +x /etc/init.d/3proxy
update-rc.d 3proxy defaults
