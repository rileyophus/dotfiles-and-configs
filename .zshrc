# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/riley/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

bindkey  "^[[H"       beginning-of-line
bindkey  "^[[F"       end-of-line
bindkey  "^[[3~"      delete-char
bindkey  "^[[3;5~"    kill-word
bindkey  "^H"         backward-kill-word
bindkey  "^[[1;5C"    forward-word
bindkey  "^[[1;5D"    backward-word

alias df='df -h'
alias grep='grep -i'
alias history='history 1'

alias ..='cd ..'
alias ...='cd ../..'

eval "$(starship init zsh)"
