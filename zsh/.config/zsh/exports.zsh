# Homebrew (macOS)
if [[ -x /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -x /usr/local/bin/brew ]]; then
    eval "$(/usr/local/bin/brew shellenv)"
fi

export EDITOR="nvim"
export VISUAL="nvim"
export PATH="$HOME/bin:$HOME/.local/bin:$PATH"
export ENTE_CLI_SECRETS_PATH="$HOME/.config/ente/secrets.txt"
export LANG="en_IN.UTF-8"
export LC_CTYPE="en_IN.UTF-8"
