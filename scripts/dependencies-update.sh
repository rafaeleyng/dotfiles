#!/bin/sh
#
# run all dotfiles updaters

cd "$(dirname $0)"/..
find . -name update.sh | while read FILE ; do sh -c "${FILE}" ; done
