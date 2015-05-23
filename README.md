salt-devenv
===========

Configuration of my Crunchbang Linux dev laptop using SaltStack

Usage:

```bash
sudo add-apt-repository ppa:saltstack/salt
sudo apt-get update
sudo apt-get install salt-minion git
sudo git clone git@github.com:r8/salt-devenv.git /srv/salt 
sudo salt-call state.highstate --local
```
