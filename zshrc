# .zshrc
 . ~/.profile

# User-specific PATH
typeset -U path PATH
path=("$HOME/.local/bin" "$HOME/bin" $path)

# History
HISTFILE="${ZDOTDIR:-$HOME}/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000

setopt APPEND_HISTORY
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

DIRSTACKSIZE=50

# Disable terminal bell
unsetopt BEEP

bindkey "^[[1;3D" backward-word
bindkey "^[[1;3C" forward-word

# Minimal prompt: blank line followed by % or # for root
PROMPT=$'\n%# '

autoload -Uz add-zsh-hook

abbreviated_pwd() {
    local -a components
    local i
    local title_path=$PWD

    if [[ $PWD == "$HOME" || $PWD == "$HOME/"* ]]; then
        title_path="~${PWD#$HOME}"
    fi

    components=("${(@s:/:)title_path}")
    for ((i = 2; i < $#components; i++)); do
        components[i]=${components[i][1]}
    done

    print -r -- "${(j:/:)components}"
}

update_terminal_title() {
    print -Pn "\e]0;%n@%m: $(abbreviated_pwd)\a"
}

add-zsh-hook precmd update_terminal_title
