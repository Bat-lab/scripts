#!/bin/bash
pid=$(ps -ef | grep -i firefox | grep -v 'grep' | sed -n 1p |awk '{print $2}')

if [[ -n "$pid" ]]
then
echo "killing firefox"

else
echo "firefox not running"

fi
