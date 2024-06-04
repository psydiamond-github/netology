#!/bin/bash

log="/var/log/backup.log" # не уверен что правильно понял задачу
rsync_log="/var/log/rsync/rsync_backup.log" # в этот файл записываем синхронизированные файлы
dest="/tmp/backup/" 
src="/home/user/"
hostname=$(cat /etc/hostname)

if [ ! -d /var/log/rsync ]; then
	    mkdir /var/log/rsync
	        touch "${rsync_log}"
fi

# Запускаем бэкап

echo "$(date '+%b %d %H:%M:%S') ${hostname} Rsync: Starting daily backup ${src}" | tee -a "${log}"
rsync -azrptgoc --delete --exclude='.*/' "${src}" "${dest}" | tee -a "${rsync_log}"
 

# Обрабатываем ошибки
status=$?
if [ ${status} -ne 0 ]; then
	    echo "Rsync failed with exit code $status" | tee -a "${log}"
	        exit $status
	else
		    echo "Rsync completed successfully." | tee -a "${log}"
fi

echo "$(date '+%b %d %H:%M:%S') ${hostname} Rsync: Finished daily backup ${src}" | tee -a "${log}"
