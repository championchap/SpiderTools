SpiderTools
===========

SpiderTools is a small command line program used with the [Spider Framework](https://github.com/championchap/Spider/) to help do common tasks for us, like creating new blank projects. 


## Usage

To make a new blank project called HelloWorld in this directory, just do this.

```
spider-tools -n "HelloWorld"
```

If you want Spider Tools to set up a vhost for you, just use -v.

Spider assumes that the path you want to use is the default public path for a new Spider Project, but local to the location you are in when you run the command. For this reason, it is best to use this command from inside your spider project folder.

If you want to change the path it points to, pass it in a second parameter. 

Currently, this is only being built to work with XAMPP on Linux & OS X. 

```
spider-tools -v "spider.dev" "set/public_path/"
```


## License

This is [free software](https://www.gnu.org/philosophy/free-sw.html) made available under the GPL V3 Licence.


## Who do I talk to?

* [Erik on Twitter](https://twitter.com/championchap)
* [ErikWatson.me](http://erikwatson.me)
