
#--------------------------------------------------------------------#
# Aliases                                                            #
#--------------------------------------------------------------------#

# Importing Utilities
. "$ZSH_CUSTOM/src/utilities/cat-copy.zsh"

# Aliases
alias sizeofdir="du -h --max-depth=1 | sort -hr"
alias sizeof="du -h --max-depth=1 $@"
alias gpgax="gpg --armor --export"
alias gpga="gpg-agent --daemon --use-standard-socket"
alias ggh="git log --graph --oneline --decorate"
alias catcp="cat_copy $@"