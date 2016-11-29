FROM sflyr/ubuntu
MAINTAINER sflyr

RUN apt-get -y update
RUN apt-get -y install libaio1 unzip rlwrap
ADD instantclient*.zip /
RUN echo instantclient*zip | xargs -n1 unzip

ENV LD_LIBRARY_PATH instantclient_11_2

CMD sleep 1; rlwrap /instantclient_11_2/sqlplus $URL
