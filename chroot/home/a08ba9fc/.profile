# 2025-08-29 Dmitrii Fediuk https://upwork.com/fl/mage2pro
if [ -z "$_ENV_SETUP_COMPLETE" ]; then
	declare -a env_scripts=(
		"/opt/rh/rh-nodejs14/enable" # Node.js 14
		"/opt/rh/rh-ruby23/enable"   # Ruby 2.3
		"/opt/remi/php81/enable"     # PHP 8.1
	)
	for script in "${env_scripts[@]}"; do
		if [ -f "$script" ]; then
			source "$script"
		fi
	done
	unset script env_scripts
	add_to_path() {
		local path_to_add="$1"
		local position="${2:-append}"
		if [ -d "$path_to_add" ] && [[ ":$PATH:" != *":$path_to_add:"* ]]; then
			if [ "$position" = "prepend" ]; then
				PATH="$path_to_add:$PATH"
			elif [ "$position" = "append" ]; then
				PATH="$PATH:$path_to_add"
			fi
		fi
	}
	add_to_path "$HOME/.local/bin" 'prepend'
	add_to_path "$HOME/bin" 'append'
	add_to_path "/usr/nexkit/bin" 'append'
	add_to_path "/opt/puppetlabs/bin" 'append'
	add_to_path "/var/qmail/bin" 'append'
	export PATH
	unset -f add_to_path
	# 2017-06-09 For mage2pro/core
	export DF_DEVELOPER=1
	export EDITOR="vim"
	export VISUAL="vim"
	export TERM=xterm-256color
	export _ENV_SETUP_COMPLETE=1
fi
case $- in
	*i*) ;;
	  *) return;;
esac
. /etc/bashrc
export PS1='\[\e[01;33m\]\w\n\[\e[38;5;028m\]\$ \[\e[00m\]'
eval "$(dircolors)"
export LS_OPTIONS='--color=auto -h'
alias ls='ls $LS_OPTIONS'
alias ll='ls $LS_OPTIONS -l'
alias l='ls $LS_OPTIONS -lA'
alias ..='cd ..'
alias ...='cd ../..'
alias composer="$HOME/.local/bin/composer.phar"