ip=`ifconfig -a|grep inet|grep 10|grep -v 127.0.0.1|grep -v inet6|awk '{print $2}'|tr -d "addr:"`

echo "
mysql -uroot -proot -h$ip < /data/compose/backup/create-db.sql;
mysql -uroot -proot -h$ip -D webuy < /data/compose/backup/webuy-opt.sql;
mysql -uroot -proot -h$ip -D wemake < /data/compose/backup/wemake-opt.sql;
mysql -uroot -proot -h$ip -D user < /data/compose/backup/user-opt.sql;
mysql -uroot -proot -h$ip -D order < /data/compose/backup/order-opt.sql;
mysql -uroot -proot -h$ip -D upload < /data/compose/backup/upload-opt.sql;
mysql -uroot -proot -h$ip -D moman < /data/compose/backup/moman-opt.sql;
" > /data/compose/scripts/install-mariadb.sh
