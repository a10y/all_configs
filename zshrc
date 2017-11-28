## Basics
setopt auto_cd
setopt promptsubst

## Setup the fpath to read functions, e.g. for completion
fpath+="${HOME}/.zfunc"

# Tab completion
autoload -Uz compinit
compinit

# Use Emacs keybindings for line editing
bindkey -e

# Source git-prompt script to allow showing git info
source $HOME/.git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1

function prompt() {
  local user=$(whoami)
  # echo -n "%* | %B%F{green}%~%b%f %B❯%b "
  #echo -n "%F{magenta}%2~%f %B%F{red}❯%f%F{blue}❯%f%F{yellow}❯%f%b "
  echo -n "%B%U%3~%b%u %B%F{red}❯%f%F{blue}❯%f%F{yellow}❯%f%b "
}

function rprompt() {
  #echo -n "%(?.%B%F{green}✓%f%b.%?)$(__git_ps1)"
  echo -n "%K{red}%(?..%?)%k%B%F{green}$(__git_ps1)%b%f"
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
if [[ $(uname -a) =~ "Darwin" ]]; then
    alias ls="ls -G" # Color
    alias ll="ls -Gahl"
    alias l="ls -Ga"
    alias grep="grep --color"
elif [[ $(uname -a) =~ "Linux" ]]; then
    alias ls="ls --color" # Color
    alias ll="ls --color -ahl"
    alias l="ls --color -a"
    alias grep="grep --color"
fi


# Aliases for Git
alias git="hub"
alias g="git"
alias ga="git add"
alias gc="git commit"
alias gs="git status"
alias gd="git diff"
alias gh="git help"
alias gl="git log"

# Gradle
alias gw="./gradlew"

# Docker
alias d="docker"
alias dc="docker-compose"

# Aliases for applications
alias vlc='/Applications/VLC.app/Contents/MacOS/VLC -I rc'

# Alias for fzf
alias fzf='fzf --preview "head -n $(($(tput lines)-0)) {}"'
alias ff='nvim $(fzf)'

# Stack: TODO Fix once the ghc issue is fixed
#alias stack="stack --system-ghc"

alias code='code-insiders'
alias gtd="nvim $HOME/GTD.txt"

export GOPATH=$HOME/go
export LANG="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# Setup CDPATH
export CDPATH=.:$HOME/git:$HOME/Dropbox/Stanford

# Rust source for racer
export RUST_SRC_PATH="$HOME/git/rust/src"

# Order:
# 1. my ~/.bin
# 2. Homebrew overrides
# 3. Everything else
# ... except for whatever I have in ~/.bin

export PATH=$HOME/.bin:/usr/local/bin:$HOME/miniconda2/bin:$HOME/.cargo/bin:$HOME/.local/bin:/Library/Developer/Toolchains/swift-latest.xctoolchain/usr/bin:${GOPATH//://bin:}/bin:$PATH

export PYTHONSTARTUP=$HOME/.pythonrc

# Fix locations for OpenSSL installed via brew
export OPENSSL_INCLUDE_DIR="/usr/local/opt/openssl/include"
export OPENSSL_LIB_DIR="/usr/local/opt/openssl/lib"

# Activate Torch if installed available.
# if [[ -d "${HOME}/torch" ]]; then
#   . /Users/andrew/torch/install/bin/torch-activate
# fi

# Java setup
if [[ $(uname -a) =~ "Darwin" ]]; then
    export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)

    function jhome() {
        export JAVA_HOME=$(/usr/libexec/java_home -v "$1")
        echo "$JAVA_HOME"
    }
fi

export POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)
export POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status)
#source  ~/powerlevel9k/powerlevel9k.zsh-theme
alias dev='docker-compose -f docker-compose.shared.yml'

#test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Setup environment for hub
export GITHUB_HOST="github.palantir.build"
if [[ -f "$HOME/.hubtoken" ]]; then
    export GITHUB_TOKEN=$(cat $HOME/.hubtoken)
fi
