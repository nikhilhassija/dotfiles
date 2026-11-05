#!/usr/bin/env bash

#
# install.sh
#
# Installs this dotfiles repository using GNU Stow.
# Assumes all required dependencies are already installed.
#

set -Eeuo pipefail

################################################################################
# Configuration
################################################################################

readonly REQUIRED_COMMANDS=(
    git
    stow
    zsh
    tmux
    nvim
    starship
    sheldon
    eza
    fzf
)

readonly PACKAGES=(
    git
    nvim
    sheldon
    starship
    tmux
    zsh
)

readonly TPM_DIR="$HOME/.tmux/plugins/tpm"
readonly TARGET_DIR="$HOME"
readonly FONT_URL="https://github.com/ryanoasis/nerd-fonts/releases/latest/download/SourceCodePro.tar.xz"
readonly FONT_CHECK_FILE="SauceCodeProNerdFontMono-Regular.ttf"

################################################################################
# Colours
################################################################################

readonly GREEN="\033[0;32m"
readonly RED="\033[0;31m"
readonly BLUE="\033[0;34m"
readonly RESET="\033[0m"

################################################################################
# Helper functions
################################################################################

info() {
    printf "\n${BLUE}==>${RESET} %s\n" "$1"
}

success() {
    printf "${GREEN}✓${RESET} %s\n" "$1"
}

error() {
    printf "${RED}✗${RESET} %s\n" "$1"
}

die() {
    error "$1"
    exit 1
}

trap 'error "Unexpected error on line ${LINENO}. Exiting."' ERR

################################################################################
# Steps
################################################################################

check_dependencies() {
    info "Checking dependencies"

    local missing=()

    for cmd in "${REQUIRED_COMMANDS[@]}"; do
        if command -v "$cmd" >/dev/null 2>&1; then
            success "$cmd"
        else
            error "$cmd"
            missing+=("$cmd")
        fi
    done

    if (( ${#missing[@]} > 0 )); then
        echo
        error "Missing dependencies:"
        printf '  - %s\n' "${missing[@]}"
        echo
        die "Please install the missing dependencies and rerun install.sh."
    fi
}

check_stow_conflicts() {
    info "Checking for stow conflicts"

    local conflicts=()

    for package in "${PACKAGES[@]}"; do
        if output=$(stow --target="$TARGET_DIR" --simulate "$package" 2>&1); then
            success "$package"
        else
            error "$package"
            conflicts+=("$package")

            echo
            echo "$output"
            echo
        fi
    done

    if (( ${#conflicts[@]} > 0 )); then
        error "Stow conflicts detected:"
        printf '  - %s\n' "${conflicts[@]}"
        echo
        die "Resolve the conflicts above and rerun install.sh."
    fi
}

install_dotfiles() {
    info "Installing dotfiles"

    for package in "${PACKAGES[@]}"; do
        stow --target="$TARGET_DIR" --restow "$package"
        success "$package"
    done
}

install_tpm() {
    info "Checking TPM"

    if [[ -d "$TPM_DIR" ]]; then
        success "TPM already installed"
        return
    fi

    git clone https://github.com/tmux-plugins/tpm "$TPM_DIR" >/dev/null

    success "Installed TPM"
}

sync_sheldon() {
    info "Syncing Sheldon plugins"

    sheldon lock >/dev/null

    success "Sheldon plugins synchronized"
}

install_fonts() {
    info "Checking SauceCodePro Nerd Font Mono"

    local font_dir
    if [[ "$OSTYPE" == darwin* ]]; then
        font_dir="$HOME/Library/Fonts"
    else
        font_dir="${XDG_DATA_HOME:-$HOME/.local/share}/fonts"
    fi

    if [[ -f "$font_dir/$FONT_CHECK_FILE" ]]; then
        success "SauceCodePro Nerd Font Mono already installed"
        return
    fi

    mkdir -p "$font_dir"

    local tmp_dir
    tmp_dir="$(mktemp -d)"

    curl -fsSL "$FONT_URL" -o "$tmp_dir/SourceCodePro.tar.xz"
    tar -xf "$tmp_dir/SourceCodePro.tar.xz" -C "$tmp_dir"
    cp "$tmp_dir"/SauceCodeProNerdFontMono-*.ttf "$font_dir"/
    rm -rf "$tmp_dir"

    if [[ "$OSTYPE" != darwin* ]] && command -v fc-cache >/dev/null 2>&1; then
        fc-cache -f "$font_dir" >/dev/null
    fi

    success "Installed SauceCodePro Nerd Font Mono"
}

finish() {
    info "Installation complete"

    cat <<EOF

Next steps:

  • Restart your shell:
      exec zsh

  • Reload tmux configuration:
      Prefix + r

  • Install tmux plugins:
      Prefix + I

EOF
}

################################################################################
# Main
################################################################################

main() {
    local script_dir

    script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    cd "$script_dir"

    # Ensure Homebrew is on PATH on macOS if not yet configured in the current shell
    if [[ -x /opt/homebrew/bin/brew ]]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    elif [[ -x /usr/local/bin/brew ]]; then
        eval "$(/usr/local/bin/brew shellenv)"
    fi

    check_dependencies
    check_stow_conflicts
    install_dotfiles
    install_tpm
    sync_sheldon
    install_fonts
    finish
}

main
