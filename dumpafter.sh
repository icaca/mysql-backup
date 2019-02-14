MAX_BACKUPS=14

if [ -n "${MAX_BACKUPS}" ]; then
    while [ $(ls /db -N1 | wc -l) -gt ${MAX_BACKUPS} ];
    do
        BACKUP_TO_BE_DELETED=$(ls /db -N1 | sort | head -n 1)
        echo "   Backup ${BACKUP_TO_BE_DELETED} is deleted"
        rm -rf /db/${BACKUP_TO_BE_DELETED}
    done
fi

echo "执行时间 	`date '+%Y%m%d %H%M%S'`" >>/db/mysql_backup.log
echo "=> Backup done" >>/db/mysql_backup.log

