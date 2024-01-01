#!/bin/bash
#
# runs all install.sh files

set -e

DOTFILES="$HOME/.dotfiles"
source "$DOTFILES"/features/utils.sh
export -f info # export to be used in the find/exec subshell
OS_SUFFIX=$(os_suffix)

setup_gitconfig () {
  if ! [ -f features/git/gitconfig-local.symlink ]; then
  info "Installing gitconfig files"

    user ' - What is your github author name?'
    read -r -e git_authorname
    user ' - What is your github author email?'
    read -r -e git_authoremail

    sed \
      -e "s/AUTHORNAME/$git_authorname/g" \
      -e "s/AUTHOREMAIL/$git_authoremail/g" \
      features/git/gitconfig-local.symlink.example > features/git/gitconfig-local.symlink

    success 'gitconfig'
  fi
}

link_file () {
  local SRC=$1 DST=$2

  local overwrite='' backup='' skip=''
  local action=

  if [ -f "$DST" ] || [ -d "$DST" ] || [ -L "$DST" ]; then
    if [ "$overwrite_all" = "false" ] && [ "$backup_all" = "false" ] && [ "$skip_all" = "false" ]; then
      local currentSrc
      currentSrc="$(readlink "$DST")"

      if [ "$currentSrc" = "$SRC" ]; then
        skip=true;
      else
        user "File already exists: $DST ($(basename "$SRC")), what do you want to do?\n\
        [s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all?"
        read -r -n 1 action

        case "$action" in
          o )
            overwrite=true;;
          O )
            overwrite_all=true;;
          b )
            backup=true;;
          B )
            backup_all=true;;
          s )
            skip=true;;
          S )
            skip_all=true;;
          * )
            ;;
        esac
      fi
    fi

    overwrite=${overwrite:-$overwrite_all}
    backup=${backup:-$backup_all}
    skip=${skip:-$skip_all}

    if [ "$overwrite" = "true" ]; then
      rm -rf "$DST"
      success "removed $DST"
    fi

    if [ "$backup" = "true" ]; then
      mv "$DST" "${DST}.backup"
      success "moved $DST to ${DST}.backup"
    fi

    if [ "$skip" = "true" ]; then
      success "skipped $SRC"
    fi
  fi

  # "false" or empty
  if [ "$skip" != "true" ]; then
    ln -f -s "$SRC" "$DST"
    success "linked $SRC to $DST"
  fi
}

link_files () {
  info 'linking dotfiles'

  local overwrite_all=false backup_all=false skip_all=false

  local FILES
  FILES=$(find \
    -H "$DOTFILES/features" "$DOTFILES/extensions" \
    -maxdepth 4 \
    -type f \
    \( -name "*.symlink" -o -name "*.symlink.$OS_SUFFIX" \) \
    -not -path '*.git*')

  for SRC in $FILES; do
    # either remove .symlink or OS suffix
    DST="$HOME/.$(basename "${SRC%.*}")"

    # remove .symlink in case the previous had to remove the OS suffix
    if [[ "$DST" = *.symlink ]]; then
      DST="$HOME/$(basename "${DST%.*}")"
    fi

    link_file "$SRC" "$DST"
  done
}

exec_installs () {
  find \
    -H "$DOTFILES/features" "$DOTFILES/extensions" \
    -maxdepth 4 \
    -type f \
    \( -name "install.sh" -o -name "install.sh.$OS_SUFFIX" \) \
    -not -path '*.git*' \
    -exec bash -c 'FILE="$0"; info "$FILE"; "$FILE"' {} ';'
}

setup_gitconfig
link_files
exec_installs

success 'install finished'
