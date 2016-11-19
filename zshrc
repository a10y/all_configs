## Basics
setopt auto_cd
setopt promptsubst

# Tab completion
autoload -Uz compinit
compinit

# Use Emacs keybindings for line editing
bindkey -e

# Source git-prompt script to allow showing git info
source $HOME/.bin/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1

function prompt() {
  local user=$(whoami)
  #local prompts=(∇ ∆ ∫ ⇰)
  local prompts=(∆)
  echo -n "%B%F{%(#.red.yellow)}%n%f:%U%F{cyan}%~%u%f $prompts[RANDOM%$#prompts+1] "
}

function rprompt() {
  echo -n "%(?.%B%F{green}✓✓%f%b.%?)$(__git_ps1)"
}
# Prompt settings
# Single-quoting delays substitution to happen dynamically on each "ENTER"
export PROMPT='$(prompt)'
export RPROMPT='$(rprompt)'

# You may need to manually set your language environment
# export LANG=en_US.UTF-8
export EDITOR='nvim'

## ALIASES
# Aliases for nagivation
alias ls="ls -G" # Color
alias ll="ls -Gahl"
alias l="ls -Ga"
alias grep="grep --color"

# Aliases for Git
alias g="git"
alias ga="git add"
alias gc="git commit"
alias gs="git status"
alias gd="git diff"
alias gh="git help"
alias gl="git log"

# Gradle
alias gw="./gradlew"

# Neovim all the way!
alias vim="nvim"

# Docker
alias d="docker"
alias dc="docker-compose"

# Aliases for applications
alias vlc='/Applications/VLC.app/Contents/MacOS/VLC -I rc'

export GOPATH=$HOME/gopkgs
export LANG="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# Setup CDPATH
export CDPATH=.:$HOME/git:$HOME/stanford

# Rust source for racer
export RUST_SRC_PATH="$HOME/git/rust/src"

# Order:
# 1. my ~/.bin
# 2. Homebrew overrides
# 3. Everything else
# ... except for whatever I have in ~/.bin

export PATH=$HOME/.bin:/usr/local/bin:$HOME/miniconda2/bin:$HOME/.cargo/bin:$HOME/.local/bin:/Library/Developer/Toolchains/swift-latest.xctoolchain/usr/bin:${GOPATH//://bin:}/bin:$PATH

# Fix locations for OpenSSL installed via brew
export OPENSSL_INCLUDE_DIR="/usr/local/opt/openssl/include"
export OPENSSL_LIB_DIR="/usr/local/opt/openssl/lib"


# Set black tabbar
printf -- $'\033]6;1;bg;red;brightness;20\a\033]6;1;bg;green;brightness;20\a\033]6;1;bg;blue;brightness;20\a'

