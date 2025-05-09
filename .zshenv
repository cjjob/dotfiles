# Zsh Configuration Files and Loading Order:
# 1. /etc/zshenv: System-wide environment variables. Loaded first for all Zsh instances.
#    - Typically contains definitions of fundamental environment variables like PATH,
#      EDITOR, PAGER, etc., that should apply to all users. Avoid user-specific
#      configurations here.
# 2. $HOME/.zshenv: User-specific environment variables. Loaded next for each user.
#    - Ideal for setting environment variables that are specific to your user,
#      such as custom PATH additions, language settings, and sourcing other
#      configuration files (like the Cargo env file). Things that don't produce
#      output or depend on an interactive shell.
# 3. /etc/zprofile: System-wide login shell settings. Executed only for login shells.
#    - Used for commands that should only run once when you log in, like setting
#      terminal types or running initial programs.
# 4. $HOME/.zprofile: User-specific login shell settings. Executed only for login shells.
#    - Similar to /etc/zprofile but specific to your user. You might set up
#      things like starting a screen/tmux session automatically upon login.
# 5. /etc/zshrc: System-wide interactive shell settings. Executed for interactive shells.
#    - Contains configurations for the interactive Zsh environment, like aliases,
#      functions, prompt themes, and keybindings.
# 6. $HOME/.zshrc: User-specific interactive shell settings. Executed for interactive shells.
#    - This is where most of your daily Zsh customizations go: aliases (e.g., `alias ll='ls -l'`),
#      custom functions, prompt configuration (e.g., using `powerlevel10k`), keybindings,
#      and plugin managers (like Oh My Zsh or zplug).
# 7. /etc/zlogin: System-wide login shell actions. Executed last for login shells.
#    - Used for actions to perform right after login.
# 8. $HOME/.zlogin: User-specific login shell actions. Executed last for login shells.
#    - Similar to /etc/zlogin but for your user. You might run specific commands
#      or display messages after logging in.
# Order of Loading (for a login shell):
# /etc/zshenv -> $HOME/.zshenv -> /etc/zprofile -> $HOME/.zprofile ->
# /etc/zshrc -> $HOME/.zshrc -> /etc/zlogin -> $HOME/.zlogin
# Order of Loading (for an interactive non-login shell):
# /etc/zshenv -> $HOME/.zshenv -> /etc/zshrc -> $HOME/.zshrc
# Your $HOME/.zshenv is a good place for environment variable definitions
# that need to be available in all Zsh instances, both login and interactive.

# Zsh Logout Configuration Files and Loading Order:
# 1. $HOME/.zlogout: User-specific logout actions. Executed when a login shell exits.
#    - This is the primary file for defining actions to perform when you log out.
#      Common uses include:
#        - Clearing temporary files or directories.
#        - Displaying farewell messages.
#        - Running scripts to clean up resources.
#        - Logging out of other services.
# 2. /etc/zlogout: System-wide logout actions. Executed when any login shell exits.
#    - Used by system administrators to define actions that should occur for all
#      users upon logout. This might include system-wide cleanup or logging.
# Order of Loading (on logout):
# $HOME/.zlogout -> /etc/zlogout
# Typically, you would put any user-specific cleanup or actions you want to run
# when you log out of your system in your $HOME/.zlogout file.

# rustup - Rust toolchain installer
. "$HOME/.cargo/env"

#########################
# Environment variables #
#########################

# ZSH configuration
export ZDOTDIR="$HOME/.config/zsh" # Put .zshrc (and any others) here.
export HISTFILE="$ZDOTDIR/.zhistory"
export HISTSIZE=10000
export SAVEHIST=10000

# Editor
export EDITOR="nvim"
export VISUAL="nvim"

# bun
export BUN_INSTALL="$HOME/Library/Application Support/reflex/bun"
export PATH="$BUN_INSTALL/bin:$PATH"
