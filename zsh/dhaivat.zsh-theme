RPROMPT='%{$fg_bold[green]%}%(?,:),%{$fg_bold[red]%}:()%{$fg_bold[cyan]%}$(git_prompt_info)%{$fg_bold[blue]%}%~%{$reset_color%}'

OS_TYPE=$(uname -s)
OS_TYPE='%F{blue}'${OS_TYPE:0:1}'%F{magenta}:%f'
H_U='%m%F{green}]'

PROMPT='%(!.%{$fg_bold[red]%}.%{$fg_bold[green]%}[$OS_TYPE%n@)$H_U %{$fg_bold[magenta]%}%#%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX="-("
ZSH_THEME_GIT_PROMPT_SUFFIX=")-"
