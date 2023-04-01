if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
	exec sway
fi

if [[ "$ZPROF" = true ]]; then
	zmodload zsh/zprof
fi

# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _match _correct _approximate _prefix
zstyle ':completion:*' expand suffix
zstyle ':completion:*' ignore-parents parent pwd
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'r:|[._-/]=** r:|=**' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'l:|=* r:|=*'
zstyle ':completion:*' match-original both
zstyle ':completion:*' max-errors 2
zstyle ':completion:*' menu select=5
zstyle ':completion:*' preserve-prefix '//[^/]##/'
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' special-dirs true
zstyle ':completion:*' squeeze-slashes true
zstyle :compinstall filename '/home/moritz/.zshrc'

autoload -Uz compinit
autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X" edit-command-line
bindkey "^R" history-incremental-search-backward
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=5000
setopt autocd
unsetopt beep extendedglob nomatch notify
bindkey -v
# End of lines configured by zsh-newuser-install
setopt cdablevars
setopt correct
setopt globdots
setopt histignoredups
setopt histignorespace
setopt noclobber
setopt extendedglob

TRAPUSR1() { rehash }


typeset -g -A key

key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Delete]="${terminfo[kdch1]}"

# setup key accordingly
[[ -n "${key[Home]}"      ]] && bindkey -- "${key[Home]}"       beginning-of-line
[[ -n "${key[End]}"       ]] && bindkey -- "${key[End]}"        end-of-line
[[ -n "${key[Delete]}"    ]] && bindkey -- "${key[Delete]}"     delete-char

if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
	autoload -Uz add-zle-hook-widget
	function zle_application_mode_start { echoti smkx }
	function zle_application_mode_stop { echoti rmkx }
	add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
	add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi

# add notify-send support on SSH connections
if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
	notify-send() {
		printf "\x1b]777;notify;$1;$2\a"
	}
fi

#ZSH-PLUGIN zsh-users/zsh-syntax-highlighting
#ZSH-PLUGIN zpm-zsh/ssh
##ZSH-PLUGIN zsh-users/zsh-history-substring-search
#ZSH-PLUGIN qoomon/zsh-lazyload
#ZSH-PLUGIN reobin/typewritten
#ZSH-PLUGIN zsh-users/zsh-autosuggestions
#ZSH-PLUGIN MichaelAquilina/zsh-auto-notify
#ZSH-PLUGIN arzzen/calc.plugin.zsh
#ZSH-PLUGIN zpm-zsh/colorize
#ZSH-PLUGIN viko16/gitcd.plugin.zsh
#ZSH-PLUGIN jreese/zsh-titles
##ZSH-PLUGIN chitoku-k/fzf-zsh-completions
##ZSH-PLUGIN qoomon/zsh-lazyload


### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit's installer chunk

zinit load reobin/typewritten
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting
[ -z $SSH_CLIENT ] || zinit light zpm-zsh/ssh
zinit light MichaelAquilina/zsh-auto-notify
zinit light arzzen/calc.plugin.zsh
zinit light zpm-zsh/colorize
zinit light viko16/gitcd.plugin.zsh
zinit light jreese/zsh-titles


ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#888"

export AUTO_NOTIFY_THRESHOLD=30
export AUTO_NOTIFY_EXPIRE_TIME=300
export AUTO_NOTIFY_IGNORE=(
	"aerc"
	"delta"
	"docker"
	"git commit"
	"git rebase -i"
	"htop"
	"less"
	"man"
	"ncdu"
	"pulsemixer"
	"pulsemixer"
	"sleep"
	"ssh"
	"torsocks"
	"vifm"
	"vim"
	"wf-recorder"
	"zathura"
)

plugins=(auto-notify $plugins)

if [ -z $SSH_TTY ]; then
	TYPEWRITTEN_PROMPT_LAYOUT="singleline"
else
	TYPEWRITTEN_PROMPT_LAYOUT="singleline_verbose"
fi
TYPEWRITTEN_RELATIVE_PATH="adaptive"
TYPEWRITTEN_SYMBOL_GIT_STATUS_AHEAD="▴"
TYPEWRITTEN_SYMBOL_GIT_STATUS_BEHIND="▾"
TYPEWRITTEN_SYMBOL_GIT_STATUS_DIVERGED="𝈄"
TYPEWRITTEN_SYMBOL_GIT_STATUS_UNMERGED="𝈠"
TYPEWRITTEN_SYMBOL_GIT_STATUS_STASH="🗳"
TYPEWRITTEN_SYMBOL_ARROW="=>"

