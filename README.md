InterMapper
===========

Project: [https://github.com/vpalacio/docker-intermapper]
(https://github.com/vpalacio/docker-intermapper)


About
-----

This git repo puts [InterMapper](http://www.helpsystems.com/intermapper)
in a Docker container with Centos userspace.


How-to
------

### Build

    docker build --rm -t intermapper .


### Run

:warning: You *must* run the container with `--net host` or else
InterMapper segfaults. Port 8181 must be available on the host.

    docker run -d \
    --name intermapper \
    --net host \
    intermapper

It can take up to 60 seconds for InterMapper to be fully-up.
Use `docker logs -f intermapper` to view the startup messages.
