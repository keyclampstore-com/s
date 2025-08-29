if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
alias composer="~/.local/bin/composer.phar"
source /opt/remi/php81/enable
export PATH="$HOME/.local/bin:/opt/remi/php81/root/usr/bin:/opt/remi/php81/root/usr/sbin:/opt/remi/php73/root/usr/bin:/opt/remi/php73/root/usr/sbin:/opt/rh/rh-ruby23/root/usr/local/bin:/opt/rh/rh-ruby23/root/usr/bin:/opt/rh/rh-nodejs14/root/usr/bin:/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/nexkit/bin:/opt/puppetlabs/bin:/var/qmail/bin:/usr/local/bin"