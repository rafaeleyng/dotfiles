# dotfiles

This project is heavily inspired by @holman [dotfiles](https://github.com/holman/dotfiles). I've added [`oh-my-zsh`](https://ohmyz.sh/), changed the whole structure, and simplified a lot the version management for programming languages by using [`asdf`](https://asdf-vm.com/).

## install

```sh
git clone https://github.com/rafaeleyng/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
scripts/dotfiles-install.sh
```

## folders

The most notable folders are:

- `scripts`: scripts that you can run manually, to either install this dotfiles project or install/update the dependencies it specifies
- `features`: each subfolder contains configuration for some feature. Notable examples:
  - `bin/`: files are added to `$PATH` and made available everywhere, and are executed in a child process.
  - `editor`: configurations for my text editor
  - `functions/`: files are added to `$fpath` and made available everywhere, and are executed in the current process.
  - `oh-my-zsh/`: my configuration for [oh-my-zsh](https://ohmyz.sh/)
  - `shell/`: configurations for my shell ([zsh](http://zsh.sourceforge.net/))

## special files

- `*/index.zsh`: files called `index.zsh` get loaded into your environment when a shell is loaded
- `*/*.symlink`: files ending in `*.symlink` get symlinked (without the `*.symlink` extension) into your `$HOME` when you run `scripts/dotfiles-install.sh`

## extensions

I can have this base dotfiles project and isolate specifics, like:
- I want my work computer to have some specific files
- I want my personal computer to have other specific files

Create a separate repository with your extensions files, and clone it into an `extensions` folder (already git-ignored), like:

```sh
# create the extensions dir
mkdir extensions && cd extensions

# add as many extensions projects you want
git clone https://github.com/<username>/<dotfiles-extension-personal>.git
git clone https://github.com/<username>/<dotfiles-extension-work>.git

# install the extensions
scripts/dotfiles-install.sh     # install any dependencies (`install.sh` files) defined in the extensions and links `*.symlink` files from the extensions to the home directory
```

The currently supported extension files you can have inside your extensions project are:

- `git/gitconfig.extension.symlink`: extends `features/git/gitconfig.symlink` and gets symlinked into your `$HOME`
- `*/index.zsh`: files called `index.zsh` get loaded into your environment when a shell is loaded (note: they should be inside some directory, like `shell/index.zsh`)

## highlights

Here are some of the most useful software included in this dotfiles:

- utilities:
  - [`asdf`](https://asdf-vm.com/): version manager for several technologies. Replaces tools like `nvm`, `pyenv`, `rbenv` and others
  - [`z`](https://github.com/rupa/z)
- commands:
  - `e`: opens my favorite text editor
  - `todo <text>`: creates a file on desktop to remind a to-do
  - `update`: runs all `*/update.sh` files
- functions:
  - `c <tab>`, a function to go to my code folders (copied from @ryanb [dotfiles](https://github.com/ryanb/dotfiles/blob/master/oh-my-zsh/custom/plugins/rbates/rbates.plugin.zsh))
  - `extract <file>`: knows how to unzip several formats
- aliases:
  - `chrome [<filename>]`: to open Google Chrome
  - `pubkey`: copy `~/.ssh/id_rsa.pub` to clipboard

## shellcheck

To run `shellcheck` against the project files, either:
- install `shellcheck` on your system and run `./shellcheck.sh`
- or have `docker-compose` and run `docker-compose up`

## references

- https://github.com/holman/dotfiles
- https://github.com/holman/dotfiles/issues/70: I renamed in this project every occurrence of the variable `ZSH` to `DOTFILES`, to avoid conflicts between dotfiles and oh-my-zsh.
- https://unix.stackexchange.com/questions/151889/why-does-bashs-source-command-behave-differently-when-called-from-a-function: I've used this question to source my files, but if you can understand what is happening (look at all my questions in the comments of the answers) please explain to me.
