#!/bin/bash

#pn is var

read -p 'PACKAGE NAME:' pn

a=$(whereis $pn | awk '{print $3}')

du -sh $a
