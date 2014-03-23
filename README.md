# Medusa Cookbook

Simple cookbook to build [Medusa](http://foofus.net/goons/jmk/medusa/medusa.html) from source.

Need to also compile [libssh2](http://www.libssh2.org/) from scratch to [support SSH brute forcing](http://foofus.net/goons/jmk/medusa/medusa-ssh.html).

# Requirements

Requires the following packages on Ubuntu:

  * build-essential
  * libncp-dev
  * libpcre3-dev
  * libpq-dev
  * libsvn-dev
  * libafpclient-dev
  * libgcrypt-dev

Note: Only tested under Ubuntu 12.04 LTS 64-bit.

# Usage

To spin up an Ubuntu install using [Vagrant](http://vagrantup.com).

```
git clone https://github.com/werrett/medusa-cookbook.git medusa-vm
cd medusa-vm
vagrant up --provision
...
vagrant ssh
medusa -V
medusa -h localhost -u test -p test -M ssh
```

# Attributes


Medusa Attributes

  * version - Version of Medusa to install.
  * binary - Install location for the Medusa binaries.
  * url - URL to pull Medusa source from.
  * configure_options - Arguments passed to `configure`.
  * make_options - Arguments passed to `make`.
  * install_options - Arguments passed to `make install`.


Libssh2 Attributes

  * version - Version of Libssh2 to install.
  * url - URL to pull Libssh2 source from.
  * configure_options - Arguments passed to `configure`.
  * make_options - Arguments passed to `make`.
  * install_options - Arguments passed to `make install`.

# Author

Jonathan Werrett (<jonathan@werrett.hk>)
