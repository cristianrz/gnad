
readonly pia_exists=$(find /etc/openvpn/ -name "pia*" | wc -l)
if [[ $pia_exists -eq 0 ]]; then
		cd /tmp/ || exit
		echo "###### Installing PIA"
		wget "$PIA_URL"
		bash pia-nm.sh
else
		echo "PIA is already installed"
fi
