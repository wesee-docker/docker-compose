web:
	docker run --rm -v /data/code/wesee-api:/go/src/tapi daocloud.io/billqiang/docker-golang-build /bin/sh -c "CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o tapi main.go"
	docker-compose -f docker-web-compose.yml up -d
elk:
	docker-compoes -f docker-elk-compose.yml up -d 
spy:
	docker-compoes -f docker-spy-compose.yml up -d 
install:
	ssh -T git@git.oschina.net;
	mkdir -p /data/code; 
	git clone git@git.oschina.net/tupai/wesee-music.git /data/code/music
	git clone git@git.oschina.net/tupai/wesee-admin.git /data/code/wesee
	git clone git@git.oschina.net/tupai/wesee-moman.git /data/code/moman
	git clone git@git.oschina.net/tupai/wesee-api.git /data/code/wesee-api
	git clone git@git.oschina.net/tupai/wemake.git /data/code/wemake
	git clone git@git.oschina.net/tupai/webuy.git /data/code/webuy
	git clone git@git.oschina.net/tupai/wesee-html.git /data/code/wesee-html
	git clone git@git.oschina.net/tupai/wesee-spy.git /data/code/spy
	mkdir -p /data/log;
	git clone git@git.oschina.net/tupai/wesee-log.git /data/log
	chmod 777 log -R;
