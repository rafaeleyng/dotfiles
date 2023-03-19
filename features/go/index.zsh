#!/bin/zsh

export GOROOT="$(asdf where golang)/go/"
alias go-reshim='asdf reshim golang && export GOROOT="$(asdf where golang)/go/"'
