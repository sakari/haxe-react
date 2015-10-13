# React haxe

Little something to do react uis using Haxe

- typesafe props and state
- instance variables proxy the react component state. So that the state variable is read using a getter and react `setState` is called on the instance variable setter.

## Installing

Using hmm

    hmm haxe-react https://github.com/sakari/haxe-react master

The package uses `require` to require react 0.14 modules so you will
need to provide those. The Makefile contains an example how to do
that.

## usage

Building requires node and haxe. Testing requires Python for running the SimpleHTTPServer.

    make
