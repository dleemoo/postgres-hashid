FROM postgres:10.5

MAINTAINER Leonardo Lobo Lima <dleemoo@gmail.com>

ADD https://github.com/iCyberon/pg_hashids/archive/master.tar.gz /tmp/pg_hashids.tar.gz

RUN set -ex \
  && apt-get update \
  && apt-get install -y make gcc postgresql-server-dev-10 \
  && cd /tmp \
  && tar xf pg_hashids.tar.gz \
  && cd /tmp/pg_hashids-master \
  && make \
  && make install \
  && rm -rf /tmp/pg_hashids* \
  && apt-get purge -y make gcc postgresql-server-dev-10 \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*
