/usr/bin/sshpass -p vagrant /usr/bin/ssh -o StrictHostKeyChecking=no vagrant@$2 "/usr/bin/sudo /bin/bash /home/vagrant/configs/actions/firewall-drop.sh add - $1"
