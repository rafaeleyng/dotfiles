export GOPATH=$PROJECTS/go
export GOBIN=$GOPATH/bin
export PATH="$GOBIN:$PATH"

alias go-reshim='asdf reshim golang && export GOROOT="$(asdf where golang)/go/"'
