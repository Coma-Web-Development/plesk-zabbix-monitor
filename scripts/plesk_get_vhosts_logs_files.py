#!/usr/bin/python3.8
import os
import json

vhosts_dir="/var/www/vhosts/system/"
vhosts=os.listdir(vhosts_dir)
aux_prefix=vhosts_dir
aux_suffix=["/logs/proxy_access_ssl_log","/logs/proxy_access_log","/logs/access_log ","/logs/access_ssl_log"]
data = []

aux_count=0
for vhost in vhosts:
	for suffix in aux_suffix:
		data.append({"{#HTTPDOMAIN}" : vhost, "{#HTTPLOGFILE}" : aux_prefix+vhost+suffix})
print(data)
