# dotfiles

This is a clone from @holman [dotfiles](https://github.com/holman/dotfiles) + **oh-my-zsh** config + customizations.

I renamed in this project every occurrence of the variable `ZSH` to `ZSHDOT`, as pointed [here](https://github.com/holman/dotfiles/issues/70), to avoid conflicts between dotfiles and oh-my-zsh.

## install

```sh
git clone https://github.com/rafaeleyng/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
scripts/bootstrap
```

## components (same as in @holman's)

- `bin/`: Anything in `bin/` will get added to your `$PATH` and be made available everywhere.
- `<topic>/index.zsh`: Get loaded into your environment.
- `<topic>/\*.symlink`: Any files ending in `*.symlink` get symlinked without extension into your `$HOME`. This is so you can keep all of those versioned in your dotfiles but still keep those autoloaded files in your home directory. These get symlinked in when you run `scripts/bootstrap`.

## customizations

- [nvm](https://github.com/creationix/nvm) and node stable will be installed and used by default
- [z](https://github.com/rupa/z)
- `c <tab>`, a function to go to my code folders (copied from @ryanb [dotfiles](https://github.com/ryanb/dotfiles/blob/master/oh-my-zsh/custom/plugins/rbates/rbates.plugin.zsh))
- `chrome` to open it, or with filename to open the file in the browser
