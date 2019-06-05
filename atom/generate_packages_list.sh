#!/bin/sh

# https://evanhahn.com/atom-apm-install-list/
apm list --installed --bare | grep '^[^@]\+' -o > atom_packages.txt
