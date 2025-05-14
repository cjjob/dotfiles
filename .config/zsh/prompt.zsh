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
	# Get stytem appearance to determine if dark or light mode.
	local system_appearance=$(defaults read -g AppleInterfaceStyle 2>/dev/null)
	if [[ $system_appearance == "Dark" ]]; then
		local dir_color="#FFFFFF"
	else
		local dir_color="#000000"
	fi
	print -rP "%F{$dir_color}%~%f %F{#FA6E07}%B${vcs_info_msg_0_}%b%f"
}

#  \uef15
#  \uf0e7
#  \uf140
#  \ueee9
#  \uf4c3
#  \uf444
#  \uf120
export PROMPT="${colored_exit_code}%f $(echo "\uf444") "
