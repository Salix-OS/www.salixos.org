#!/usr/bin/env python
# -*- coding: utf-8 -*- #

AUTHOR = 'Salix team'
SITENAME = 'Salix OS'
SITEURL = 'http://www.salixos.org'

TIMEZONE = 'Europe/Berlin'

DEFAULT_LANG = 'en'

# change the pelican settings for our site
ARTICLE_DIR = 'blog'
ARTICLE_URL = 'blog/{slug}.html'
ARTICLE_SAVE_AS = 'blog/{slug}.html'
ARTICLE_EXCLUDES = ('',)
PAGE_DIR = ''
PAGE_URL = '{slug}.html'
PAGE_SAVE_AS = '{slug}.html'
PAGE_EXCLUDES = ('blog',)
CATEGORY_SAVE_AS = 'blog/category/{slug}.html'
CATEGORY_URL = 'blog/category/{slug}.html'
TAG_SAVE_AS = 'blog/tag/{slug}.html'
TAG_URL = 'blog/tag/{slug}.html'
YEAR_ARCHIVE_SAVE_AS = 'archives.html'
STATIC_PATHS = ['images', 'chat', ]

# Specify name of a theme installed via the pelican-themes tool
# THEME = "simple"
# Specify a customized theme, via path relative to the settings file
THEME = "./korgi-salix"

# Menu
MENUITEMS =  (('Download', 'http://docs.salixos.org/wiki/Download'),
          ('Wiki', 'http://docs.salixos.org/wiki/Main_Page'),
          ('Forum', 'http://forum.salixos.org'),)

# Blogroll
LINKS =  (
          ('Screenshots', 'http://picasaweb.google.com/salix.artwork'),
          ('Websearch', 'http://start.salixos.org'),
		  ('Transifex', 'https://www.transifex.com/projects/p/salix/'),
          ('Mailing lists', 'http://docs.salixos.org/wiki/Mailing_lists'),
          ('Jabber chat room', '/static/chat/jappix.html'),
          ('IRC chat room', 'http://webchat.freenode.net/?randomnick=1&channels=salix&prompt=1'),)

# Social widget
SOCIAL = (('Salix on Google+', 'https://plus.google.com/114548283017378669706/posts'),
          ('Salix at Twitter', 'https://twitter.com/salix_os'),
          ('Salix at Github', 'https://github.com/Salix-OS'),)

DEFAULT_PAGINATION = 10
