#!/bin/bash
#!/bin/bash
sync() {
	ego sync
}

upgrade() {
	emerge -auDN @world --keep-going
}

clean() {
	emerge --depclean
}

flat_update() {
	flatpak update --noninteractive
}

arch_update() {
	lxc exec steam-arch -- bash -c "pacman -Syyu --noconfirm"
}

help_msg() {
	echo "A generic automatic system updater script"
	echo "Default behaviour: Syncs, upgrades and cleans only the root system"
	echo "Arguments:"
	echo "  --help - This message"
	echo "  --sync - Just runs an ego sync"
	echo "  --upgrade - Sync and upgrades the world set but doesn't depclean"
	echo "  --full - Updates everything including flatpak and the arch lxd container"
}

if [ -z $1 ]; then
	sync
	upgrade
	clean
else
	if [ $1 == "--full" ]; then
		sync
		upgrade
		clean
		flat_update
		arch_update
	elif [ $1 == "--sync" ]; then
		sync
	elif [ $1 == "--upgrade" ]; then
		sync
		upgrade
	elif [ $1 == "--help" ]; then
		help_msg
	else
		help_msg
	fi
fi
