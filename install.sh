#! /bin/bash

#variables
full_install=false

log () {
	echo "|$(date "+%y-%m-%d | %H:%M:%S")|> $1"
}


install () {
	log "Installing $1"
	SECONDS=0
	# minimize message output
	sudo DEBIAN_FRONTEND=noninteractive apt-get install -y -qq $1 1> /dev/null
	duration=$SECONDS
	durationMessage="$(($duration / 60)) minutes and $(($duration % 60)) seconds."
	log "Installed $1 in $durationMessage"
}

update () {
	log "Updating system"
	sudo DEBIAN_FRONTEND=noninteractive apt-get update -y -qq
	log "Updated system"
}


while test $# -gt 0; do
	case "$1" in
		-h|--help)
			echo "options:"
			echo "-h, --help	show brief help"
			echo "-a, --full	also install packages"
			exit 0
			;;
		-a|--full)
			shift
			full_install=true
			;;
		*)
			break
			;;
	esac
done


# install packages
if [ "$full_install" = true ]; then
	log "Installing packages"
	
	update
	
	install "software-properties-common"
	
	log "Adding repository for neovim"
	sudo  add-apt-repository ppa:neovim-ppa/stable -y 1> /dev/null
	log "Added repository for neovim"
	
	update
	
	install "neovim"
	install "tmux"
	install "git"
	install "curl"
	
	log "Installed packages"

fi

# install dotfiles
