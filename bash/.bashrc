# Check for interactive terminal
#
# If not running interactively, don't do anything and simply return.
case $- in
    *i*) ;;
      *) return;;
esac

# Terminal Scaling
#
# If the terminal has been resized, update the value of `LINES` and `COLUMNS`.
shopt -s checkwinsize

# Better Less
#
# Use the `lesspipe` preprocessor to enhance the standard `less` utility.
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Bash Completions
#
# Source the system bash completion files.
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Personal Scripts
#
# Add the directory that contains my personal scripts to the `PATH` so they can be called easier.
export PATH="$PATH:$HOME/bin"

# Editor Configuration
#
# Use neovim as the main editor if it is installed or fallback to regular vim.
if [ -x "$(command -v nvim)" ]; then
    export EDITOR=nvim
else
    export EDITOR=vim
fi

# Case insensitive completions
#
bind 'set completion-ignore-case on'

# Prompt Customization 
#
# Will have the following format: `<FULL PATH> [<GIT BRANCH>] >>=`
# e.g. `~/workspace/dotfiles main >>=`
# Note: Some of the spacing around the git branch is being configured in the `git-prompt` script.
if [ -x "$(command -v git-prompt)" ]; then
    export PS1='\[\033[01;34m\]\w\[\033[00m\] $(git-prompt)>>= '
else
    export PS1='\[\033[01;34m\]\w\[\033[00m\] >>= '
fi

# Alias
#
alias ll='ls -alF --color=auto'
alias l='ls -CF --color=auto'
alias g='git'
alias n='nvim'

# Key Bindings
#
# * Use C-f to launch the tmux session selector.
bind -x '"\C-f": tmux-sessionizer'
# * Use C-g to launch interactive git commit selector if within tmux session.
if [ -n "$TMUX" ]; then
    bind -x '"\C-g": tmux send-keys "$(git-commit-select-interactive)"'
fi


# Bash History
#
# * Unlimited command history and history file size.
# * Saved to a custom `.bash_eternal_history` file.
# * Append commands to this file and don't overwrite.
# * Ignore commands duplicate commands called after each other.
export HISTSIZE= 
export HISTFILESIZE=
export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
export HISTFILE=~/.bash_eternal_history
export HISTCONTROL=ignoredups
shopt -s histappend

# Programming Configurations
#
# Some languages/tools will require modifications to the path these are set in this block.
#
# Rust - cargo
if [ -d "$HOME/.cargo/env" ]; then
    . "$HOME/.cargo/env"
fi
# Python - pyenv
export PYENV_ROOT="$HOME/.pyenv"
if [ -d "$PYENV_ROOT" ]; then
    command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
fi
# Python - pipx
export PATH="$PATH:$HOME/.local/bin"
# Node - nvm
export NVM_DIR="$HOME/.nvm"
if [ -d "$NVM_DIR" ]; then
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi
