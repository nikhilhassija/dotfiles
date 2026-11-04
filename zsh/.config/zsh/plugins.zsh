# Initialize Zsh's completion system
autoload -Uz compinit
compinit

# fzf
if fzf --zsh >/dev/null 2>&1; then
    eval "$(fzf --zsh)"
elif [[ -n "${HOMEBREW_PREFIX:-}" && -d "$HOMEBREW_PREFIX/opt/fzf/shell" ]]; then
    [[ -f "$HOMEBREW_PREFIX/opt/fzf/shell/key-bindings.zsh" ]] && source "$HOMEBREW_PREFIX/opt/fzf/shell/key-bindings.zsh"
    [[ -f "$HOMEBREW_PREFIX/opt/fzf/shell/completion.zsh" ]] && source "$HOMEBREW_PREFIX/opt/fzf/shell/completion.zsh"
else
    [[ -f /usr/share/fzf/key-bindings.zsh ]] && source /usr/share/fzf/key-bindings.zsh
    [[ -f /usr/share/fzf/completion.zsh ]] && source /usr/share/fzf/completion.zsh
fi

# Load Sheldon plugins
if command -v sheldon >/dev/null 2>&1; then
    eval "$(sheldon source)"
fi

# History search by current prefix
autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search

zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

bindkey '^[[A' up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search

# Expand history references when pressing Space
bindkey ' ' magic-space

# Edit the current command line in $EDITOR from vi insert mode
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M viins '^X^E' edit-command-line

# Move to the absolute beginning of the command line in vi insert mode
bindkey -M viins '^A' beginning-of-line
