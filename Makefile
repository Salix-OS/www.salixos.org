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
	txt2tags guide.t2t
	txt2tags screenshots.t2t
	txt2tags team.t2t
	sed -i "/^<\/HEAD>/r screenshots_header.htm" screenshots.html
	sed -i "0,/^<\/HEAD>/s/^<\/HEAD>//1" screenshots.html

thumbs:
	@echo 'Creating thumbnails...'
	@for f in `ls screenshots/*.png | sed "s|^screenshots/||" | grep -v "thumb_"`; do \
		[ -f screenshots/thumb_$$f ] || convert screenshots/$$f -resize 200 screenshots/thumb_$$f; \
	done

help:
	@echo 'Makefile for creating a Web site using txt2tags                        '
	@echo '                                                                       '
	@echo 'Usage:                                                                 '
	@echo '   make                             (re)generate the web site          '
	@echo '   make html                        same as make                       '
	@echo '   make clean                       remove the generated files         '
	@echo '   make upload                      upload the web site via rsync+ssh  '
	@echo '                                                                       '

clean:
	find ./ -name "*.html"  -delete

upload: html thumbs
	rsync -e "ssh -p $(SSH_PORT)" \
		-avz \
		--exclude "*.t2t" \
		--exclude ".git" \
		--exclude ".gitignore" \
		--exclude "*.un~" \
		--exclude mirmon \
		--exclude mirmon.html \
		--exclude Makefile \
		--delete ./ $(SSH_USER)@$(SSH_HOST):$(SSH_TARGET_DIR)

.PHONY: html thumbs help clean upload
