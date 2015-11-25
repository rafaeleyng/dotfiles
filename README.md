# dotfiles

This is a clone from @holman [dotfiles](https://github.com/holman/dotfiles) + **oh-my-zsh** config + customizations.

I renamed in this project every occurrence of the variable `ZSH` to `ZSHDOT`, as pointed [here](https://github.com/holman/dotfiles/issues/70), to avoid conflicts between dotfiles and oh-my-zsh.

## install

```sh
git clone https://github.com/rafaeleyng/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
script/bootstrap
```

## important files

- **zsh/zshrc.symlink**: contains some important paths
- **zsh/oh-my-zsh.zsh**: oh-my-zsh config
- **bin/dot**: a simple script that installs some dependencies and sets OS X defaults. Run `dot` from time to time to keep your environment fresh and up-to-date.


## components (same as in @holman's)

- **bin/**: Anything in `bin/` will get added to your `$PATH` and be made available everywhere.
- **topic/path.zsh**: Any file named `path.zsh` is loaded first and is expected to setup `$PATH` or similar.
- **topic/\*.zsh**: Any files ending in `.zsh` get loaded into your environment.
- **topic/completion.zsh**: Any file named `completion.zsh` is loaded last and is expected to setup autocomplete.
- **topic/\*.symlink**: Any files ending in `*.symlink` get symlinked without extension into your `$HOME`. This is so you can keep all of those versioned in your dotfiles but still keep those autoloaded files in your home directory. These get symlinked in when you run `script/bootstrap`.

## customizations

- [nvm](https://github.com/creationix/nvm) and node stable will be installed and used by default
- [thefuck](https://github.com/nvbn/thefuck)
- [z](https://github.com/rupa/z)
- `h <tab>`, similar to `c <tab>`, a function to go to folders inside my `~` folder (copied from @ryanb [dotfiles](https://github.com/ryanb/dotfiles/blob/master/oh-my-zsh/custom/plugins/rbates/rbates.plugin.zsh))
- `zsh/prompt.zsh` overrides `prompt_dir` (from `themes/agnoster.zsh-theme` inside oh-my-zsh) function to display only the last part of current working directory
