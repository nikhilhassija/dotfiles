function get_pwd() {
  echo "${PWD/$HOME/~}"
}

local ret_status="%(?:%{$fg_bold[white]%}%% :%{$fg_bold[red]%}%% )"
PROMPT='%n@%m:%{$fg_bold[green]%}$(get_pwd)%{$reset_color%} $(git_prompt_info)'$'\n''${ret_status}%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
