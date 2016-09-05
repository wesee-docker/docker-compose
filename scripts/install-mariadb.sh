ip=`cat ./host-ip`
mysql -uroot -proot -h$ip < /data/compose/backup/*.sql
