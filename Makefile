public/index.html: $(wildcard content/pl/*) config.toml
	hugo
	rsync -av public/ blog.lrem.net:blog.lrem.net
	rsync -av static/ blog.lrem.net:blog.lrem.net
	touch public/index.html
