# grc overides for ls
#   Made possible through contributions from generous benefactors like
#   `brew install coreutils`
if $(gls &>/dev/null)
then
  alias ls="grc ls -F"
  alias l="grc ls -lAh"
  alias ll="grc ls -l"
  alias la='grc ls -A'
fi
