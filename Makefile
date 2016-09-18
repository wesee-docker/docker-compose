build-api:
	cd /data/code/wesee-api; git pull origin master;
	docker run --rm -v /data/code/wesee-api:/go/src/tapi daocloud.io/billqiang/docker-golang-build /bin/sh -c "CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o tapi main.go"
	docker restart go1 go2 go3
web:
	docker-compose -f docker-web-compose.yml up -d
elk:
	docker-compoes -f docker-elk-compose.yml up -d 
spy:
	docker-compoes -f docker-spy-compose.yml up -d 
install-docker:
	chmod +x /data/compose/scripts/*.sh;
	sh /data/compose/scripts/install-docker-centos.sh;
install:
	mkdir -p /data/code; 
	ssh -T git@git.oschina.net;
	git clone git@git.oschina.net:tupai/wesee-music.git /data/code/music
	git clone git@git.oschina.net:tupai/wesee-admin.git /data/code/wesee
	git clone git@git.oschina.net:tupai/wesee-moman.git /data/code/moman
	git clone git@git.oschina.net:tupai/wesee-api.git /data/code/wesee-api
	git clone git@git.oschina.net:tupai/wemake.git /data/code/wemake
	git clone git@git.oschina.net:tupai/webuy.git /data/code/webuy
	git clone git@git.oschina.net:tupai/wesee-html.git /data/code/wesee-html
	git clone git@git.oschina.net:tupai/wesee-spy.git /data/code/spy
	ln -s /data/code/.env /data/code/wesee/.env
	ln -s /data/code/.env /data/code/moman/.env
	ln -s /data/code/.env /data/code/wesee-api/.env
	ln -s /data/code/.env /data/code/wemake/.env
	ln -s /data/code/.env /data/code/webuy/.env
	mkdir -p /data/log;
	git clone git@git.oschina.net:tupai/wesee-log.git /data/log
	chmod 777 /data/log -R;
	docker run --rm -it -v /data:/data daocloud.io/billqiang/docker-laravel-phpfpm /bin/bash -c "/data/compose/scripts/install-laravel-backend.sh"
import-db:
	cd /data/compose/scripts/; sh /data/compose/scripts/host-ip.sh;
	docker run --rm -it -v /data/compose:/data/compose daocloud.io/billqiang/docker-laravel-mariadb /bin/bash -c "/data/compose/scripts/install-mariadb.sh"
export-db:
	cd /data/compose/backup; mysqldump webuy --user=root --password=root --host=192.168.0.11 > webuy-db.sql;
	cd /data/compose/backup; mysqldump wemake --user=root --password=root --host=192.168.0.11 > wemake-db.sql;
	cd /data/compose/backup; mysqldump user --user=root --password=root --host=192.168.0.11 > user-db.sql;
	cd /data/compose/backup; mysqldump order --user=root --password=root --host=192.168.0.11 > order-db.sql;
	cd /data/compose/backup; mysqldump upload --user=root --password=root --host=192.168.0.11 > upload-db.sql;
	cd /data/compose/backup; mysqldump moman --user=root --password=root --host=192.168.0.11 > moman-db.sql;
