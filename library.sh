zabbix_scripts_dir=/etc/zabbix/scripts/
zabbix_conf_dir=/etc/zabbix/zabbix_agentd.d/
zabbix_conf2_dir=/etc/zabbix/zabbix_agentd2.d/
zabbix_conf_file=plesk-zabbix-monitor.conf

askToUpdate()
{
	echo "Are you sure that you want to update? I will replace all of my files"
	echo "Type \"agree\" if you agree or anything else to exit."
	read update_answer
	if [[ "$update_answer" != "agree" ]]
	then
		echo "Exiting..."
		exit 5
	fi
}

testRequirements()
{
	echo "Checking if zabbix agent requirements are ok..."

	echo "Checking if some config file with same name exist..."
	for zabbix_config in $zabbix_conf_dir $zabbix_conf2_dir
	do
		if [ -f ${zabbix_config}/${zabbix_conf_file} ]
		then
			if echo $0 | egrep -iq "install"
			then
				echo "The file >>> ${zabbix_conf_dir}/${zabbix_conf_file} <<< already exist. I do not want to break anything.."
				echo "If you are trying to update the script, please execute update.sh file"
				echo "Aborting..."
				exit 2
			else
				echo "The zabbix config file >>> ${zabbix_conf_dir}/${zabbix_conf_file} <<< does not exist. OK."
			fi
		fi
	done

	echo "Checking if zabbix scripts directory exist..."
	if [ ! -d $zabbix_scripts_dir ]
	then
		echo "Not found the directory >>> $zabbix_scripts_dir <<<. Aborting..."
		exit 4
	else
		echo "Directory >>> $zabbix_scripts_dir << found."
	fi

	if [ -d $zabbix_conf_dir ]
	then
		echo "Found the zabbix conf directory >>> $zabbix_conf_dir <<<."
	elif [ -d $zabbix_conf2_dir ]
	then
		echo "Found the zabbix conf directory >>> $zabbix_conf_dir <<<."
	else
		echo "Not found any zabbix conf dir ( >>> $zabbix_conf_dir <<< or >>> $zabbix_conf2_dir <<<)"
		exit 3
	fi
}

copyFiles()
{
	echo "Copying the files..."
	cp scripts/* $zabbix_scripts_dir

	if [ -d $zabbix_conf_dir ]
	then
		cp zabbix_conf/* $zabbix_conf_dir
	fi
	if [ -d $zabbix_conf2_dir ]
	then
		cp zabbix_conf/* $zabbix_conf2_dir
	fi
	echo "...done!"
}
