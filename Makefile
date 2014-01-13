SSH_HOST=salixos.org
SSH_PORT=22
SSH_USER=web
SSH_TARGET_DIR=/srv/www/www.salixos.org

html: 
	txt2tags index.t2t
	txt2tags translate.t2t
	txt2tags chat.t2t
	txt2tags download.t2t
	txt2tags thankyou.t2t
	txt2tags donations.t2t
	txt2tags mailinglists.t2t

help:
	@echo 'Makefile for a pelican Web site                                        '
	@echo '                                                                       '
	@echo 'Usage:                                                                 '
	@echo '   make                             (re)generate the web site          '
	@echo '   make html                        same as make                       '
	@echo '   make clean                       remove the generated files         '
	@echo '   make upload                      upload the web site via rsync+ssh  '
	@echo '                                                                       '

clean:
	find ./ -name "*.html"  -delete

upload: html
	rsync -e "ssh -p $(SSH_PORT)" \
		-avz \
		--exclude "*.t2t" \
		--exclude ".git" \
		--exclude ".gitignore" \
		--exclude Makefile \
		--delete ./ $(SSH_USER)@$(SSH_HOST):$(SSH_TARGET_DIR)

.PHONY: html help clean upload
