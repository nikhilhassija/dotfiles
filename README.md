# Dotfiles

Personal development environment focused on simplicity, reproducibility, and long-term maintainability.

## Philosophy

These dotfiles are built around a few simple principles:

- Prefer native functionality over plugins.
- Keep configurations modular and easy to understand.
- Add tools only when they solve a recurring problem.
- Optimize for long-term maintainability over trends.
- Make the environment reproducible on a new machine.

## Packages

Every top-level directory is a GNU Stow package.

| Package | Description |
|---------|-------------|
| `git` | Git configuration |
| `nvim` | Neovim configuration |
| `sheldon` | Zsh plugin manager configuration |
| `starship` | Starship prompt configuration |
| `tmux` | tmux configuration |
| `zsh` | Zsh configuration |

## Prerequisites

Install the following tools before running the installer:

- Git
- GNU Stow
- Zsh
- tmux
- Neovim
- Starship
- Sheldon

## Installation

Clone the repository:

```bash
git clone git@github.com:nikhilhassija/dotfiles.git
cd dotfiles
```

Run the installer:

```bash
./install.sh
```

After installation:

```bash
exec zsh
```

Inside tmux, install TPM plugins:

```text
Prefix + I
```

## Repository Structure

```text
dotfiles/
├── git/
├── nvim/
├── sheldon/
├── starship/
├── tmux/
├── zsh/
├── install.sh
└── README.md
```

## License

MIT
