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

test -f ~/.zshenv.host && source ~/.zshenv.host
