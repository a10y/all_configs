# Override LSCOLORS
#export LSCOLORS="GxfxGxExCxCxBgxBxB"

setopt auto_cd
setopt promptsubst

# Tab completion
autoload -Uz compinit
compinit

# Use Emacs keybindings for line editing
bindkey -e

# Allow functions and substitutions in prompt string

# Source git-prompt script to allow showing git info
source $HOME/.bin/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1

function prompt() {
  local user=$(whoami)
  local color=yellow
  #local prompts=(∇ ∆ ∫ ⇰)
  local prompts=(∆)
  if [[ "$user" = "root" ]]; then
    color=red
  fi
  echo "%B%F{$color}%n%f @ %U%F{cyan}%~%u%f\n$prompts[RANDOM%$#prompts+1] "
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

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
source $HOME/.aliases


export GOPATH=$HOME/gopkgs
export PATH=$PATH:${GOPATH//://bin:}/bin
export LANG="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# Swift
export PATH=/Library/Developer/Toolchains/swift-latest.xctoolchain/usr/bin:${PATH}


# OPAM initialization
. /Users/andrew/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

# Add Haskell Stack bin directory
export PATH=$HOME/.local/bin:$PATH

# Add my stuff
export PATH=$HOME/virtualenvs/bin:$PATH

# Add Rust path
export PATH=$HOME/.cargo/bin:$PATH


# Neovim all the way!
alias vim="nvim"

# Setup CDPATH
export CDPATH=.:$HOME/git:$HOME/stanford

# Rust
export RUST_SRC_PATH="$HOME/git/rust/src"
export PATH="$HOME/.cargo/bin:$PATH"

# Make sure homebrew overrides come first
export PATH=/usr/local/bin:$PATH

# ... except for whatever I have
export PATH=$HOME/.bin:$PATH
