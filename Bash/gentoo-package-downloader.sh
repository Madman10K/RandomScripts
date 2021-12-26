#!/bin/bash
function downloadWithAsking()
{
    emerge -av doas sysstat doxygen emacs vim vscode-bin lxd virtualbox-bin neofetch libreoffice flaggie layman fish
    emerge -av mongodb arduino go mono nim rust clion glslang goland meson perf valgrind git-lfs supertuxkart
    emerge -av gnome-keyring lxdm thunderbird-bin font-essentials jetbrains-mono ttf-bitstream-vera
    emerge -av twemoji-color-font inkscape krita libsdl libsdl2 shaderc vulkan-loader vulkan-layers audacity
    emerge -av flameshot fontforge gimp imagemagick cmus pavucontrol pulseaudio droidcam ffmpeg mpv obs-studio
    emerge -av avahi filezilla betterdiscordctl discord-bin teams libproxy nodejs networkmanager openssh
    emerge -av xmrig youtube-dl qbittorrent networkmanager-openvpn openvpn tor rtl8192eu fritzing flatpak
    emerge -av haveged hwinfo lm_sensors nss-mdns etcher-bin grub os-prober sof-firmware jfsutils ntfs3g
    emerge -av debian-sources linux-firmware acpi htop firefox-bin links vivaldi xorg-x11 nvidia-kernel-modules
    emerge -av komorebi mugshot polybar rofi kitty arc-theme papirus-icon-theme 
    emerge -av spirv-headers spirv-llvm-translator vulkan-tools sxhkd
    emerge -av xfce4-whiskermenu-plugin xfce4-power-manager xfce4-meta
}

function downloadWithoutAsking()
{
    emerge doas sysstat doxygen emacs vim vscode-bin lxd virtualbox-bin neofetch libreoffice flaggie layman fish
    emerge mongodb arduino go mono nim rust clion glslang goland meson perf valgrind git-lfs supertuxkart
    emerge gnome-keyring lxdm thunderbird-bin font-essentials jetbrains-mono ttf-bitstream-vera
    emerge twemoji-color-font inkscape krita libsdl libsdl2 shaderc vulkan-loader vulkan-layers audacity
    emerge flameshot fontforge gimp imagemagick cmus pavucontrol pulseaudio droidcam ffmpeg mpv obs-studio
    emerge avahi filezilla betterdiscordctl discord-bin teams libproxy nodejs networkmanager openssh
    emerge xmrig youtube-dl qbittorrent networkmanager-openvpn openvpn tor rtl8192eu fritzing flatpak
    emerge haveged hwinfo lm_sensors nss-mdns etcher-bin grub os-prober sof-firmware jfsutils ntfs3g
    emerge debian-sources linux-firmware acpi htop firefox-bin links vivaldi xorg-x11 nvidia-kernel-modules
    emerge komorebi mugshot polybar rofi kitty arc-theme papirus-icon-theme 
    emerge spirv-headers spirv-llvm-translator vulkan-tools sxhkd
    
    while true; do
        read -rp "Install xfce? Y(Yes)/N(No): " yn
        case $yn in
            [Yy]* ) break;;
            [Nn]* ) exit;;
            * ) echo "Please answer with Y(Yes) or N(No)!";;
        esac
    done

    emerge xfce4-whiskermenu-plugin xfce4-power-manager xfce4-meta
}

while true; do
    read -rp "Ask? Y(Yes)/N(No): " yn
    case $yn in
        [Yy]* ) downloadWithAsking();;
        [Nn]* ) downloadWithoutAsking;;
        * ) echo "Please answer with Y(Yes) or N(No)!";;
    esac
done
