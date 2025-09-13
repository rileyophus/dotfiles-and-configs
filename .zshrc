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

export EDITOR=nvim
export VISUAL=nvim

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

source "$HOME/gitrepos/zsh-plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source "$HOME/gitrepos/zsh-plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"

#-------------------------------------
# setup for FISH-like abbreviations
# based on https://dev.to/frost/fish-style-abbreviations-in-zsh-40aa
#-------------------------------------

# declare a list of expandable abbreviations to fill up later
typeset -A abbrs
abbrs=()

# add an abbreviation to the list
function abbr() {
    local key="${1%%\=*}"  # '%%\=*' removes the equals sign and everything after it
    local val="${1#*\=}"  # '#*\=' removes the equals sign and everything before it
    abbrs[$key]="$val"
}

# expand any abbreviation in the current line buffer
function expand-abbreviations() {
    for key in "${(@k)abbrs}"; do
        # LBUFFER is "left buffer" not "line buffer"
        [[ "$LBUFFER" != "$key" && "$LBUFFER" != *" $key" ]] && continue

        local before="${LBUFFER%$key}"
        local after="${abbrs[$key]}"  # this is where the actual substitution is done
        LBUFFER="${before}${after}"
        break
    done
    zle magic-space
}
# make the function into a widget so bindkey can use it
zle -N expand-abbreviations

# bind the space key to expand-abbreviations(), unless during a search
bindkey ' '            expand-abbreviations
bindkey -M isearch ' ' magic-space

# control-space to bypass completion
bindkey '^ ' magic-space

#-------------------------------------
# end of abbreviation setup
#-------------------------------------

alias eza='eza --icons'

abbr df='df -h'
abbr ezaa='eza -a'
abbr grep='grep -i'
abbr hist='fc -l'
abbr history='fc -l'
abbr lsa='ls -a'
abbr mkdir='mkdir -p'
abbr nv='nvim'
abbr sudo='doas'
abbr uname='uname -nor'
abbr ..='cd ..'
abbr ...='cd ../..'

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
