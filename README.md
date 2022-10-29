# dotfiles

My home is my castle, and these are the carpets. These are my dotfiles (at least
those I didn't forget to add).

## Apply

Since you probably do not want to use all of my configs, you should just copy
what looks useful to you.

### applying all dotfiles anyway

first, you need [rcm](https://github.com/thoughtbot/rcm)

then you can run (untested)
```sh
git clone https://git.sr.ht/~poldi1405/dotfiles ~/.dotfiles
rcup -B $(cat /etc/hostname)
``` 

## Dependencies/Requirements

dependencies are listed with their Archlinux Package-Name

### vim

- `ctags` – creating autocompletions
- `curl` – auto-installing vim-plug
- `git` – downloading plugins
- `go` – installing vim-go
- `python` `python-watchdog` `python-request`s `python-requests-futures` `python-bottle` `clang` – YouCompleteMe compilation
- `yarn` – vim-prettier plugin

### zsh

- `antibody` – Package Manager

optional:

- `advcp` – cp/mv with progressbar
- `exa` – a modern ls replacement
- `fd` – a faster find
- `ripgrep` – a faster grep
- `slit` - less with filtering
