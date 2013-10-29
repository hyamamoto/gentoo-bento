veewee-definitions
==================

This is my incubation project for building Vagrant baseboxes.

The primary goal here is to create disposable, clean, idempotent, and updatable
Gentoo bento base boxes. Also these definition files are meant to build
"Your Stage 4" of Gentoo Linux destro. By updating stage4 for your own system, 
you eventually build your ideal environment and preserve it in a vagrant basebox.

Stable features in this project will be pushed to the veewee repository, and
also the baseboxes encapsulated by these veewee definitions will be publicly available.


Definitions
-----------

This repository includes veewee definitions below

### Basic box with chef, puppet, git and vim

* gentoo-latest-amd64
* gentoo-latest-i686

<!---

### Minimum box without gentoo-sources, doc, man nor info

* gentoo-latest-amd64-minimal
* gentoo-latest-i686-minimal


kernel is based on gentoo-sources-3.10.7-r1  
gentoo-xxx-amd64 definitions are tested against 20131024 snapshot.  
gentoo-xxx-i686 definitions are tested against 20131022 snapshot.  

-->


Things to do on your first boot
-------------------------------


### Change your default locale

Default is "en_US.UTF-8". Let's say your preferred language a French. Then do this.

> echo fr_FR.UTF-8 UTF-8 >> /etc/locale.gen  
> locate-gen  
> sed -i "s/en_US.UTF-8/fr_FR.UTF-8/g" /etc/env.d/02locale  
> env-update && source /etc/profile  


### Check USE flags

USE flags have been customized for each basebox.
Hit this command to see what you have in your box.

> cat /etc/portage/package.use/*


###  Hey ma, my portage is empty!

When your system is booted for the first time. Hit like

> emerge --sync           ( or emerge-webrsync)

to make sure the portage tree in your system is populated.


### Add your custom ebuild to /usr/local/portage

"/usr/local/portage" is located for your local portage by default.
Put your customized ebuilds there and emerge.


Future plans
------------

* Smaller box
* Minimal X setup
* Fully configured but lightweight X setup
* Mac OS X Maverick definitions
* Convert these to Packer templates


--
Hiroshi Yamamoto (higon@freepress.jp)
