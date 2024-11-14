build: ## build hugo source
	hugo --minify

deploy: build ## send built files to webserver
	rsync --rsync-path="sudo rsync" -rvhe ssh --progress --delete ./public/ tht@192.168.1.111:/var/www/theholytachanka.com/

.PHONY: build deploy