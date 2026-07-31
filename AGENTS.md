# AGENTS.md

## Repository philosophy

This repository favors simplicity and maintainability over feature richness.

Before introducing a new tool, plugin, or dependency, ask:

1. Does it solve a recurring problem?
2. Is native functionality sufficient?
3. Does it fit the existing architecture?

Avoid adding tools solely because they are popular.

## Repository structure

Every top-level directory is a GNU Stow package.

Do not create additional top-level directories without a clear reason.

## Shell

- Use Zsh.
- Sheldon manages Zsh plugins.
- Starship manages the prompt.
- Prefer native Zsh functionality over plugins.

## Neovim

Neovim is configured primarily as a lightweight terminal editor.

Do not introduce IDE-style features (LSP, completion, snippets, DAP, etc.) unless explicitly requested.

Prefer native Neovim functionality over plugins.

## Installer

install.sh should:

- remain idempotent
- never install OS packages
- never require sudo
- only install/configure dotfiles

## General

- Prefer explicit configuration over clever abstractions.
- Keep startup fast.
- Keep files modular.
- Avoid unnecessary dependencies.
