# github.com/nQx1
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
shopt -s autocd

# general purpose aliases
alias ll='ls -lh'
alias ls='ls --color=auto'
alias vi='vim'

# default PS1='[\u@\h \W]\$ '
export PS1="[\u::\h@\w]\[$(tput sgr0)\]"

# Fetch distribution name, this requires lsb-release package to be installed
distro=$(lsb_release -is)

# Set aliases for specific distribution
case $distro in
    "Arch" | "Artix")
        alias install='sudo pacman -S' 
        alias sync='sudo pacman -Syy'
        alias search='pacman -Ss' 
        alias update='sudo pacman -Syyu' 
        alias aur-install='yay -S'
        alias aur-search='yay -Ss'
        alias remove='sudo pacman -Rcns'
        ;;
    "Ubuntu" | "Debian" | "Mint")
        alias install='sudo apt install'
        alias update='apt update'
        alias upgrade='sudo apt upgrade'
        alias search='apt search'
        alias remove='sudo apt remove'
        ;;
    "Fedora" | "Red Hat")
        alias install='sudo dnf install'
        alias update='sudo dnf update'
        alias upgrade='sudo dnf upgrade'
        alias search='dnf search'
        alias remove='sudo dnf remove'
        ;;
    "Void")
        alias install='sudo xbps-install'
        alias update='sudo xbps-install -Su'
        alias search='xbps-query -R'
        alias remove='sudo xbps-remove'
        ;;
    "Gentoo" | "Funtoo")
        alias install='sudo emerge -av'
        alias sync='emerge-webrsync'
        alias update='sudo emerge --dselect'
        alias clean='sudo emerge --depclean -vp'
        alias update='sudo emerge --ask --verbose --update --deep --changed-use @world'
        alias search='emerge --search'
        alias list='qlist -IRv'
        alias remove='sudo emerge -cav'
        ;;
esac
