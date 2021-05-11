
#### 1.1 Required apps installation

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

#### 2. Build the Dev Env setup as a virtual box:

Change working directory to the `java_dev_environments` folder with `Vagrant` file

```bash
$ cd ~/projects/ansible-projects/java_dev_environments
$ ls
playbooks  roles  README.md  setGitProjects.sh  TODO.md  Vagrantfile
```

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