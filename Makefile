web:
	docker run --rm -v /data/code/wesee-api:/go/src/tapi daocloud.io/billqiang/docker-golang-build /bin/sh -c "CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o tapi main.go"
	docker-compose -f docker-web-compose.yml up -d
elk:
	docker-compoes -f docker-elk-compose.yml up -d 
spy:
	docker-compoes -f docker-spy-compose.yml up -d 
install:
	sudo yum update
	sudo tee /etc/yum.repos.d/docker.repo <<-'EOF'
		[dockerrepo]
		name=Docker Repository
		baseurl=https://yum.dockerproject.org/repo/main/centos/7/
		enabled=1
		gpgcheck=1
		gpgkey=https://yum.dockerproject.org/gpg
		EOF
	sudo yum install docker-engine
	sudo service docker start
	curl -L https://github.com/docker/compose/releases/download/1.8.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
	chmod +x /usr/local/bin/docker-compose
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
	mkdir -p /data/log;
	git clone git@git.oschina.net:tupai/wesee-log.git /data/log
	chmod 777 /data/log -R;
export-db:
	cd /data/compose/backup; mysqldump webuy --user=root --password=root --host=192.168.0.11 > webuy-db.sql;
	cd /data/compose/backup; mysqldump wemake --user=root --password=root --host=192.168.0.11 > wemake-db.sql;
	cd /data/compose/backup; mysqldump user --user=root --password=root --host=192.168.0.11 > user-db.sql;
	cd /data/compose/backup; mysqldump order --user=root --password=root --host=192.168.0.11 > order-db.sql;
	cd /data/compose/backup; mysqldump upload --user=root --password=root --host=192.168.0.11 > upload-db.sql;
	cd /data/compose/backup; mysqldump moman --user=root --password=root --host=192.168.0.11 > moman-db.sql;
