sudo apt update && sudo apt upgrade -y
sudo apt-get install -y build-essential
sudo apt install nano -y
cd ~
wget --no-check-certificate https://github.com/z3APA3A/3proxy/archive/0.9.3.tar.gz
tar xzf 0.9.3.tar.gz
cd ~/3proxy-0.9.3
sudo make -f Makefile.Linux
sudo mkdir /etc/3proxy
cd ~/3proxy-0.9.3/bin
sudo cp 3proxy /usr/bin/
sudo adduser --system --no-create-home --disabled-login --group proxy3
mkdir /etc/3proxy/
cd /etc/3proxy/
wget --no-check-certificate https://raw.githubusercontent.com/zai-one/3proxy/main/3proxy.cfg
wget --no-check-certificate https://raw.githubusercontent.com/zai-one/3proxy/main/.proxyauth
sudo chown proxy3:proxy3 -R /etc/3proxy
sudo chown proxy3:proxy3 /usr/bin/3proxy
sudo chmod 444 /etc/3proxy/3proxy.cfg
sudo chmod 400 /etc/3proxy/.proxyauth
sudo mkdir /var/log/3proxy
sudo chown proxy3:proxy3 /var/log/3proxy
cd /etc/systemd/system/
wget --no-check-certificate https://raw.githubusercontent.com/zai-one/3proxy/main/3proxy.service
sudo systemctl daemon-reload
sudo systemctl enable 3proxy
sudo systemctl start 3proxy
sudo ufw allow 3128/tcp
sudo iptables -I INPUT -p tcp -m tcp --dport 3128 -j ACCEPT
