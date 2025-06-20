alias c="clear"
alias cd="z"
alias cdi="zi"
alias l='eza --color=always --color-scale=all --color-scale-mode=gradient \
	--icons=always --group-directories-first'
alias la='eza --color=always --color-scale=all --color-scale-mode=gradient \
	--icons=always --group-directories-first -a'
alias ll='eza --color=always --color-scale=all --color-scale-mode=gradient \
	--icons=always --group-directories-first -l --git -h'
alias lla='eza --color=always --color-scale=all --color-scale-mode=gradient \
	--icons=always --group-directories-first -a -l --git -h'
alias lg="lazygit"

# Initial set up for poetry.
# https://python-poetry.org/docs/#installing-manually
# python3 -m venv $VENV_PATH
# $VENV_PATH/bin/pip install -U pip setuptools
# $VENV_PATH/bin/pip install poetry
# To uninstall Poetry, simply delete the entire $VENV_PATH directory.
alias poetry=~/workspace/venvs/poetry/bin/poetry

alias n="nvim"
alias srcz="source $ZDOTDIR/.zshrc"
alias venvls="ls -l ~/workspace/venvs/"
alias x="exit"
