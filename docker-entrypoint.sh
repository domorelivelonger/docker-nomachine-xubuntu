apt install -y git pwgen nmap screen mc htop
apt install -y pulseaudio cups libgconf2-4 iputils-ping libnss3 libxss1 xdg-utils libpango1.0-0 fonts-liberation
apt install -y tor firefox libreoffice chromium-browser

#Chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
apt update -y && apt install -y google-chrome-stable


#Install VSCode
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

apt install apt-transport-https -y
apt update
apt install code -y

apt install -y torbrowser-launcher 
apt install -y guake 
apt install -y remmina* filezilla

apt-get clean
apt-get autoclean
rm -rf /var/lib/apt/lists/*
