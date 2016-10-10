#
# Makefile
# vagrant, 2016-07-24 12:42
#

VERSION=0.2
PY_VERSION=2.7.12
PY_MD5=57dffcee9cee8bb2ab5f82af1d8e9a69
NAME=mhristof/python-$(PY_VERSION)-trusty

default: build

tag:
	docker tag $(NAME) $(NAME):$(VERSION)
	docker tag $(NAME) $(NAME):latest
	#git tag $(VERSION)

push:
	#git push --tags
	docker push $(NAME):$(VERSION)
	docker push $(NAME):latest

build:
	docker build --build-arg python_version=$(PY_VERSION) --build-arg python_md5=$(PY_MD5) -t $(NAME) .

all:
	@echo "Makefile needs your attention"


# vim:ft=make
#
