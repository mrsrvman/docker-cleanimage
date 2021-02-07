# docker-cleanimage
### A tool for cleaning up temp and cache directories to make docker images smaller
Installation procedures can produce a lot of logs and other cached files. This script attemts to clean up these files to make docker images a lot smaller.

## Usage in Dockerfile

### Download and install
```Dockerfile
ENV CLEANIMAGE_VERSION 2.0
ENV CLEANIMAGE_URL https://raw.githubusercontent.com/LolHens/docker-cleanimage/$CLEANIMAGE_VERSION/cleanimage

ADD ["$CLEANIMAGE_URL", "/usr/local/bin/"]
RUN chmod +x "/usr/local/bin/cleanimage"
```
OR
```
RUN wget https://raw.githubusercontent.com/mrsrvman/docker-cleanimage/master/cleanimage -O /usr/local/bin//cleanimage \
    && chmod +x /usr/local/bin/cleanimage
```
OR
```
FROM debian:buster-slim AS cleaner
RUN apt-get update \
    && apt-get install --assume-yes --no-install-recommends --no-install-suggests  curl ca-certificates \
    && curl https://raw.githubusercontent.com/mrsrvman/docker-cleanimage/master/cleanimage -o /usr/local/bin//cleanimage \
    && chmod +x /usr/local/bin/cleanimage
.......
COPY --from=cleaner /usr/local/bin/cleanimage /usr/local/bin/cleanimage
```

### Execute after each layer where necessary
```Dockerfile
RUN apt-get install -y \
      python3 \
 && cleanimage
```

## Supported Applications
- apt
- yum
- apk
- pip

## Commands
- apt-get -y --purge autoremove
- apt-get -y clean
- yum clean all

## Directories
- /tmp/*
- /var/cache/apk/*
- /var/tmp/*
- /var/lib/apt/lists/*
- /var/log/alternatives.log
- /var/log/apt/
- /var/log/bootstrap.log
- /var/log/btmp
- /var/log/dpkg.log
- /var/log/faillog
- /var/log/fsck/
- /var/log/lastlog
- /var/log/wtmp
- ~/.cache/pip
- Files in /var/cache/
