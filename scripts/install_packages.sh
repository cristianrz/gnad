
#!/bin/bash
echo "###### Installing dnf packages"
install_packages=$(cat "config/install_packages.txt")
dnf install "$install_packages" -y

uninstall_packages=$(cat "config/uninstall_packages.txt")
dnf remove "$uninstall_packages" -y

dnf upgrade -y