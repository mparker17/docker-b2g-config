FROM ubuntu:14.04
MAINTAINER M Parker <mparker17@536298.no-reply.drupal.org>

# Install dependencies.
# Note that the config script requires python 2.x: python 3.x will not work.
# Conveniently, ubuntu 14.04 installs python 2.7.x by default, so this works.
RUN apt-get -y update && \
    apt-get -y install python git

# Add a user to build with, and set it's Git credentials.
RUN useradd -m build
RUN echo "[user]\nname = Test Person\nemail = example@example.com" > /home/build/.gitconfig

# From simonjohansson/B2G-build: when doing the initial
# `./config.sh $target_platform`, a file, `.config`, will be created in the B2G
# root, with the line `GECKO_OBJDIR=/home/user/path/to/B2G/objdir-gecko`. This
# will result in a failure while building, because we're running as a normal
# user, not root.
#
# To solve this, we simply give the build user ownership of `/home`.
RUN chown -R build:build /home

USER build
ENV SHELL /bin/bash
ENV HOME /home/build

VOLUME ["/B2G"]
WORKDIR /B2G
