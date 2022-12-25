# dotfiles

My dotfiles for Mac (and soon for Linux).

## highlights

- [`zsh`](https://zsh.sourceforge.io/)
- [`oh-my-zsh`](https://ohmyz.sh/)
- [`powerlevel10k`](https://github.com/romkatv/powerlevel10k)
- [`asdf`](https://asdf-vm.com/)
- [`z`](https://github.com/rupa/z)
- `e`: opens the text editor configured in the `EDITOR` variable.
- `update`: updates software (runs all `*/update.sh` files).
- `pubkey`: copy `~/.ssh/id_rsa.pub` to clipboard.
- `c <tab>`, go to my code folders.
- `extract <file>`: knows how to unzip several formats.

---

## installation

```sh
git clone https://github.com/rafaeleyng/dotfiles.git ~/.dotfiles && cd ~/.dotfiles

./scripts/setup.sh
```

---

## structure

### folders

Notable folders:

- `common`: each subfolder contains configuration for some feature. Notable examples:
  - `bin/`: files are added to `$PATH` and made available everywhere, and are executed in a child process.
  - `functions/`: files are added to `$fpath` and made available everywhere, and are executed in the current process.
- `macos`: contains macOS-specific files;
- `ubuntu`: contains Ubuntu-specific files;
- `scripts`: scripts that you can run manually, to either install this dotfiles project or install/update the dependencies it specifies.

### special files

- `*/index.zsh`: files that get loaded into your environment when a shell is loaded.
- `*/*.symlink`: files that get symlinked (without the `*.symlink` extension) into your `$HOME` when you run `./scripts/setup.sh`.
- `*/install.sh`: files that are run when you run `./scripts/install.sh` (and also `./scripts/setup.sh`).
- `*/update.sh`: files that are run when you run `./scripts/update.sh`.

### extensions

This project supports extensions, so you can isolate specifics to a separate repo. For instance, using different extensions in different machines.

Using extensions:

```sh
# within the dotfiles, go to extensions folder
cd extensions

# add as many extensions projects you want
git clone https://github.com/<username>/<dotfiles-extension-personal>.git
git clone https://github.com/<username>/<dotfiles-extension-work>.git

# go back to dotfiles
cd ..

# run this script to:
#   - install any dependencies (`install.sh` files) defined in the extensions;
#   - link `*.symlink` files from the extensions to the home directory.
scripts/setup.sh
```

Currently supported features inside extensions:
- `git/gitconfig.extension.symlink`: extends `common/git/gitconfig.symlink` and gets symlinked into your `$HOME`;
- `<some-dir>/index.zsh`: files called `index.zsh` get loaded into your environment when a shell is loaded.

---

## [shellcheck](https://www.shellcheck.net/)

```sh
docker-compose up
```

---

## references

- https://github.com/holman/dotfiles: inspiration.
- https://github.com/holman/dotfiles/issues/70: I renamed of the variable `ZSH` to `DOTFILES`, to avoid conflicts between dotfiles and oh-my-zsh.
- https://github.com/ryanb/dotfiles/blob/master/oh-my-zsh/custom/plugins/rbates/rbates.plugin.zsh: `c` function.
