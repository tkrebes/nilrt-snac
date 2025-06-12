# NILRT SNAC Configuration Tool

The NILRT SNAC configuration tool is a utility that helps system administrators place their NI LinuxRT (NILRT) devices into a Secured, Network-Attached Configuration (SNAC).


# Design

This tool...
* only works in runmode. It will refuse to run from safemode.
* requires a network connection to the NI IPK feeds server, or access to an offline feeds server.
* can only be run as root.


# Installation


## Installation from the NILRT IPK Feeds

As of NILRT Base System Images 11.0 (2025Q1) and later, this project can be installed directly from the vendor's packaging.

This is the preferred method of installation for users.

```bash
opkg update && \
	opkg install nilrt-snac
```


### Uninstallation

```bash
opkg remove nilrt-snac
```


## Installation From Source

Install this project's build dependencies.

* `make`

Then build the project.

```bash
mkdir -p /usr/local/src
wget 'https://github.com/ni/nilrt-snac/archive/refs/heads/master.tar.gz' -O - | tar xzf - -C /usr/local/src
cd /usr/local/src/nilrt-snac*
make install  # prefix defaults to /usr/local
```

### Uninstallation

```bash
cd /usr/local/src/nilrt-snac
make uninstall sysconfdir=/etc
```


# Usage

## Runtime Dependencies

* `bash`
* `python3`


## CLI

After installation, the tool should be available in your PATH.

The tool has two primary modes of operation: `configure` and `verify`.


### Configure

In 'configure' mode, the tool will **apply** the SNAC configuration to the NILRT system.
This is a destructive operation that should only be run by a system maintainer during deployment.

```bash
nilrt-snac configure
```

After the script completes successfully, you will be instructed to reboot your system. Reboot into runmode and login using `root` with no password.


### Verify

In 'verify' mode, the tool will **check** that the NILRT system is in the SNAC configuration, without modifying the system state.
The operation will fail if any of the checks fail.

```bash
nilrt-snac verify
```
