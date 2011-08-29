# Aliases (for mnemonics etc) 
alias where='pwd'
alias makeLocalhost='python -m SimpleHTTPServer'
alias cl='clear; pwd; ls'
alias dir='ls' # In case I start using the windows CLI
alias del='rm'
alias matrix='cmatrix -sab'
alias la='ls -la'

# To use custom bash scripts in the Tilde repo...
PATH="$HOME/scripts:${PATH}"

# Prompt color/look mods...
PROMPTCOL='\[\e[34m\]'
ENDCOL='\[\e[0m\]'
PS1="$PROMPTCOL(\A) \W \$:$ENDCOL"

export PATH  
export PS1
