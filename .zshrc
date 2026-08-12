# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/riley/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

export EDITOR='flatpak run --filesystem=host io.neovim.nvim'
export VISUAL="$EDITOR"

# necessary for tab completion with aliases
setopt complete_aliases

bindkey "^[[H"    beginning-of-line
bindkey "^[[F"    end-of-line
bindkey "^[[3~"   delete-char
bindkey "^[[3;5~" kill-word
bindkey "^[[3;6~" kill-line
bindkey "^H"      backward-kill-word
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# should be the default, but setting this again fixes a bug when exiting vi mode
bindkey "^?" backward-delete-char

# autocomplete from history
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search

eval "$(starship init zsh)"

source "$HOME/zsh-plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source "$HOME/zsh-plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"

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
alias gcpp='g++ -std=c++23 -Wall -Wextra -Wpedantic -Wold-style-cast -Wno-char-subscripts'

alias nvim='flatpak run --filesystem=host io.neovim.nvim'

abbrev mv='mv -i'
abbrev df='df -h'
abbrev ezaa='eza -a'
abbrev ezal='eza -l'
abbrev grep='grep -i'
abbrev rg='rg -S'
abbrev hist='fc -l'
abbrev lsa='ls -a'
abbrev mkdir='mkdir -p'
abbrev nv='nvim'
abbrev sudo='doas'
abbrev uname='uname -nor'
abbrev ..='cd ..'
abbrev ...='cd ../..'

# usage: runc <file.c> <compiler> <flags>
function runc() {
    local file="${1%.*}"
    "${@:2}" "$1" -o "$file" && ./"$file"
}

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
