# dotfiles

This is a clone from @holman [dotfiles](https://github.com/holman/dotfiles) + **oh-my-zsh** config + my customizations.

I renamed in this project every occurrence of the variable `ZSH` to `DOTFILES`, as pointed [here](https://github.com/holman/dotfiles/issues/70), to avoid conflicts between dotfiles and oh-my-zsh.

## install

```sh
git clone https://github.com/rafaeleyng/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
scripts/dotfiles-install.sh
```

## folders

- `generic`: each subfolder contains configuration for some generic component (like a default text editor or a default shell)
  - `bin/`: files are added to `$PATH` and made available everywhere, and are executed in a child process.
  - `editor`: configurations for my text editor, that is Atom
  - `functions/`: files are added to `$fpath` and made available everywhere, and are executed in the current process.
  - `shell`: configurations for my text editor, that is zsh
- `specific`: each subfolder contains configuration for some specific component (like the Go programming language)
- `scripts`: scripts that you can run manually, to either install this dotfiles project or install/update the dependencies it specifies

## special files

- `*/index.zsh`: get loaded into your environment.
- `*/*.symlink`: any files ending in `*.symlink` get symlinked without the `*.symlink` extension into your `$HOME`. So you can keep these files versioned in your dotfiles but still keep those autoloaded files in your home directory. They are symlinked when you run `scripts/dotfiles-install.sh`.

## useful stuff

Here are some of the most useful software included in this dotfiles:

- utilities:
  - [`asdf`](https://asdf-vm.com/): version manager for several technologies. Replaces `nvm`, `pyenv`, `rbenv` and others
  - [`z`](https://github.com/rupa/z)
- commands:
  - `e`: opens my favorite text editor
  - `todo <text>`: creates a file on desktop to remind a TODO
  - `update`: runs all `*/update.sh` files
- functions:
  - `c <tab>`, a function to go to my code folders (copied from @ryanb [dotfiles](https://github.com/ryanb/dotfiles/blob/master/oh-my-zsh/custom/plugins/rbates/rbates.plugin.zsh))
  - `extract <file>`: knows how to unzip several formats
- aliases:
  - `chrome [<filename>]`: to open Google Chrome
  - `pubkey`: copy `~/.ssh/id_rsa.pub` to clipboard
