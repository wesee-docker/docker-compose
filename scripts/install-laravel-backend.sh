mkdir -p /data/code/moman/bootstrap/cache/;
mkdir -p /data/code/wemake/bootstrap/cache/;
mkdir -p /data/code/wesee/bootstrap/cache/;

touch /data/code/moman/bootstrap/cache/services.json;
touch /data/code/wemake/bootstrap/cache/services.json;
touch /data/code/wesee/bootstrap/cache/services.json;

cd /data/code/wemake/vendor;composer install;
cd /data/code/moman/vendor;composer install;
cd /data/code/wesee/vendor;composer install;

mkdir -p /data/log/storage/wesee; 
chmod 777 /data/log/storage/wesee -R;
mkdir -p /data/log/storage/wemake; 
chmod 777 /data/log/storage/wemake -R;
mkdir -p /data/log/storage/moman; 
chmod 777 /data/log/storage/moman -R;
