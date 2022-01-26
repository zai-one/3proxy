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
# Создаём папку для конфигов
mkdir /etc/3proxy/
cd /etc/3proxy/
# Конфиг на анонимный прокси
wget https://raw.githubusercontent.com/zai-one/3proxy/main/3proxy.cfg
# Конфиг на логин и пароль
wget https://github.com/SnoyIatk/3proxy/raw/master/.proxyauth
# Выставляем права доступа к файлам прокси-сервера
sudo chown proxy3:proxy3 -R /etc/3proxy
sudo chown proxy3:proxy3 /usr/bin/3proxy
sudo chmod 444 /etc/3proxy/3proxy.cfg
sudo chmod 400 /etc/3proxy/.proxyauth
# Создаем папку для ведения логов и назначаем права на нее
sudo mkdir /var/log/3proxy
sudo chown proxy3:proxy3 /var/log/3proxy
# Создаем файл-инициализации для systemd:
cd /etc/systemd/system/
wget https://raw.githubusercontent.com/zai-one/3proxy/main/3proxy.service
# Обновляем конфиги
sudo systemctl daemon-reload
# Добавляем в автозагрузку
sudo systemctl enable 3proxy
# Запускаем прокси-сервер
sudo systemctl start 3proxy
# Открываем порт
sudo ufw allow 3128/tcp
sudo iptables -I INPUT -p tcp -m tcp --dport 3128 -j ACCEPT
