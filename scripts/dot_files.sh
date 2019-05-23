
		printf "\n### Initiating\n"
readonly REPO="https://github.com/cristianarbe/dot-files.git"

if [[ -f /home/${SUDO_USER}/README.md ]]; then
		echo "Dot files are already set"
else
		echo "###### Setting up dot files"
		cd  /tmp/ || exit
		git clone "$REPO"
		cd dot-files || exit
		shopt -s dotglob
		mv /tmp/dot-files/* "/home/${SUDO_USER}/"
fi