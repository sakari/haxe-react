# React haxe

Little something to maybe do react uis using Haxe

- typesafe props and state
- instance variables proxy the react component state. So that the state variable is read using a getter and react `setState` is called on the instance variable setter.

## usage

Building requires node and haxe. Testing requires Python for running the SimpleHTTPServer.

    make
