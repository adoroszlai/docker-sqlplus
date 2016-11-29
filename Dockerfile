FROM debian:jessie-slim
MAINTAINER sflyr

ENV USER oracle
ENV HOME /home/$USER

RUN apt-get -y update && apt-get -y install libaio1 rlwrap unzip && rm -rf /var/lib/apt/lists/*

RUN groupadd -r $USER && useradd -r -g $USER $USER && mkdir -p $HOME
WORKDIR $HOME

COPY instantclient*.zip ./
RUN echo instantclient*zip | xargs -n1 unzip
ENV PATH $PATH:$HOME/instantclient_11_2
ENV LD_LIBRARY_PATH $HOME/instantclient_11_2

RUN mkdir -p $HOME/bin
COPY entrypoint.sh bin/
RUN chmod +x bin/entrypoint.sh
ENV PATH $PATH:$HOME/bin

RUN chown -R $USER:$USER .
USER $USER

ENTRYPOINT [ "entrypoint.sh" ]
