export DBUS_SESSION_BUS_ADDRESS
export DBUS_SESSION_BUS_PID

# general wayland stuff
export ECORE_EVAS_ENGINE=wayland_egl
export ELM_ACCEL=opengl
export ELM_DISPLAY=wl
export ELM_ENGINE=wayland_egl
export MOZ_ENABLE_WAYLAND=1
export QT_QPA_PLATFORM=wayland-egl
export SDL_VIDEODRIVER=wayland
export _JAVA_AWT_WM_NONREPARENTING=1

# XDG settings
export XDG_RUNTIME_DIR=/run/user/1000
export XDG_SESSION_TYPE=wayland
export XDG_CURRENT_DESKTOP=sway

# misc settings
export LC_MESSAGES=C
export GPG_TTY=$(tty)
export MAKEFLAGS="-j 16"
export DOCKER_BUILDKIT=1

# general settings
export EDITOR=nvim VISUAL=nvim
export GOPROXY=direct
export GOSUMDB=off
export PATH=$PATH:~/go/bin
export PATH=$PATH:~/.npm-packages/bin
export PATH=$PATH:~/.npm-packages/bin
export PATH=$PATH:~/.bin
