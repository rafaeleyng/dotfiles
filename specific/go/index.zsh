export GOPATH=$PROJECTS/go
export GOBIN=$GOPATH/bin
export PATH="$GOBIN:$PATH"

GO_VERSION=$(go version | grep -o -E '([0-9])(\.*[0-9])+' | head -1)
export GOROOT="/Users/rafael.eyng/.asdf/installs/golang/$GO_VERSION/go"
