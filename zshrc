# ~/.zshrc

# User-specific PATH
typeset -U path PATH
path=("$HOME/.local/bin" "$HOME/bin" $path)

# History
HISTFILE="${ZDOTDIR:-$HOME}/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000

setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY

# Emacs-style command-line editing
bindkey -e
bindkey '^U' backward-kill-line

# Completion
autoload -Uz compinit
compinit

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list \
    'm:{a-zA-Z}={A-Za-z}' \
    'r:|[._-]=* r:|=*'

# Useful shell behaviour
setopt INTERACTIVE_COMMENTS
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_SILENT

# Disable terminal bell
unsetopt BEEP

# Minimal prompt: blank line followed by % or # for root
PROMPT=$'\n%# '

autoload -Uz add-zsh-hook

update_terminal_title() {
    print -Pn '\e]0;%n@%m: %~\a'
}

add-zsh-hook precmd update_terminal_title

