sudo easy_install pip
sudo pip install paramiko PyYAML Jinja2 httplib2 six
sudo CFLAGS=-Qunused-arguments CPPFLAGS=-Qunused-arguments pip install ansible

sudo ansible-galaxy install ansiblebit.oracle-java
sudo ansible-galaxy install zzet.postgresql
sudo ansible-galaxy install nodesource.node
sudo ansible-galaxy install geerlingguy.git

vagrant up