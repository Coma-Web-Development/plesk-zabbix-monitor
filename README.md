# plesk-zabbix-monitor

## To install
```bash
bash install.sh
```

and then important the zabbix template in your zabbix instance and add it to the plesk host.

## To update
```bash
bash update.sh
```

## To add custom domains instead of search for all plesk domains

Create the file /etc/plesk-zabbix-monitor and add one domain per line. Example:

```bash
domain1.com
domain2.lv
domain3.lt
```

Note: The script will not check if domain is valid or if the file has bad codes. If the log file does not exist, it will just ignore the domain. So if the domain is right and is not appearign in zabbix discovery rule, is because something bad exist in this file.

## To remove

Remove the python script in
```bash
/etc/zabbix/scripts/
```
and remove the file plesk-zabbix-monitor.conf from

```bash
/etc/zabbix/zabbix_agentd.d/ or /etc/zabbix/zabbix_agentd2.d/
```

Then you can restart your zabbix-agent daemon. Do not forget to remove the zabbix template in your zabbix instance.
