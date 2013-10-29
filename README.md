About
=====

This is my incubation project of veewee definitions for building Vagrant baseboxes.
Baseboxes encapsulated by these definitions will be publicly available.

The primary goal here is to create disposable, clean, idempotent, and updatable
Gentoo bento base boxes. These definition files are meant to build "Your Stage 4" 
of Gentoo Linux destro. By updating stage4 for your own Gentoo system, 
you can build your ideal environment and preserve it in a vagrant basebox.

Stable features in this project will be pushed to the veewee repository.

Definitions
===========

This repository includes the definitions below

### Basic box which includes chef, puppet, git and vim

* gentoo-latest-amd64
* gentoo-latest-i686

<!---

### Minimum box without gentoo-sources, doc, man nor info

* gentoo-latest-amd64-minimal
* gentoo-latest-i686-minimal


kernel is based on gentoo-sources-3.10.7-r1  
gentoo-xxx-amd64 definitions are tested against 20131010 snapshot.  
gentoo-xxx-i686 definitions are tested against 20131022 snapshot.  

-->

Things to do after booting up
=============================

###  Hey ma, my portage is empty!

When your system is booted for the first time. Hit like

> emerge --sync           ( or emerge-webrsync)

to make sure the portage tree in your system is populated.


### Changing your default language

Default is "en_US.UTF-8". Let's say your preferred language
for your system is a French. Then do this.

> echo fr_FR.UTF-8 UTF-8 >> /etc/locale.gen  
> locate-gen  
> sed -i "s/en_US.UTF-8/fr_FR.UTF-8/g" /etc/env.d/02locale  
> env-update && source /etc/profile  


### Default local portage is ready at /usr/local/portage

"/usr/local/portage" is configured as your local portage.
Put your customized ebuilds there and emerge.


### Used USE flags

USE flags have been tuned for some of the packages.
Hit this command to see what you have in your system.

> cat /etc/portage/package.use/*

Future plans
============

* Smaller minimal packaging
* Minimal X setup
* Fully configured but lightweight X setup
* Mac OS X Maverick definitions
* Packr templates ?


--
Hiroshi Yamamoto (higon@freepress.jp)
