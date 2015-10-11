
all: haxe js

haxe: setup
	haxe -js build/main-javascript.js -main Main -cp src -D js-flatten -dce std -debug -D source-map-content

js: install
	node_modules/.bin/browserify --outfile build/requires.js requires.js --standalone require

install: setup
	npm install

setup: clean
	mkdir build

clean:
	-rm -rf build