alias rm='rm -r'
alias mkdir='mkdir -p'
alias :q='exit'
alias gf='git fetch --tags'
alias gc='git status --porcelain | grep '^M' > /dev/null 2>&1 || git commit -a'
alias gch='git checkout'
alias gchb='git checkout -b'
alias push='git push --tags --follow-tags origin HEAD'
alias pull='git pull --commit --autostash'
alias ssh-restart='sudo sshd -t && (sudo systemctl reload sshd || sudo systemctl restart sshd)'
alias nginx-restart='sudo nginx -t && (sudo systemctl reload nginx || sudo systemctl restart nginx)'
alias start='sudo systemctl start'
alias stop='sudo systemctl stop'
alias enable='sudo systemctl enable'
alias enable-now='sudo systemctl enable --now'
alias disable='sudo systemctl disable'
alias disable-now='sudo systemctl disable --now'
alias reload='sudo systemctl reload'
alias restart='sudo systemctl restart'
alias status='sudo systemctl status'
alias dcu='docker-compose up -d --remove-orphans'
alias dcd='docker-compose down'
alias dcl='docker-compose logs'
alias dclf='docker-compose logs -f'
alias dcp='docker-compose pull'
alias R='sudo -i'
alias pprof='go tool pprof -http=:8080'
alias cover='go test -v -cover -trimpath -coverprofile /tmp/cover.prof && go tool cover -html /tmp/cover.prof -o /tmp/cover.html && xdg-open /tmp/cover.html'
alias todoist="todoist --color"
alias present="urxvt -fn 'xft:Operator Mono Lig:pixelsize=24'"
alias pmake='time nice make -j$(grep -c "^processor" /proc/cpuinfo) --load-average=$(grep -c "^processor" /proc/cpuinfo)'
alias mpv='mpv --ytdl-format=bestaudio'
alias gallery='feh --sort filename --version-sort "-|"'
alias wl-sudo="sudo env XDG_RUNTIME_DIR=$XDG_RUNTIME_DIR WAYLAND_SOCKET=$WAYLAND_SOCKET waylandapplication"
alias tb="nv termbin.com 9999"
alias vnwine="LANG=ja_JP.UTF-8 WINEPREFIX=$(pwd)/prefix WINEARCH=win64 wine"

function dcr() {
	if [ "$1" = "" ]; then
		docker-compose down && docker-compose up -d
	else
		docker-compose stop $1 && docker-compose start $1
	fi
}

function gchr() {
	if [ "$1" = "" ]; then
		echo "Please provide a ref"
		return 1
	fi
	git checkout -b "$1" "refs/remotes/origin/$1"
}

function shc() {
	if [ "$1" = "" ]; then
		echo "must give a repo"
		exit 1
	fi
	git clone git@git.sr.ht:~poldi1405/$1
}

function gpu-ffmpeg() {
	if [ "$#" -ne 2 ]; then
		echo "need 2 filenames: input & output"
		exit 1
	fi
	# init with
	# ffmpeg -init_hw_device vaapi=gpu:/dev/dri/renderD128

	ffmpeg -i "$1" -vaapi_device /dev/dri/renderD128 -vcodec hevc_vaapi -vf format='nv12|vaapi,hwupload' "$2"
}

fpath=(~/.zsh ~/.zsh/completion $fpath)

compdef '_files -g "/home/moritz/*"' 'p'

function a() {
	if [ "$1" = "" ]; then
		echo "must give a Project"
		return
	fi
	cd ~/Projects/Arbeit/$1
}

function p() {
	if [ "$1" = "" ]; then
		echo "must give a Project"
		return
	fi
	cd ~/Projects/$1
}

function mkcd() {
	mkdir "$1"
	cd "$1"
}

function sign_hash() {
	sha256sum $1 $2 $3 $4 $5 $6 $7 $8 $9 | gpg --sign-with "AE369480370CD2D09330E1E2DBE3B6782D9D6584" --clearsign --output signed_file_hashes.txt
}

function tag_release() {
	if [ "$1" = "" ]; then
		echo "Please provide a tag"
		return 1
	fi
	r=$RANDOM
	echo $1 | ~/.release_note_template > /tmp/$r
	vim /tmp/$r
	git tag -f -a v$1 -m "$(cat /tmp/$r)"
}

upload(){ if [ $# -eq 0 ];then echo "No arguments specified.\nUsage:\n transfer <file|directory>\n ... | transfer <file_name>">&2;return 1;fi;if tty -s;then file="$1";file_name=$(basename "$file");if [ ! -e "$file" ];then echo "$file: No such file or directory">&2;return 1;fi;if [ -d "$file" ];then file_name="$file_name.zip" ,;(cd "$file"&&zip -r -q - .)|curl --progress-bar --upload-file "-" "https://transfer.sh/$file_name"|tee /dev/null,;else cat "$file"|curl --progress-bar --upload-file "-" "https://transfer.sh/$file_name"|tee /dev/null;fi;else file_name=$1;curl --progress-bar --upload-file "-" "https://transfer.sh/$file_name"|tee /dev/null;fi;}


type exa  >/dev/null 2>&1 && alias ls='exa -l --git -s type' || alias ls='ls -ohGNp --color=always'
type mvg   >/dev/null 2>&1 && alias mv='mvg -g'
type cpg   >/dev/null 2>&1 && alias cp='cpg -gr' || alias cp='cp -r'
type slit  >/dev/null 2>&1 && alias less='slit'
type wget2 >/dev/null 2>&1 && alias wget='wget2 -c --progress=bar'
type nvim  >/dev/null 2>&1 && alias vim='nvim'
[ $TERM = xterm-kitty ] && alias ssh='kitty +kitten ssh'

type rclone >/dev/null 2>&1 && source <(rclone genautocomplete zsh /dev/stdout)
type hugo >/dev/null 2>&1 && source <(hugo completion zsh)

if [[ -f ~/.zshrc.host ]]; then
	source ~/.zshrc.host
fi

if [[ $(pgrep ssh-agent) && -S "$XDG_RUNTIME_DIR/ssh-agent.sock" ]]; then
	export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.sock"
	export SSH_AGENT_PID="$(pgrep ssh-agent | head -1)"
fi

if [[ "$ZPROF" = true ]]; then
	zprof
fi
