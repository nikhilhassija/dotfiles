# Initialize Zsh's completion system
autoload -Uz compinit
compinit

# fzf
[[ -f /usr/share/fzf/key-bindings.zsh ]] && source /usr/share/fzf/key-bindings.zsh
[[ -f /usr/share/fzf/completion.zsh ]] && source /usr/share/fzf/completion.zsh

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
