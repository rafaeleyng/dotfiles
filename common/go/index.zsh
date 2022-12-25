#!/bin/zsh

export GOPATH=$PROJECTS/go
export GOBIN=$GOPATH/bin
export PATH="$GOBIN:$PATH"

export GOROOT="$(asdf where golang)/go/"
alias go-reshim='asdf reshim golang && export GOROOT="$(asdf where golang)/go/"'
