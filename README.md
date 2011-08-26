VMM (or VMWare-Manager) is a script which greatly simplifies managing VMware servers in a sane and scriptable way.

It performs most of the crucial functionality provided by vSphere without asking too many unnecessary questions.


Command line reference
======================
```
<!-- POD -->
<!-- END POD -->
```

TODO
====
* Allow pattern ranges e.g. DB{10..20} DB{10,12,15}
* Post action triggers - run this script with set options on certain events. e.g. postclone=vittl-linux-init $host $password

Future commands
* Template, Untemplate
* Delete
* Bios (Sets the 'bios on next boot' flag)
* AttachCD (Sets an ISO to the VM's CD-ROM drive)
* ToolsUpgrade (Upgrade VMware tools)
