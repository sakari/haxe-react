
all: haxe js
	python -m SimpleHTTPServer

haxe: setup
	haxe compile.hxml

js: install
	node_modules/.bin/browserify --outfile build/requires.js requires.js --standalone require

install: setup
	npm install

setup: clean
	mkdir build

clean:
	-rm -rf build
