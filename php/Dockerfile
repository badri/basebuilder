# Copyright 2015 basebuilder authors. All rights reserved.
# Use of this source code is governed by a BSD-style
# license that can be found in the LICENSE file.

# this file describes how to build a tsuru drupal 7 image
# to run it:
# 1- run: $ tsuru-admin platform-add drupal -d https://raw.github.com/badri/basebuilder/master/php/Dockerfile

FROM    ubuntu:14.04
RUN	apt-get update
RUN	apt-get install wget -y --force-yes
RUN	apt-get install openssh-server -y
RUN	apt-get install supervisor -y
RUN	apt-get install mysql-client -y

RUN echo 'root:root' | chpasswd
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN mkdir -p /root/.ssh/ && touch /root/.ssh/authorized_keys
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

RUN echo -e '[program:sshd]\ncommand=/usr/sbin/sshd -D\n\n' >> /etc/supervisor/supervisord.conf
CMD exec supervisord -n
EXPOSE 22

RUN	mkdir /var/lib/tsuru
RUN	mkdir /shared
RUN     chmod a+w /shared
RUN	wget --no-check-certificate https://github.com/badri/basebuilder/tarball/master -O basebuilder.tar.gz
RUN	tar -xvf basebuilder.tar.gz -C /var/lib/tsuru --strip 1
RUN	rm basebuilder.tar.gz
RUN	cp /var/lib/tsuru/php/deploy /var/lib/tsuru
RUN	cp /var/lib/tsuru/php/start /var/lib/tsuru
RUN	/var/lib/tsuru/base/install
