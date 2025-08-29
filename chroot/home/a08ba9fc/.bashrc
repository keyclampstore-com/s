# 2025-08-29 Dmitrii Fediuk https://upwork.com/fl/mage2pro
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
# Node.js 14
if [ -f /opt/rh/rh-nodejs14/enable ]; then
	source /opt/rh/rh-nodejs14/enable
fi
# Ruby 2.3
if [ -f /opt/rh/rh-ruby23/enable ]; then
	source /opt/rh/rh-ruby23/enable
fi
# PHP 8.1
if [ -f /opt/remi/php81/enable ]; then
	source /opt/remi/php81/enable
fi
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
add_to_path "/usr/nexkit/bin" 'append'
add_to_path "/opt/puppetlabs/bin" 'append'
add_to_path "/var/qmail/bin" 'append'
export PATH
unset -f add_to_path
alias composer="~/.local/bin/composer.phar"