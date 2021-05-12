
### Prerequisites

Install the following packages via a [`Ninite`](https://ninite.com/) package management system:

- [KeePass 2](https://drive.google.com/file/d/15w9dJNs50uShOXdpsWAd9zL_vBfuthI_/view?usp=sharing)
- [Notepad++](https://notepad-plus-plus.org/downloads)
- [Putty](https://www.putty.org/)

Or install them manually by yourself. For a KeePass you can use a portable version:
[KeePassXC-2.3.4-Win64-portable.zip](https://drive.google.com/file/d/15w9dJNs50uShOXdpsWAd9zL_vBfuthI_/view?usp=sharing) and install it.

Install manually:
- [Git for Windows](https://git-scm.com/download/win)
- [Vagrant](http://www.vagrantup.com/downloads.html)
- [VirtualBox](https://www.virtualbox.org/wiki/Downloads)

  - Find which [VirtualBox versions](https://www.vagrantup.com/docs/providers/virtualbox) are supported.
  - Note: **Disable** `Secure Boot` in BIOS before installation. You might meet issues otherwise.
  - Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads) on Windows. 
  - Configure `Defualt Machine Folder` of VirtualBox in `File -> Preferences -> General -> Defualt Machine Folder`

Note: **DO NOT** install Ansible explicitly.

### Clone the project 

TODO (udpate it for Windows)

Run from within your home folder:
```bash
mkdir -p projects/private/tmp
cd projects/private/tmp
git clone https://github.com/AlexandrSokolov/java_dev_environments.git
cd java_dev_environments
ls -1
ansible.cfg
docs
playbooks
README.md
roles
scripts
Vagrantfile
```

### Build the dev env inside a virtual box

Run: `vagrant up`

You might meet the issue:
```bash
$ vagrant status
...
default                   not created (virtualbox)
...
$ vagrant up
...
A VirtualBox machine with the name 'Ubuntu Dev Desktop Environment' already exists.
```
To solve it run VirtualBox application itself and delete the virtual machine.
Then you can run `vagrant up` again.

