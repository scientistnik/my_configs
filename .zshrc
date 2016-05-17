# Created by newuser for 5.1.1
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx

autoload -U colors && colors

PROMPT="%{$fg[cyan]%}.-%{$reset_color%}(%{$fg[green]%}%~%{$reset_color%})%{$fg[cyan]%}-%{$fg[red]%}%n%{$fg[cyan]%}@%{$fg[blue]%}%m
%{$fg[cyan]%}"'`'"--> %{$reset_color%}"
#RPROMPT='%T'

autoload -U compinit
compinit

setopt autocd

HISTFILE=~/.zhistory
HISTSIZE=1000
SAVEHIST=1000
setopt APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS

case $TERM in

linux)
	bindkey "^[[2~" yank
	bindkey "^[[3~" delete-char
	bindkey "^[[5~" up-line-or-history
	bindkey "^[[6~" down-line-or-history
	bindkey "^[[1~" beginning-of-line
	bindkey "^[[4~" end-of-line
	bindkey "^[e" expand-cmd-path ## C-e for expanding path of typed command
	bindkey "^[[A" up-line-or-search ## up arrow for back-history-search
	bindkey "^[[B" down-line-or-search ## down arrow for fwd-history-search
	bindkey " " magic-space ## do history expansion on space
	;;
*xterm*|rxvt|(dt|k|E)term)
	bindkey "^[[2~" yank
	bindkey "^[[3~" delete-char
	bindkey "^[[5~" up-line-or-history
	bindkey "^[[6~" down-line-or-history
	bindkey "^[[7~" beginning-of-line
	bindkey "^[[8~" end-of-line
	bindkey "^[e" expand-cmd-path ## C-e for expanding path of typed command
	bindkey "^[[A" up-line-or-search ## up arrow for back-history-search
	bindkey "^[[B" down-line-or-search ## down arrow for fwd-history-search
	bindkey " " magic-space ## do history expansion on space
	;;
esac

export ANDROID_HOME=/opt/android-sdk
