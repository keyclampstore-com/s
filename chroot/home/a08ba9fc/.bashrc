# 2025-08-29 Dmitrii Fediuk https://upwork.com/fl/mage2pro
case $- in
	*i*) ;;
	  *) return;;
esac
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
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
add_to_path "/usr/nexkit/bin" 'append'
add_to_path "/opt/puppetlabs/bin" 'append'
add_to_path "/var/qmail/bin" 'append'
export PATH
unset -f add_to_path
if [ -f "$HOME/.local/bin/composer.phar" ]; then
	alias composer="$HOME/.local/bin/composer.phar"
fi