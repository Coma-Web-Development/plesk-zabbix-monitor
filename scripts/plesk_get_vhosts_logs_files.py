#!/usr/bin/python3.8
import os
import json

hosts_file="/etc/plesk-zabbix-monitor"
vhosts_dir="/var/www/vhosts/system/"

if os.path.exists(hosts_file):
	file = open(hosts_file, 'r')
	vhosts = [line.rstrip() for line in file.readlines()]
	file.close()
else:
    vhosts=os.listdir(vhosts_dir)

aux_prefix=vhosts_dir
aux_suffix=["/logs/proxy_access_ssl_log","/logs/proxy_access_log","/logs/access_log","/logs/access_ssl_log"]

data = []

for vhost in vhosts:
    for suffix in aux_suffix:
        file_absolut_path=''.join([aux_prefix,vhost,suffix])
        if os.path.exists(file_absolut_path):
            data.append({"{#HTTPDOMAIN}" : vhost, "{#HTTPLOGFILE}" : file_absolut_path})

json_object = json.dumps(data, indent = 4)
print(json_object)