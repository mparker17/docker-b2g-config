FROM ubuntu:14.04

RUN apt-get -y -qq update
RUN apt-get -y install python git

RUN useradd -m build
RUN echo "[user]\nname = Test Person\nemail = example@example.com" > /home/build/.gitconfig

RUN chown -R build:build /home
USER build
ENV SHELL /bin/bash
ENV HOME /home/build
VOLUME ["/B2G"]
WORKDIR /B2G
