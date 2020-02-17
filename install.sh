#!/bin/bash

[[ $(id -u) != 0 ]] && echo -e "Execute esse script com permissao de root" && exit 1
[[ -d /etc/tron_ssh ]] && rm -rf /etc/tron_ssh

while read pkt; do
    if ! which $pkt &>/dev/null; then
        echo -ne "Instalando $pkt... "
        apt-get install $pkt &>/dev/null
        echo -e 'Ok'
    fi
done <<< 'git pip3'

echo -e "Cloando projeto..."
git clone https://github.com/GlEmYsSoN444/tron_ssh.git &>/dev/null

echo -e "Instalando requirimentos..."
pip3 install -r tron_ssh/requirements.txt &>/de/null
chmod +x tron_ssh/tron
mv tron_ssh/tron /bin
mv tron_ssh /etc
echo -e "Instalacao efetuada com sucesso"
echo -e "Execute: tron"
