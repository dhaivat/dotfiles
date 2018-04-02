function n() {
    vim note:$1
}

function xterm_title() {
    builtin print -n -P -- "\e]0;$@\a"
}

function screen_title() {
    builtin print -n -P -- "\ek$@\e\\"
    xterm_title "$@"
}

function preexec () {
    screen_title "%2~" ":" "\"$1\""
}

function precmd () {
    screen_title "%2~"
}
