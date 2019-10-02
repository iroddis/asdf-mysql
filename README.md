# asdf-mysql

[MySQL](https://www.mysql.com/) plugin for [asdf](https://github.com/asdf-vm/asdf) version manager.

## WARNING

If you already have a system installation of MySQL or MariaDB, then
you will run into issues. MySQL makes some hardcoded assumptions about config
file locations, and will not play well with a system install.

There is a ```--no-defaults``` flag for commands listed in the command
help, but for some reason, it's an unknown argument.

## Dependencies

* Mac
    1. [Homebrew](https://brew.sh): used to install the remainder of the dependencies
    1. ```brew install gcc xz```
* Linux
    1. libtinfo5
    1. libaio1

## Install

```
asdf plugin-add mysql
asdf list-all mysql
asdf install mysql [VERSION]
asdf global mysql [VERSION]
```

## Setup

To set up the initial database in directory DATADIR. It's important
that DATADIR is an absolute path

* For 5.x
  1. ```mysql_install_db --datadir=DATADIR```
  1. ```mysql_secure_installation```
* For 8.x+
  1. ```mysqld --initialize-insecure --datadir=DATADIR```
  1. ```mysql_ssl_rsa_setup --datadir=DATADIR```


## Running

To run the server: ```mysqld -D --datadir=DATADIR```
* For 8.x+: ```mysqld_safe --datadir=DATADIR```
  

## ASDF options

Check [asdf](https://github.com/asdf-vm/asdf) readme for instructions on how to install & manage versions of MySQL.
