SSH_HOST=salixos.org
SSH_PORT=22
SSH_USER=web
SSH_TARGET_DIR=/srv/www/www.salixos.org

build:
	rm -rf public
	mkdir public
	git worktree prune
	rm -rf .git/worktrees/public/
	git worktree add -B public public origin/public
	rm -rf public/*
	hugo --minify
	@if grep -rl "<script" public --include='*.html' >/dev/null; then \
		echo "ERROR: <script> found in generated pages"; exit 1; fi

serve:
	hugo server --disableFastRender

html:
	hugo --minify
	@if grep -rl "<script" public --include='*.html' >/dev/null; then \
		echo "ERROR: <script> found in generated pages"; exit 1; fi

clean:
	rm -rf public resources

help:
	@echo 'Makefile for the Salix website (built with Hugo, extended edition)'
	@echo ''
	@echo 'Usage:'
	@echo '   make serve     local preview with live reload (dev server only)'
	@echo '   make html      build the site into public/'
	@echo '   make upload    build into public/ and upload it via rsync+ssh'
	@echo '   make build     build the site into the public/ git worktree'
	@echo '   make publish   build, then commit and push the public branch'
	@echo '   make clean     remove generated files'

upload: build
	rsync -e "ssh -p $(SSH_PORT)" \
		-avz \
		--exclude ".git" \
		--exclude mirmon \
		--exclude mirmon.html \
		--delete public/ $(SSH_USER)@$(SSH_HOST):$(SSH_TARGET_DIR)

publish: build
	cd public && \
	git add --all && \
	git commit -m "Publish on `LANG=C.utf8 date`" && \
	git push -u origin public

.PHONY: build serve html clean help upload publish
