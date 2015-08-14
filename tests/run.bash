#!/bin/bash -el

# Copyright 2015 basebuilder authors. All rights reserved.
# Use of this source code is governed by a BSD-style
# license that can be found in the LICENSE file.

if [ -f /vagrant/.env ]
then
	source /vagrant/.env
fi

sudo -E -u $SUDO_USER /vagrant/platforms.bash "$1"
