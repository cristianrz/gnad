DIR="$(pwd)"

# Install theme
mkdir /home/${SUDO_USER}/.themes -p
cd /home/${SUDO_USER}/.themes/

git clone https://github.com/vinceliuice/vimix-gtk-themes.git
bash vimix-gtk-themes/Install

xfconf-query -c xsettings -p /Net/ThemeName -s "vimix-light-doder"
xfconf-query -c xfwm4 -p /general/theme -s "vimix-light-doder"

# Install icons & cursor
mkdir /home/${SUDO_USER}/.icons -p
cd /home/${SUDO_USER}/.icons/

wget https://dllb2.pling.com/api/files/download/id/1560239555/s/7946bc6213ac1d04d59782d47d3da7c63cfb35c0e56129470275b88ff0b89233c0faee20678bcf266ea6a26af61c2a1a4689dc5a4a29f327afb85fde64e5d0c2/t/1572193588/c/7946bc6213ac1d04d59782d47d3da7c63cfb35c0e56129470275b88ff0b89233c0faee20678bcf266ea6a26af61c2a1a4689dc5a4a29f327afb85fde64e5d0c2/lt/download/Vimix-icon-theme.tar.xz
tar -xzvf Vimix-icon-theme.tar.xz
mv Vimix-icon-theme/* /home/${SUDO_USER}/.icons/
wget https://dllb2.pling.com/api/files/download/id/1460735269/s/dd8cbb7792a1e8907729c1901ee09febf0eb0c0de7c7474a0fdadba103f4a6312a36173bb75fae9da255afcaa39205d4f80e97870dd12daeff90fbb98e474273/t/1572027021/c/dd8cbb7792a1e8907729c1901ee09febf0eb0c0de7c7474a0fdadba103f4a6312a36173bb75fae9da255afcaa39205d4f80e97870dd12daeff90fbb98e474273/lt/download/165371-Breeze.tar.gz
tar -xzvf 165371-Breeze.tar.gz

xfconf-query -c xsettings -p /Net/IconThemeName -s "Vimix-Paper"

# Install wallpaper
cd /home/${SUDO_USER}/Pictures/
wget https://raw.githubusercontent.com/cristianarbe/gettrisquel.org/master/images/banner.jpg
xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitoreDP-1/workspace0/last-image -s /home/${SUDO_USER}/Pictures/banner.jpg
xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitor0/workspace0/last-image -s /home/${SUDO_USER}/Pictures/banner.jpg

# Install panel setup
pkill xfconfd
rm /home/${SUDO_USER}/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-panel.xml

cp "$DIR/xfce4-panel.xml" /home/${SUDO_USER}/.config/xfce4/xfconf/xfce-perchannel-xml/
# Fix pulseaudio icon
cp "$DIR/gtk.css" /home/${SUDO_USER}/.config/gtk-3.0/
# Install xfwm4
rm /home/${SUDO_USER}/.config/xfce4/xfconf/xfce-perchannel-xml/xfwm4.xml
cp "$DIR/xfwm4.xml" /home/${SUDO_USER}/.config/xfce4/xfconf/xfce-perchannel-xml
rm /home/${SUDO_USER}/.config/xfce4/panel/whiskermenu-1.rc
cp "$DIR/whiskermenu-1.rc" /home/${SUDO_USER}/.config/xfce4/panel/
xfconf-query -c xsettings -p /Gtk/CursorThemeName -s Breeze

xfce4-panel -r
/usr/lib64/xfce4/xfconf/xfconfd &> /dev/null &

# Install font
mkdir -p /home/${SUDO_USER}/.fonts/
cd /home/${SUDO_USER}/.fonts/
wget -q https://www.fontsquirrel.com/fonts/download/clear-sans
unzip -o clear-sans
xfconf-query -c xsettings -p /Gtk/FontName -s "Clear Sans 12"
xfconf-query -c xfwm4 -p /general/title_font -s "Clear Sans 12"

# Install keyboard shortcuts
rm /home/${SUDO_USER}/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml
cp "$DIR/xfce4-keyboard-shortcuts.xml" /home/${SUDO_USER}/.config/xfce4/xfconf/xfce-perchannel-xml