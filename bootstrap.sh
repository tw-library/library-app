git submodule update --init --recursive
git submodule foreach git pull origin master

sudo easy_install pip
sudo pip install paramiko PyYAML Jinja2 httplib2 six
sudo CFLAGS=-Qunused-arguments CPPFLAGS=-Qunused-arguments pip install ansible

vagrant up
