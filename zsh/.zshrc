# Lines configured by zsh-newuser-install
HISTFILE="$ZDOTDIR/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/riley/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

export EDITOR="nvim"
export VISUAL="nvim -R"

. "$HOME/.config/git-prompt.sh"
setopt PROMPT_SUBST
export PROMPT='\
%B%F{green}%n@%m%f\
 %F{blue}%3~%f\
%F{cyan}$(__git_ps1 " (%s)")%f\
%F{red}%(?.. [%?])%f%b \
'

# necessary for tab completion with aliases
setopt complete_aliases

bindkey "^[[H"    beginning-of-line  # home
bindkey "^[[F"    end-of-line        # end
bindkey "^[[3~"   delete-char        # del
bindkey "^[[3;5~" kill-word          # ctrl+del
bindkey "^[[3;6~" kill-line          # ctrl+shift+del
bindkey "^H"      backward-kill-word # ctrl+backspace
bindkey "^[[1;5C" forward-word       # ctrl+right
bindkey "^[[1;5D" backward-word      # ctrl+left

# autocomplete from history
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search

#-------------------------------------
# setup for FISH-like abbreviations
# based on https://dev.to/frost/fish-style-abbreviations-in-zsh-40aa
#-------------------------------------

# declare a list of expandable abbreviations to fill up later
typeset -A abbrevs
abbrevs=()

# add an abbreviation to the list
function abbrev() {
    local key="${1%%\=*}" # '%%\=*' removes the equals sign and everything after it
    local val="${1#*\=}"  # '#*\=' removes the equals sign and everything before it
    abbrevs[$key]="$val"
}

# expand the abbreviation that's right before the cursor
function expand-abbreviation() {
    for key in "${(@k)abbrevs}"; do
        # LBUFFER is "left buffer" not "line buffer"
        [[ "$LBUFFER" != "$key" && "$LBUFFER" != *" $key" ]] && continue

        local before="${LBUFFER%$key}"
        local after="${abbrevs[$key]}" # where the actual substitution is done
        LBUFFER="${before}${after}"
        break
    done
    zle magic-space
}
# make the function into a widget so bindkey can use it
zle -N expand-abbreviation

# bind the space key to expand-abbreviation(), unless during a search
bindkey ' '            expand-abbreviation
bindkey -M isearch ' ' magic-space

# ctrl+space to bypass completion
bindkey '^ ' magic-space

#-------------------------------------
# end of abbreviation setup
#-------------------------------------

bindkey '^e' _expand_alias

alias zcc='zig cc -std=c99 -Wall -Wextra -Wpedantic -Wno-char-subscripts'
alias zcpp='zig c++ -std=c++23 -Wall -Wextra -Wpedantic -Wno-char-subscripts -Wold-style-cast'
alias gccw='gcc -std=c99 -Wall -Wextra -Wpedantic -Wno-char-subscripts'
alias gcpp='g++ -std=c++23 -Wall -Wextra -Wpedantic -Wno-char-subscripts -Wold-style-cast'

alias ls='ls --color'

abbrev fpi='flatpak install --user'
abbrev lsa='ls -a'
abbrev lsl='ls -l'
abbrev nv='nvim'
abbrev uname='uname -nor'
abbrev xi='xbps-install'
abbrev xq='xbps-query'
abbrev ..='cd ..'
abbrev ...='cd ../..'

# usage: runc <file.c> <compiler> <flags>
function runc() {
    local file="${1%.*}"
    "${@:2}" "$1" -o "$file" && ./"$file"
}

function run-disown() {
    setsid "${@}" < /dev/null > /dev/null 2>&1 & disown
}
