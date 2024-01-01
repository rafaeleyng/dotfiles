# dotfiles

Extensible dotfiles for Linux and Mac.

## highlights

- [`zsh`](https://zsh.sourceforge.io/)
- [`oh-my-zsh`](https://ohmyz.sh/)
- [`powerlevel10k`](https://github.com/romkatv/powerlevel10k)
- [`asdf`](https://asdf-vm.com/)
- [`z`](https://github.com/rupa/z)
- `e`: opens the text editor configured in the `EDITOR` variable.
- `c <tab>`, go to my code folders.
- `update`: updates software (runs all `*/update.sh` files).
- `pubkey`: copy `~/.ssh/id_rsa.pub` to clipboard.

---

## installation

```sh
git clone https://github.com/rafaeleyng/dotfiles.git ~/.dotfiles && cd ~/.dotfiles

./install
```

---

## structure

### folders

Notable folders:

- `features`: each subfolder contains configuration for some feature. Notable examples:
  - `bin/`: files are added to `$PATH` and made available everywhere, and are executed in a child process.
  - `functions/`: files are added to `$fpath` and made available everywhere, and are executed in the current process.

### special files

- `*/install.sh`: files that are run when you run `./install`.
- `*/update.sh`: files that are run when you run `./update`.
- `*/*.symlink`: files that get symlinked (without the `*.symlink` extension) into your `$HOME` when you run `./install`.
- `*/path.zsh`: files that get loaded into your environment when a shell is loaded, before `*/index.zsh` are loaded. These files should only set path variables.
- `*/index.zsh`: files that get loaded into your environment when a shell is loaded.

Combined with the patterns above, files with the added suffix `.macos` or `.linux` will only be applied to when running on that OS.

### extensions

This project supports extensions, so you can isolate specifics to a separate repo. For instance, using different extensions in different machines.

Using extensions:

```sh
# within the dotfiles
cd extensions

# add as many extensions projects you want
git clone https://github.com/<username>/<dotfiles-extension-personal>.git
git clone https://github.com/<username>/<dotfiles-extension-work>.git

# go back to dotfiles
cd ..

# run this script to:
#   - install any dependencies (`install.sh` files) defined in the extensions;
#   - link `*.symlink` files from the extensions to the home directory.
./install
```

Inside the extensions you can have any of the [special files](#special-files), and they will be processed accordingly.

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
