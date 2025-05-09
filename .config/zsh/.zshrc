# Set up pure prompt.
# TODO: Create my own prompt.
autoload -U promptinit
promptinit
prompt pure

# Autocompletions.
# e.g. cp - <tab> will show you options for the cp command.
autoload -U compinit
compinit

source $ZDOTDIR/aliases.zsh
source $ZDOTDIR/functions.zsh

# Eveything below is just following installation instructions.
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/share/zsh-you-should-use/you-should-use.plugin.zsh
eval "$(thefuck --alias)"
eval "$(zoxide init zsh)"
