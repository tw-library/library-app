git submodule update --init --recursive
git submodule foreach git pull origin master

sudo easy_install pip
pip install paramiko --user python
pip install PyYAML Jinja2 httplib2 six
CFLAGS=-Qunused-arguments CPPFLAGS=-Qunused-arguments pip install ansible

vagrant up --provider=virtualbox
