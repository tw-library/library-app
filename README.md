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

Check all aliases with `alias` command.

## Running for the first time

Run the server `api-cd && ./gradlew run`

Load sample data: `load-sample-data`

Run the front-end: `ui-cd && npm start`

Browse the application at <http://localhost:9000>

## Issues

The board is available at: https://kamu.mingle.thoughtworks.com/projects/kamu/overview
