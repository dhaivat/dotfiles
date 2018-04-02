# Push and pop directories on directory stack
alias pu='pushd'
alias po='popd'

# Basic directory operations
alias ...='cd ../..'
alias -- -='cd -'

# Super user
alias _='sudo'
alias please='sudo'

#alias g='grep -in'

# Show history
if [ "$HIST_STAMPS" = "mm/dd/yyyy" ]
then
    alias history='fc -fl 1'
elif [ "$HIST_STAMPS" = "dd.mm.yyyy" ]
then
    alias history='fc -El 1'
elif [ "$HIST_STAMPS" = "yyyy-mm-dd" ]
then
    alias history='fc -il 1'
else
    alias history='fc -l 1'
fi
# List direcory contents
alias lsa='ls -lah'
alias l='ls -lah'
alias ll='ls -lh'
alias la='ls -lAh'

alias afind='ack-grep -il'

alias json="python -mjson.tool"
alias grpe="grep"
alias vl=vimpager
alias diff="diff --suppress-common-lines --side-by-side"
alias ws="cd $WS"
alias fs="cd $FS"
alias gh="cd $GOHOME"
alias ssh='TERM=xterm ssh'
alias vagrant="TERM=xterm vagrant"
alias t="todo.sh"
alias gd="git diff --color"
alias gdc="git diff --color --cached"
alias celar="clear"
alias a=". venv/bin/activate"
unalias gup
alias gup="git add  . ; git commit --amend --no-edit && git push origin HEAD:refs/for/master"
alias tf="terraform"
