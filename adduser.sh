#!/bin/bash
uid=$(stat -c %u ${PWD})
gid=$(stat -c %g ${PWD})

groupadd -o -g $gid protractor
useradd -m -o -u $uid -g $gid protractor

sudo -u protractor protractor -a protractor $@