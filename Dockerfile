FROM ubuntu:14.04
MAINTAINER M Parker <mparker17@536298.no-reply.drupal.org>

# Install dependencies.
RUN apt-get -y update && \
    apt-get -y install python git

# Add a user to build with, and set it's Git credentials.
RUN useradd -m build
RUN echo "[user]\nname = Test Person\nemail = example@example.com" > /home/build/.gitconfig

# From simonjohansson/B2G-build: when doing the initial ./config target-platform
# a file, ".config", will be created in the B2G root containing this line
# "GECKO_OBJDIR=/home/user/path/to/B2G/objdir-gecko"
#
# So when building at one stage, GECKO_OBJDIR is going to be created which will
# fail since we are running as a normal user, not root.
#
# To solve, we simply give ownership to /home to build user.
RUN chown -R build:build /home

USER build
ENV SHELL /bin/bash
ENV HOME /home/build
VOLUME ["/B2G"]
WORKDIR /B2G
