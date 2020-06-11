#!/bin/sh
echo running arduino-cli
echo config file ${homedir}/app/arduino-cli.yaml
./arduino-cli daemon --config-file ${homedir}/app/arduino-cli.yaml --daemonize

tail -f >>/dev/null
