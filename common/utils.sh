info () {
  printf "\r  [ \033[00;34m..\033[0m ] %s\n" "$1"
}

user () {
  printf "\r  [ \033[0;33m??\033[0m ] %s\n" "$1"
}

success () {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] %s\n" "$1"
}

fail () {
  printf "\r\033[2K  [\033[0;31mFAIL\033[0m] %s\n" "$1"
  echo ''
  exit
}

is_macos () {
  [ "$(uname -s)" = "Darwin" ]
  return
}

is_linux () {
  [ "$(uname -s)" = "Linux" ]
  return
}

os_specific_folder () {
  if is_macos; then
    echo "macos"
  elif is_linux; then
    echo "linux"
  else
    fail "os_specific_folder: unsupported OS"
  fi
}

os_time () {
  if is_macos; then
    echo $(($(gdate +%s%N) / 1000000))
  elif is_linux; then
    echo $(($(date +%s%N) / 1000000))
  else
    fail "os_time: unsupported OS"
  fi
}
