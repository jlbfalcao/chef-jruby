Description
===========

Installs JRuby into `/usr/local/lib/jruby`

Binaries are linked to `/usr/local/bin/jruby`

/usr/local/bin/ is added to $PATH

Requirements
============

Platform:

* Debian, Ubuntu (tested on 10.04, 12.04), CentOS (tested with 5.7)

The following Opscode cookbooks are dependencies:

* java
* install_from

Attributes
==========

* `['jruby']['version']`
* `['jruby']['checksum']`
* `['jruby']['install_path']`
* `['jruby']['gems']` 
* `['jruby']['nailgun']` # disabled by default.

Usage
=====

include_recipe "jruby"

jruby-1.7.18
====================

default[:jruby][:version] = "1.7.18"
default[:jruby][:checksum] = "87a4d5fbf10d88ef8de12f3ebececf9ffc1abaee"
