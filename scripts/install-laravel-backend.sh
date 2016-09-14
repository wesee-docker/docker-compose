mkdir -p /data/code/moman/bootstrap/cache/;
mkdir -p /data/code/wemake/bootstrap/cache/;
mkdir -p /data/code/wesee/bootstrap/cache/;

touch /data/code/moman/bootstrap/cache/services.json;
touch /data/code/wemake/bootstrap/cache/services.json;
touch /data/code/wesee/bootstrap/cache/services.json;

cd /data/code/wemake/vendor;composer install;
cd /data/code/moman/vendor;composer install;
cd /data/code/wesee/vendor;composer install;

mkdir -p /data/log/wesee;
mkdir -p /data/log/wesee/framework/cache;
mkdir -p /data/log/wesee/framework/sessions;
mkdir -p /data/log/wesee/framework/views;
chmod 777 /data/log/wesee -R;
mkdir -p /data/log/wemake;
mkdir -p /data/log/wemake/framework/cache;
mkdir -p /data/log/wemake/framework/sessions;
mkdir -p /data/log/wemake/framework/views;
chmod 777 /data/log/wemake -R;
mkdir -p /data/log/moman;
mkdir -p /data/log/moman/framework/cache;
mkdir -p /data/log/moman/framework/sessions;
mkdir -p /data/log/moman/framework/views;
chmod 777 /data/log/moman -R;

## webuy config
chmod 777 /data/code/webuy/data/config.php
