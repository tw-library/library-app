# Kamu - ThoughtWorks Library System

This module contains the miscellanious related to the kamu api and app. Both systems are submodules, i.e. you don't need to clone them separatly.

## Setup development environment

Run `./bootstrap.sh`

This will clone both the api and the ui projects and create a vagrant machine for the development.
Ps: this process may take a while because it will download and install the projects dependencies.

In order to access the virtual machine terminal just run:

`vagrant ssh`

Once inside the virtual machine go to vagrant directory 

`cd /vagrant`

## Useful commands

Run `git submodule update --recursive` to update submodules.

Run `vagrant up` to start the virtual machine.

Run `vagrant ssh` to access the terminal of the virtual machine.

Run `lapi` on virtual machine to navigate to library-api project directory.

Run `lui` on virtual machine to navigate to library-ui project directory.

## Issues

The board is available at: http://waffle.io/tw-library/library-app
