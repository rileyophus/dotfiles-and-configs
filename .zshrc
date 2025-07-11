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
export EDITOR="/usr/bin/nvim"

bindkey  "^[[H"     beginning-of-line
bindkey  "^[[F"     end-of-line
bindkey  "^[[3~"    delete-char
bindkey  "^[[3;5~"  kill-word
bindkey  "^[[3;6~"  kill-line
bindkey  "^H"       backward-kill-word
bindkey  "^[[1;5C"  forward-word
bindkey  "^[[1;5D"  backward-word

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

# adds an abbreviation to the list
function abbr() {
    local key="${1%%\=*}"  # %%\=* removes the equals sign and everything after it
    local val="${1#*\=}"
    abbrs[$key]="$val"
}

# expand any abbreviation in the current line buffer
function expand-abbreviations() {
    for key in "${(@k)abbrs}"; do
    # remove the right side of the conditional if you only want to expand at the beginning of the line
        if [[ $LBUFFER == "$key" || $LBUFFER == *" $key" ]]; then
            local before=${LBUFFER%$key}
            local after="${abbrs[$key]}"  # this is where the actual substitution is done
            LBUFFER="${before}${after}"
            break
        fi
    done
    zle magic-space
}
zle -N expand-abbreviations

# Bind the space key to expand-abbreviations()
bindkey ' '             expand-abbreviations
bindkey '^ '            magic-space  # control-space to bypass completion
bindkey -M isearch " "  magic-space  # normal space during searches

# Expands any abbreviations before accepting the line as is and executing the entered command
expand-abbrs-and-accept-line() {
    expand-abbreviations
    zle .backward-delete-char
    zle .accept-line
}
zle -N accept-line expand-abbrs-and-accept-line

#-------------------------------------
# end of abbreviation setup
#-------------------------------------

abbr df='df -h'
abbr grep='grep -i'
abbr mkdir='mkdir -p'
abbr history='history 1'
abbr ..='cd ..'
abbr ...='cd ../..'
abbr nv='nvim'
abbr lsa='ls -a'
