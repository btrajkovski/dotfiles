#!/bin/bash

exitstatus=0
while [ $exitstatus = 0 ]
do
	CHOICE=$(whiptail --title "btrajkovski dotfiles setup" --menu "Setup options:" 16 78 6 \
	"01" "Setup vim" \
	"02" "Setup zsh (Oh My Zsh)" \
	"03" "Setup bash" \
	"04" "Setup aliases" \
	"05" "Setup tmux" \
	"06" "Setup intellij" \
	3>&2 2>&1 1>&3)

	case "${CHOICE}" in
		01)
			cp -R _vim_runtime ~/.vim_runtime
			cp _vimrc ~/.vimrc		
			sh ~/.vim_runtime/install_awesome_vimrc.sh
			exit
		;;
		02)
            sudo apt install -y zsh curl git
            sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
            cp _zshrc ~/.zshrc
            source ~/.zshrc
            chsh -s $(which zsh)
            exit
		;;
		03)
            cp _bashrc ~/.bashrc
            source ~/.bashrc
            exit
		;;
        04)
            cp _env_aliases ~/.env_aliases
            source ~/.env_aliases
            exit
        ;;
        05)
            sudo apt install -y tmux
            cp _tmux.conf ~/.tmux.conf
            source ~/.tmux.conf
            exit
        ;;
		*)
			exitstatus=1
			exit
		;;
	esac
done
