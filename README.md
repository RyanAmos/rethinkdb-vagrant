# RethinkDB using Vagrant
Install [RethinkDB](http://rethinkdb.com) using [Vagrant](http://vagrantup.com).

## Quick Start -- One Liner
    git clone git://github.com/RyanAmos/rethinkdb-vagrant.git && \
        cd rethinkdb-vagrant && \
        ./rethinkdb.sh

## RethinkDB Dashboard
By default, you access the dashboard here:  
[http://localhost:8080/](http://localhost:8080/)

## Multiple servers
There are 3 VMs inside the Vagrantfile, so that you can play around with Replication and Sharding as well.
The machines can be reached by:

* localhost:8080-8082
* 10.10.10.10, 10.10.10.11, 10.10.10.12
