#!/usr/bin/env bash
#-------------------------------------------------------------------------
#   █████╗ ██████╗  ██████╗██╗  ██╗████████╗██╗████████╗██╗   ██╗███████╗
#  ██╔══██╗██╔══██╗██╔════╝██║  ██║╚══██╔══╝██║╚══██╔══╝██║   ██║██╔════╝
#  ███████║██████╔╝██║     ███████║   ██║   ██║   ██║   ██║   ██║███████╗
#  ██╔══██║██╔══██╗██║     ██╔══██║   ██║   ██║   ██║   ██║   ██║╚════██║
#  ██║  ██║██║  ██║╚██████╗██║  ██║   ██║   ██║   ██║   ╚██████╔╝███████║
#  ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝   ╚═╝   ╚═╝   ╚═╝    ╚═════╝ ╚══════╝
#-------------------------------------------------------------------------

echo -e "\nINSTALLING AUR SOFTWARE\n"
# You can solve users running this script as root with this and then doing the same for the next for statement. However I will leave this up to you.

echo "CLONING: YAY"
cd ~
git clone "https://aur.archlinux.org/yay.git"
cd ${HOME}/yay
makepkg -si --noconfirm
cd ~
touch "$HOME/.cache/zshhistory"
# Install custom version of Oh My Zsh
RUNZSH=no CHSH=no sh -c "$(curl -fsSL https://gitlab.com/marvinroman/ohmyzsh/-/raw/main/tools/install.sh)"
# Download wallpapers
rm -rf .local/share/wallpapers
git clone https://gitlab.com/marvinroman/wallpapers.git ~/.local/share/wallpapers

PKGS=(
'autojump'
'authy' # Authy Desktop 2nd factor
'awesome-terminal-fonts'
'ckb-next-git' # Corsair Keyboard configuration tool
'dbeaver' # Dbeaver SQL client
'dxvk-bin' # DXVK DirectX to Vulcan
'github-desktop-bin' # Github Desktop sync
'keepassxc-git' # Keepass password manager
'latte-dock-git' # Latte dock for dock customization
'libreoffice-slim-fixed-git' # Libre Office 
'lightly-git'
'lightlyshaders-git'
'mangohud' # Gaming FPS Counter
'mangohud-common'
'nerd-fonts-fira-code'
'nextcloud-client' # Nextcloud desktop cloud syncing
'nordic-darker-standard-buttons-theme'
'nordic-darker-theme'
'nordic-kde-git'
'nordic-theme'
'noto-fonts-emoji'
'papirus-icon-theme'
'plasma-pa'
'ocs-url' # install packages from websites
'sddm-nordic-theme-git'
'slack' # Slack chat client
'snapper-gui-git'
'thunderbird' # Thunderbird email/calendar client
'ttf-droid'
'ttf-hack'
'ttf-meslo' # Nerdfont package
'ttf-roboto'
'waterfox-classic-bin' # Waterfox Browser
'zoom' # video conferences
'snap-pac'
)

for PKG in "${PKGS[@]}"; do
    yay -S --noconfirm $PKG
done

export PATH=$PATH:~/.local/bin
cp -r $HOME/ArchTitus/dotfiles/* $HOME/.config/
pip install konsave
konsave -i $HOME/ArchTitus/kde.knsv
sleep 1
konsave -a kde

echo -e "\nDone!\n"
exit
