# selinux
```
setsebool -P httpd_can_network_connect on
```

# Protection acces admin
https://www.jeffgeerling.com/blogs/jeff-geerling/restrict-access-apache-solr
```
sudo iptables -A INPUT -p tcp -s localhost --dport 8983 -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 8983 -j DROP
```

## Autoriser une ip

```
sudo iptables -A INPUT -p tcp -s 111.222.333.444 --dport 8983 -j ACCEPT
```
