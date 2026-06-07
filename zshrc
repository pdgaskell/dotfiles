# .zshrc

# Source global definitions
if [ -f /etc/zshrc ]; then
    . /etc/zshrc
fi

# User specific environment
if [[ ! "$PATH" == *"$HOME/.local/bin:$HOME/bin"* ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemd's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.zshrc.d ]; then
    for rc in ~/.zshrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

setopt no_auto_menu
setopt bash_auto_list
setopt no_menu_complete

bindkey -e

bindkey '^U' backward-kill-line

set_terminal_title() {
    local max_width=58
    local user_host="${USER}@$(hostname -s)"
    local full_path="${PWD/#$HOME/~}"

    local title="${user_host} ${full_path}"

    # Fits already
    if (( ${#title} <= max_width )); then
        printf '\e]0;%s\a' "$title"
        return
    fi

    # Space available for path portion
    local available=$(( max_width - ${#user_host} - 1 ))

    # If extremely small, just show basename
    if (( available < 10 )); then
        printf '\e]0;%s %s\a' \
            "$user_host" "${full_path##*/}"
        return
    fi

    # Keep both start and end of path
    local keep_front=$(( available / 3 ))
    local keep_back=$(( available - keep_front - 3 ))

    local front="${full_path[1,keep_front]}"
    local back="${full_path[-keep_back,-1]}"

    printf '\e]0;%s %s...%s\a' \
        "$user_host" "$front" "$back"
}

precmd_functions+=(set_terminal_title)

# Prompt
if [[ -n "$TMUX" ]]; then
    PROMPT=$'\n%# '
else
    PROMPT='%n@%m %~ %# '
fi

