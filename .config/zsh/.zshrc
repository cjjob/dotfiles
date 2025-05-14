#### My scripts.
source $ZDOTDIR/prompt.zsh
source $ZDOTDIR/aliases.zsh
source $ZDOTDIR/functions.zsh

#### Everything below is just following installation instructions.

# Autocompletions.
# https://github.com/marlonrichert/zsh-autocomplete
# Replaces any calls to compinit.
source $(brew --prefix)/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh

source <(fzf --zsh)

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/share/zsh-you-should-use/you-should-use.plugin.zsh

eval "$(thefuck --alias)"
eval "$(zoxide init zsh)"

fastfetch \
	--logo ~/.config/fastfetch/custom_logo.txt \
	--logo-type file
