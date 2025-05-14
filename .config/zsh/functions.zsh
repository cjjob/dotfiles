# Explore the output any file producing command with fzf
function peek() {
	# Check if a command is provided.
	if [ "$#" -eq 0 ]; then
		echo "Error: No command provided."
		echo "Usage: peek <command>"
		return 1
	fi

	# Execute the command and pipe the output to fzf.
	"$@" |
		fzf --style full \
			--border --padding 1,2 \
			--border-label ' Peeking... ' --input-label ' Input ' --header-label ' File Type ' \
			--preview 'fzf-preview.sh {}'
}

# 'venvsrc $env' to source a specific venv.
function venvsrc() {
	# Check a single argument is passed.
	if [ "$#" -ne 1 ]; then
		echo "Error: wrong number of arguments provided."
		echo "Usage: venvsrc <venv_name>"
		return 1
	fi

	venv_path="$HOME/workspace/venvs/$1"

	# Check if the argument is a valid directory.
	if [ ! -d "$venv_path" ]; then
		echo "Error: $venv_path is not a valid directory."
		echo "Run 'venvls' to see available venvs."
		return 1
	fi

	# Check if the activate script exists.
	if [ ! -f "$venv_path/bin/activate" ]; then
		echo "Error: $venv_path/bin/activate does not exist."
		return 1
	fi

	# Source the activate script.
	source "$venv_path/bin/activate"
	echo "Activated virtual environment: $venv_path"
}

# Yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
