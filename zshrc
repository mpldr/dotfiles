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

# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
typeset -g -A key

key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Insert]="${terminfo[kich1]}"
key[Backspace]="${terminfo[kbs]}"
key[Delete]="${terminfo[kdch1]}"
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"
key[Left]="${terminfo[kcub1]}"
key[Right]="${terminfo[kcuf1]}"
key[PageUp]="${terminfo[kpp]}"
key[PageDown]="${terminfo[knp]}"
key[Shift-Tab]="${terminfo[kcbt]}"
key[Control-Left]="${terminfo[kLFT5]}"
key[Control-Right]="${terminfo[kRIT5]}"


# setup key accordingly
[[ -n "${key[Home]}"      ]] && bindkey -- "${key[Home]}"       beginning-of-line
[[ -n "${key[End]}"       ]] && bindkey -- "${key[End]}"        end-of-line
[[ -n "${key[Insert]}"    ]] && bindkey -- "${key[Insert]}"     overwrite-mode
[[ -n "${key[Backspace]}" ]] && bindkey -- "${key[Backspace]}"  backward-delete-char
[[ -n "${key[Delete]}"    ]] && bindkey -- "${key[Delete]}"     delete-char
[[ -n "${key[Up]}"        ]] && bindkey -- "${key[Up]}"         up-line-or-history
[[ -n "${key[Down]}"      ]] && bindkey -- "${key[Down]}"       down-line-or-history
[[ -n "${key[Left]}"      ]] && bindkey -- "${key[Left]}"       backward-char
[[ -n "${key[Right]}"     ]] && bindkey -- "${key[Right]}"      forward-char
[[ -n "${key[PageUp]}"    ]] && bindkey -- "${key[PageUp]}"     beginning-of-buffer-or-history
[[ -n "${key[PageDown]}"  ]] && bindkey -- "${key[PageDown]}"   end-of-buffer-or-history
[[ -n "${key[Shift-Tab]}" ]] && bindkey -- "${key[Shift-Tab]}"  reverse-menu-complete
[[ -n "${key[Control-Left]}"  ]] && bindkey -- "${key[Control-Left]}"  backward-word
[[ -n "${key[Control-Right]}" ]] && bindkey -- "${key[Control-Right]}" forward-word

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
	autoload -Uz add-zle-hook-widget
	function zle_application_mode_start { echoti smkx }
	function zle_application_mode_stop { echoti rmkx }
	add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
	add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi

# Make HOME and END work
#bindkey    "\e[3~"    delete-char
#bindkey    "\e[1;5C"  forward-word
#bindkey    "\e[1;5D"  backward-word
#bindkey    "\e[H"     beginning-of-line
#bindkey    "\e[F"     end-of-line

#ZSH-PLUGIN zsh-users/zsh-syntax-highlighting
#ZSH-PLUGIN zpm-zsh/ssh
#ZSH-PLUGIN zsh-users/zsh-history-substring-search
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

source <(antibody init)
# required external programs: grc
grep '^#ZSH-PLUGIN ' < ~/.zshrc | sed 's/^#ZSH-PLUGIN //' | antibody bundle

#lazyload plugins -- "source <(grep '^#ZSH-PLUGIN ' < ~/.zshrc | sed 's/^#ZSH-PLUGIN //' | antibody bundle)"

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#888"

AUTO_NOTIFY_IGNORE+=("docker" "vim" "sleep" "man" "delta" "less" "pulsemixer" 
                     "vifm" "ssh" "pulsemixer" "ncdu" "aerc" "wf-recorder")

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
alias push='git push --tags --follow-tags --signed=if-asked origin HEAD'
alias pull='git pull --commit --autostash'
alias ssh-restart='sudo sshd -t && (sudo systemctl reload nginx || sudo systemctl restart sshd)'
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
alias dcr='dcd && dcu'
alias dcl='docker-compose logs'
alias dclf='docker-compose logs -f'
alias R='sudo -i'
alias pprof='go tool pprof -http=:8080'
alias cover='go test -v -cover -coverprofile /tmp/cover.prof && go tool cover -html /tmp/cover.prof -o /tmp/cover.html && xdg-open /tmp/cover.html'
alias todoist="todoist --color"
alias present="urxvt -fn 'xft:Operator Mono Lig:pixelsize=24'"
alias pmake='time nice make -j$(grep -c "^processor" /proc/cpuinfo) --load-average=$(grep -c "^processor" /proc/cpuinfo)'

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

fpath=(~/.zsh $fpath)

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
	cp ~/.release_note_template /tmp/$r
	sed -i "s/VERSION/$1/" /tmp/$r
	vim /tmp/$r
	git tag -f -a v$1 -m "$(cat /tmp/$r)"
}

type exa  >/dev/null 2>&1 && alias ls='exa -l --git -s type' || alias ls='ls -ohGNp --color=always'
type rg   >/dev/null 2>&1 && alias grep='rg -C 2 --line-number -L' || alias grep='grep --color=auto -n -C 2 -r'
type fd   >/dev/null 2>&1 && alias find='fd' || alias fd='find'
type mvg  >/dev/null 2>&1 && alias mv='mvg -g'
type cpg  >/dev/null 2>&1 && alias cp='cpg -gr' || alias cp='cp -r'
type slit >/dev/null 2>&1 && alias less='slit'
[ $TERM = xterm-kitty ] && alias ssh='kitty +kitten ssh'

type rclone >/dev/null 2>&1 && source <(rclone genautocomplete zsh /dev/stdout)
