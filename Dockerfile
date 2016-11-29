FROM debian:jessie-slim
MAINTAINER sflyr

RUN apt-get -y update && apt-get -y install libaio1 rlwrap unzip && rm -rf /var/lib/apt/lists/*
ADD instantclient*.zip /
RUN echo instantclient*zip | xargs -n1 unzip

ENV LD_LIBRARY_PATH instantclient_11_2

CMD sleep 1; rlwrap /instantclient_11_2/sqlplus $URL
