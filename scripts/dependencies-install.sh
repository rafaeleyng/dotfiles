#!/bin/sh
#
# run all dotfiles installers

cd "$(dirname $0)"/..
find . -name install.sh | while read FILE ; do sh -c "${FILE}" ; done
