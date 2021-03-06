SHELL := /bin/bash

install:
	sudo true
	curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | sudo -u $$USER bash
	brew install --cask iterm2
	brew install --cask visual-studio-code
	code --install-extension shan.code-settings-sync
	brew install zsh
	curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | bash
	brew install fzf
	brew install rbenv ruby-build rbenv-default-gems rbenv-gemset
	brew install --cask phoenix
	brew install hub
	brew install direnv
	brew install python
	brew install wget
	brew tap homebrew/cask-fonts && brew install --cask font-terminess-ttf-nerd-font
	ssh-keygen
	cat ~/.ssh/id_rsa.pub
	@echo "Add this key to your github account and press enter when done";\
	read OK; \
	echo "configuring your local machine"
	alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
	echo ".cfg" >> $HOME/.gitignore
	git clone git@github.com:rpbaltazar/dotfiles.git --bare $HOME/.cfg
	mkdir -p $HOME/.config-backup && config checkout 2>&1 | egrep "\s+." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
	config checkout
	config config --local status.showUntrackedFiles no
	wget -P /tmp/ https://desktop.docker.com/mac/main/amd64/Docker.dmg
	sudo hdiutil attach /tmp/Docker.dmg
	sudo cp -R /Volumes/Docker/Docker.app /Applications
	sudo hdiutil unmount /Volumes/Docker
