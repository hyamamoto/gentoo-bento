Gentoo-Bento-Boxes
==================

This is an incubation project for building Gentoo based [Vagrant](http://www.vagrantup.com) baseboxes.

A primary obejective of this project is to create disposable, clean, idempotent, and updatable virtual boxes, a sort of "Your Stage 4" of Gentoo Linux distro. 
By updating stage4 builder, you may end up building  your own ideal 
environment and preserve it in a virtual image.

Stable features from this project will be pushed to the [veewee](https://github.com/jedi4ever/veewee) repository, also the baseboxes encapsulated by these veewee definitions will be publicly available.


Downloads
-----------

This repository includes veewee definitions below

### Plain Flavor: box with chef, puppet, git and vim

 * [gentoo-latest-amd64](https://dl.dropboxusercontent.com/s/qubuaqiizvfpsyx/gentoo-20131024-amd64.box) : Gentoo 2013.10.24 amd64 (chef, puppet) on 2013.10.30
    - 416.4 MB
    - packaged with 'unicode noX' setting
    - [VirtualBox](https://www.virtualbox.org/) Guest Additions 4.3
    - chef-10.24.0, and puppet-3.3.1
 * [gentoo-latest-i686](https://dl.dropboxusercontent.com/s/xfl63k64zliixid/gentoo-20131029-i686.box) : Gentoo 2013.10.29 i686 (chef, puppet) on 2013.10.30
    - 413.1 MB
    - packaged with 'unicode noX' setting
    - VirtualBox Guest Additions 4.3
    - chef-10.24.0, and puppet-3.3.1

### Minimal Flavor: no source, no doc, no man, nor no info

 * [gentoo-latest-amd64-minimal](https://dl.dropboxusercontent.com/s/mfurnvstqoj8w47/gentoo-20131024-amd64-minimal.box) : Gentoo 2013.10.24 amd64 minimal on 2013.10.30
    - 279.7 MB
    - packaged with 'unicode noman noinfo nodoc noX' setting
    - VirtualBox Guest Additions 4.3
 * [gentoo-latest-i686-minimal](https://dl.dropboxusercontent.com/s/0e23qmbo97wb5x2/gentoo-20131029-i686-minimal.box) : Gentoo 2013.10.29 amd64 minimal on 2013.10.30
    - 266.2 MB
    - packaged with 'unicode noman noinfo nodoc noX' setting
    - VirtualBox Guest Additions 4.3

<!---

kernel is based on gentoo-sources-3.10.7-r1  
gentoo-xxx-amd64 definitions are tested against 20131024 snapshot.  
gentoo-xxx-i686 definitions are tested against 20131029 snapshot.  

-->


Things to do on your first boot
-------------------------------


### Change your default locale

Default is "en_US.UTF-8". Let's say your preferred language a French. Then do this.

> echo fr_FR.UTF-8 UTF-8 >> /etc/locale.gen  
> locate-gen  
> sed -i "s/en_US.UTF-8/fr_FR.UTF-8/g" /etc/env.d/02locale  
> env-update && source /etc/profile  


###  Hey ma, my portage is empty!

When your system is booted for the first time. Hit like

> emerge --sync           ( or emerge-webrsync)

to make sure the portage tree in your system is populated.


### Check USE flags

USE flags have been customized for each basebox.
Hit this commands to see what you already have in your box.

> cat /etc/portage/package.use/*  
> cat /etc/portage/make.conf | grep USE

If you change the portage setting, Run

> emerge -NuDav [package or 'world']

to rebuild affected packages.


### Add your custom ebuilds in /usr/local/portage

"/usr/local/portage" is located for your local portage by default.
Put your customized ebuilds there and emerge. You can choose [Layman](http://wiki.gentoo.org/wiki/Layman) route as well.


Future plans
------------

* Smaller box (squash it)
* Minimal X setup
* Fully configured but lightweight X setup
* Convert these definition to Packer templates


