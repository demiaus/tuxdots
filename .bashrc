#
# ~/.bashrc
#

[[ $- != *i*            ]] && return
[[ "$(whoami)" = "root" ]] && return
[[ -z "$FUNCNEST"       ]] && export FUNCNEST=100

echo "$(date +%T) open  ~/.bashrc" >> ~/.log/rc.log

[ -f ~/.bash_aliases ] && . ~/.bash_aliases

if [ -x /usr/bin/fzf ]; then
    [ -f /usr/share/fzf/key-bindings.bash ] && . /usr/share/fzf/key-bindings.bash
    [ -f /usr/share/fzf/completion.bash   ] && . /usr/share/fzf/completion.bash
    [ -f ~/.config/fzf/rose-pine.fzf      ] && . ~/.config/fzf/rose-pine.fzf
    [ -f ~/.bash_completion/alacritty     ] && . ~/.bash_completion/alacrittyn.bash
fi

[ -f /usr/share/doc/pkgfile/command-not-found.bash ] && . /usr/share/doc/pkgfile/command-not-found.bash

if [ -x /usr/bin/fff ]; then
    [ -f ~/.config/fff/fff.conf ] && . ~/.config/fff/fff.conf
    f() {
        fff "$@"
        cd "$(cat "${XDG_CACHE_HOME:=${HOME}/.cache}/fff/.fff_d")"
    }
fi


PS1="\[\033[36m\]$PS1\[\033[00m\]"

set -o noclobber
set -o ignoreeof
shopt -s checkwinsize
bind Space:magic-space
shopt -s globstar 2> /dev/null

bind "set completion-map-case on"
bind "set show-all-if-ambiguous on"
bind "set mark-symlinked-directories on"

shopt -s histappend
shopt -s cmdhist
shopt -s dirspell 2> /dev/null
shopt -s cdspell 2> /dev/null
shopt -s cdable_vars
export anki="$HOME/.local/share/Anki2/addons21"

PROMPT_COMMAND='history -a'
HISTSIZE=500000
HISTFILESIZE=100000
HISTCONTROL="erasedups:ignoreboth"
HISTTIMEFORMAT='%F %T '

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind '"\e[C": forward-char'
bind '"\e[D": backward-char'

CDPATH="."

if [[ -t 0 && $- = *i* ]]
then
    stty -ixon
fi

echo "$(date +%T) close ~/.bashrc" >> ~/.log/rc.log


export PATH=$PATH:/home/ami/.spicetify
