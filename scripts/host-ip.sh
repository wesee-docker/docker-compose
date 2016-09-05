ip=`ifconfig -a|grep inet|grep 10|grep -v 127.0.0.1|grep -v inet6|awk '{print $2}'|tr -d "addr:"`

echo "
mysql -uroot -proot -h$ip < /data/compose/backup/create-db.sql;
mysql -uroot -proot -h$ip -d webuy < /data/compose/backup/webuy-opt.sql;
mysql -uroot -proot -h$ip -d wemake < /data/compose/backup/wemake-opt.sql;
mysql -uroot -proot -h$ip -d user < /data/compose/backup/user-opt.sql;
mysql -uroot -proot -h$ip -d order < /data/compose/backup/order-opt.sql;
mysql -uroot -proot -h$ip -d upload < /data/compose/backup/upload-opt.sql;
mysql -uroot -proot -h$ip -d moman < /data/compose/backup/moman-opt.sql;
" > /data/compose/scripts/install-mariadb.sh
