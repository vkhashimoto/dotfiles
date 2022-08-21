#! /bin/bash

#variables
full_install=false
only_packages=false

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

dotfile () {
	log "Installing dotfile $1"
	cp -r $HOME/$1 $HOME/dotfiles-bkp
	cp -r $1 $HOME/$1
	. $HOME/$1
	log "Installed dotfile $1"
}


while test $# -gt 0; do
	case "$1" in
		-h|--help)
			echo "options:"
			echo "-h, --help	show brief help"
			echo "-a, --full	also install packages"
			echo "-p, --packages	install only packages"
			exit 0
			;;
		-a|--full)
			shift
			full_install=true
			;;
		-p|--packages)
			shift
			only_packages=true
			;;
		*)
			break
			;;
	esac
done


# install packages
if [ "$full_install" = true -o "$only_packages" = true ]; then
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
	install "bsdmainutils"

	# NeoVim - telescope dependency
	install "ripgrep"

	
	log "Installed packages"

fi

# install dotfiles
if [ "$only_packages" = false ]; then
	log "Installing dotfiles"

	log "Creating backup folder: $HOME/dotfiles-bkp"
	mkdir $HOME/dotfiles-bkp
	if [[ -d "$HOME/.config" ]]; then
		log "Backing up $HOME/.config and removing it"
		cp -r $HOME/.config $HOME/dotfiles-bkp/.config && rm -r $HOME/.config 
	fi

	log "Creating new $HOME/.config folder"
	mkdir $HOME/.config

	dotfile ".bashrc"

	### NeoVim configuration
	log "Creating neovim config folder"
	mkdir $HOME/.config/nvim
	log "Copying neovim dotfiles"
	cp -r $HOME/dotfiles/.config/nvim/* $HOME/.config/nvim/


	log "Installed dotfiles"
fi

