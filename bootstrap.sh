git submodule update --init --recursive

cd api
git checkout master
git pull

cd ../ui
git checkout master
git pull

cd ..

sudo easy_install pip
sudo pip install paramiko PyYAML Jinja2 httplib2 six
sudo CFLAGS=-Qunused-arguments CPPFLAGS=-Qunused-arguments pip install ansible

vagrant up
