# Path to your oh-my-zsh configuration.
ZSH=$HOME/.dotfiles/oh-my-zsh
DEFAULT_USER='dp'

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="dhaivat"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=$HOME/.dotfiles/zsh

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(
  git
)

# User configuration

# set PATH:
[ -f "$ZSH/oh-my-zsh.sh" ] && . $ZSH/oh-my-zsh.sh
[ -f '/opt/boxen/env.sh' ] && . '/opt/boxen/env.sh'

# make PATH/path unique
typeset -U path
# prepend $HOME/bin to path
path=($HOME/bin "$path[@]")

# export MANPATH="/usr/local/man:$MANPATH"

setopt hist_ignore_all_dups
unsetopt correct_all
bindkey -v
bindkey "^r" history-incremental-search-backward


# Customize to your needs...


case $TERM in
    screen|screen-w|screen-256color|screen-256color-bce)
        alias titlecmd="screen_title"
    ;;
    xterm|xterm-256color|xterm-color)
        alias titlecmd="xterm_title"
    ;;
    *)
        alias titlecmd=":"
    ;;
esac

## autoset title based on location and process

#ssh() {
#    screen_title "$1";
#    titlecmd "$1";
#    command ssh $*;
#    screen_title "$HOSTNAME";
#}

#
# end: Xterm and Screen title update
set-show-tabs() {
    global=
    test "$1" = -g || test "$1" = --global && global=--global
    cws=$(command git config $global core.whitespace)
    case "$cws" in
        tab-in-indent,*|*,tab-in-indent|*,tab-in-indent,*) ;;
        *) command git config $global core.whitespace "$cws"${cws:+,}tab-in-indent ;;
    esac
}
set-show-tabs           # only in local repository
set-show-tabs --global  # for all your Git activities

_complete_ssh_hosts ()
{
        COMPREPLY=()
        cur="${COMP_WORDS[COMP_CWORD]}"
        comp_ssh_hosts=`cat ~/.ssh/known_hosts | \
                        cut -f 1 -d ' ' | \
                        sed -e s/,.*//g | \
                        grep -v ^# | \
                        uniq | \
                        grep -v "\[" ;
                cat ~/.ssh/config | \
                        grep "^Host " | \
                        awk '{print $2}'
                `
        COMPREPLY=( $(compgen -W "${comp_ssh_hosts}" -- $cur))
        return 0
}
compctl -F _complete_ssh_hosts ssh
compctl -F _complete_ssh_hosts rpup
#compctl -o default -o nospace -W “$(awk ‘/^Host / {print $2}’ < $HOME/.ssh/config) scp sftp SSH
# Bash-like command editing
autoload -U edit-command-line; zle -N edit-command-line; bindkey '^X^e' edit-command-line;

unalias gl
[ -f /usr/local/etc/profile.d/z.sh ] && . /usr/local/etc/profile.d/z.sh
export PATH="/usr/local/opt/thrift@0.9/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/usr/local/google/google-cloud-sdk/path.zsh.inc' ]; then source '/usr/local/google/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/usr/local/google/google-cloud-sdk/completion.zsh.inc' ]; then source '/usr/local/google/google-cloud-sdk/completion.zsh.inc'; fi
. /usr/local/etc/profile.d/z.sh
eval "$(direnv hook zsh)"
