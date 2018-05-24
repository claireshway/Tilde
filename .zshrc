#!/bin/zsh
# zsh initialization file.

# Load Posix-compatible bits at startup.
. $HOME/rcfiles/rc.sh

# Set up the prompt.
set -o PROMPT_SUBST
. $HOME/rcfiles/prompt.zsh

if test -e $HOME/rcfiles/work.rc.sh
then
  . $HOME/rcfiles/work.rc.sh
fi

# Include my own functions.
fpath+=($HOME/functions)

# Use Vim keybindings in ZLE.
bindkey -v

setopt histignorealldups sharehistory extended_glob nonomatch

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use history for zsh-autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_USE_ASYNC='yes, please! async is usually better.'
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=$THEME"
bindkey '^ ' autosuggest-accept # Because the right-arrow key is too far away.

# Enable $EDITOR to edit command line.
autoload -U edit-command-line
# Emacs style
zle -N edit-command-line
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line
# Vi style:
zle -N edit-command-line
bindkey -M vicmd v edit-command-line



# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'


# Add my own completions.
. $HOME/rcfiles/completions.zsh

if which helm >/dev/null
then
  source <(helm completion zsh)
fi

if [ -f "$HOME/rcfiles/gcloud.zsh" ]; then source "$HOME/rcfiles/gcloud.zsh"; fi
