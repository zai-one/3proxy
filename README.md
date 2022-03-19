<h1 align="center">How to install ipv4 HTTP proxy for own server. Install script 3proxy 0.9.3 for Debian & Ubuntu.</h1>

<h3 align="center">Manual:</h3>

1. Download script

```
wget --no-check-certificate https://raw.githubusercontent.com/zai-one/3proxy/main/3proxyinstall.sh
```

2. Make executable
```
 chmod +x 3proxyinstall.sh
```
3. Run script
```
./3proxyinstall.sh
```
4. Change Username and Password!
```
nano /etc/3proxy/.proxyauth
```
5. Find uid & gid
```
id proxy3
```
6. Change config
```
nano /etc/3proxy/3proxy.cfg
```
7. Reboot
```
sudo reboot
```
Best Regards, <a href="http://zai.one">zai.one</a>
