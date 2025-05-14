# Docs: https://zsh.sourceforge.io/Doc/Release/Prompt-Expansion.html
setopt PROMPT_SUBST

function color_return_code() {
	local exit_code=$? # For some reason it doesn't work using $? directly.
	if [[ exit_code -eq 0 ]]; then
		echo "%F{#00AA00}✓"
	else
		echo "%F{#AA0000}✗ $exit_code"
	fi
}

# You can't just call the function in the prompt.
# It's loaded once on shell startup, so it would never update.
# Instead you have to do this:
# https://stackoverflow.com/questions/11877551/zsh-not-re-computing-my-shell-prompt
# And you have to use single quotes, not double, due to something(?) about when
# the execution/interpolation happens.
local colored_exit_code='$(color_return_code)'

# vsc_info examples: https://github.com/zsh-users/zsh/blob/master/Misc/vcs_info-examples
# Get git info.
autoload -Uz vcs_info # This just marks for autoloading.
zstyle ':vcs_info:git:*' formats 'branch:%b'

# Newline: https://superuser.com/questions/382503/how-can-i-put-a-newline-in-my-zsh-prompt-without-causing-terminal-redraw-issues
precmd() {
	vcs_info # Different to the autoload. This makes the info available.
	print -rP "%F{#000000}%~%f %F{#FA6E07}%B${vcs_info_msg_0_}%b%f"
}

export PROMPT="${colored_exit_code}%f $(echo "\uf0e7") " #  is the symbol.
