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
        if output=$(stow --simulate "$package" 2>&1); then
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
        stow --restow "$package"
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

    check_dependencies
    check_stow_conflicts
    install_dotfiles
    install_tpm
    sync_sheldon
    finish
}

main
