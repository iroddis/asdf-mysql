# asdf-mysql

[MySQL](https://www.mysql.com/) plugin for [asdf](https://github.com/asdf-vm/asdf) version manager.

# Deprecation

> [!WARNING]  
> asdf-mysql is looking for a maintainer. 8.0.33 is the last supported MySQL version.

As below, `asdf-mysql` has relied on an upstream project [dbdeployer](https://github.com/datacharmer/dbdeployer)
as a reliable source of MySQL versions and binary locations. That project is no longer maintained, and is
[looking for a maintainer](https://datacharmer.github.io/end-of-dbdeployer/).

I no longer use this plugin actively, and don't have it in me with Oracle's ongoing obfuscation of MySQL sources,
binary locations, etc. Long story short, it's not worth the hassle, and I'd recommend looking at alternatives.

If anyone would like to take over this project as a maintainer, please open an issue.

MySQL 8.0.33 is the last supported version.

# Thanks

Until recently, `asdf-mysql` relied on the excellent service provided by [MirrorService](https://mirrorservice.org) of
the University of Kent Computing.

In August of 2022, Oracle removed its `rsync` service for MySQL, though, making the
community edition of the server that much harder to retrieve programatically.

As a result, `asdf-mysql` has moved to using data sources provided by
the [dbdeployer](https://github.com/datacharmer/dbdeployer) project, which
has what seems like a hand-maintained database of mysql versions and URLs.

Thank you to both projects for making `asdf-mysql` possible.

# WARNING

If you already have a system installation of MySQL or MariaDB, then
you will run into issues. MySQL makes some hardcoded assumptions about config
file locations, and will not play well with a system install.

There is a `--no-defaults` flag for commands listed in the command
help, but for some reason, it's an unknown argument.

# Dependencies

## Mac
    1. [Homebrew](https://brew.sh): used to install the remainder of the dependencies
    1. `brew install gcc xz`
    1. **For version 6.0 and older**
      * `cmake` and XCode

## Linux

| **Distribution** | **Packages** |
|---|---|
| Debian derivatives | `curl libaio1 libtinfo5 libncurses5 numactl` |
| Arch derivatives | `curl libaio ncurses5-compat-libs numactl` |
| Fedora/RHEL | `curl libaio1 ncurses-compat-libs numactl` |

# Install

```
asdf plugin-add mysql
asdf list-all mysql
asdf install mysql [VERSION]
asdf global mysql [VERSION]
```

# Setup

To set up the initial database in directory DATADIR. It's important
that DATADIR is an absolute path

* For 5.x
  1. `mysql_install_db --datadir=DATADIR`
  1. `mysql_secure_installation`
* For 8.x+
  1. `mysqld --initialize-insecure --datadir=DATADIR`
  1. `mysql_ssl_rsa_setup --datadir=DATADIR`


# Running

To run the server: `mysqld -D --datadir=DATADIR --lc-messages-dir="$(dirname $(asdf which mysqld))/../share"`
* For 8.x+: `mysqld_safe --lc-messages-dir="$(dirname $(asdf which mysqld))/../share" --datadir=DATADIR`

# ASDF options

Check [asdf](https://github.com/asdf-vm/asdf) readme for instructions on how to install & manage versions of MySQL.
