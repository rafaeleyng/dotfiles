#!/bin/bash
# run this from time to time to update the packages list

# https://evanhahn.com/atom-apm-install-list/
apm list --installed --bare | grep '^[^@]\+' -o > atom_packages.txt
