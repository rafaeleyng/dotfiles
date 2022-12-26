#!/bin/bash
#
# links all *.symlink files (except for git)

DOTFILES="$HOME/.dotfiles"
source "$DOTFILES"/features/utils.sh

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

  OS_SUFFIX=$(os_suffix)

  local FILES=$(find \
    -H "$DOTFILES/features" "$DOTFILES/extensions" \
    -type f \
    -maxdepth 4 \
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

link_files

success 'setup-symlinks.sh finished'
