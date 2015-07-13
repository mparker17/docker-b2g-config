FROM ubuntu:14.04

RUN apt-get -y -qq update
RUN apt-get -y install python git
RUN git config --global user.name "Test Person"
RUN git config --global user.email "example@example.com"
