---
title: Glog Documentation
date: 2010-05-10
---


## Quickstart


    git clone git://github.com/antono/glog-quickstart.git
    cd glog-quickstart
    gem install bundler
    bundle install
    unicorn

Open http://localhost:8080/ in your favorite [Chromium](http://www.chromium.org/).

## Pages and Templates

There is 2 main directories used by glog:

- pages
- templates

All files from `pages` will be served to client.
Internally every page is instance of [JADOF::Page](http://github.com/remi/jadof)
and can be in txt, markdown or haml format. You can [add your own formatters](http://github.com/remi/jadof).
For templating used only [HAML](http://haml-lang.com/) format.

## Serving details

On `GET /welcome` glog will search for page named welcome.{txt,markdown,haml} in directory `pages`.
When page found glog tries to resolve apropriate template using following priorities:

* template defined in page metadata
* templage exactly match path of the page
* templates/default.haml

Inside every tempate you have access to 3 default objects:

* pages
* page
* env

More examples in [source](http://github.com/antono/glog-quickstart).
