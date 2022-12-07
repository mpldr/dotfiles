export DBUS_SESSION_BUS_ADDRESS
export DBUS_SESSION_BUS_PID

# XDG settings
export XDG_RUNTIME_DIR=/run/user/1000

# misc settings
export LC_MESSAGES=C
export GPG_TTY=$(tty)
export MAKEFLAGS="-j 16"
export DOCKER_BUILDKIT=1

# general settings
export GOPROXY=direct
export GOSUMDB=off
export PATH=$PATH:~/go/bin
export PATH=$PATH:~/.npm-packages/bin
export PATH=$PATH:~/.npm-packages/bin
export PATH=$PATH:~/.bin

export LESS_TERMCAP_md=$'\e[01;31m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_us=$'\e[01;32m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_so=$'\e[45;93m'
export LESS_TERMCAP_se=$'\e[0m'

test -f ~/.zshenv.host && source ~/.zshenv.host
