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


### Tag

It is useful to provide an informative tag similar to
`5.8.2-1-20150627T1306-git-56f20fd`.
The tag indicates:

* version-release of InterMapper rpm in the image
* date/time when the image is built
* git hash of this repo at the time of build

Run these commands to tag the image:

    version=$(docker run --rm intermapper rpm -q --qf='%{version}-%{release}' InterMapper)
    now=$(date +%Y%m%dT%H%M)
    hash=$(git rev-parse HEAD | cut -b1-7)
    tag="${version}-${now}-git-${hash}"
    docker tag intermapper intermapper:${tag}
