# Ansible project to configure Ubuntu Dev (Java) Environment 

#### Supported options:

1. You installed fresh Ubuntu and want to configure it for dev environment. (local env)
2. You want to use dev environment inside a virtual machine - (virtual box env). 
  
   Note: the 2nd option has very high system requirements.
    
#### Features:
1. [Prerequisites](#prerequisites)
2. [Build the Dev Env setup](#build-the-dev-env-setup)
   
For Linux Local Environment only:
3. [Manual steps to finish installation](docs/ubuntu.md#3-manual-steps-to-finish-installation)         
5. [Configure OpenVPN, clone git repositories](docs/ubuntu.md#4-configure-openvpn-clone-git-repositories)

#### Prerequisites:

1. [Install required apps and tools.](#11-install-required-apps-and-tools)
2. [Download the KeePassXC database](#12-the-keepassxc-database)
3. [Clone the Ansible project](#13-clone-ansible-project)

#### 1.1 Install required apps and tools.

[Linux Apps](docs/ubuntu.md#11-required-apps-installation)

[Windows Apps](docs/windows.md#11-required-apps-installation)

#### 1.2 The KeePassXC database.

Download the KeePassXC database. You can find `savDb.kdbx` file on the Cloud storage.

#### 1.3. Clone Ansible project
   
On Linux [configure a local system for AlexandrSokolov github account](docs/ubuntu.md#12-configure-local-system-for-alexandrsokolov-github-accounthttpsgithubcomalexandrsokolov)
  - Clone Ansible project (change your working directory to `~/projects/private`)
    ```
    $ mkdir -p ~/projects/private
    $ cd ~/projects/private
    $ git clone git@github.com:AlexandrSokolov/java_dev_environments.git
    ```

#### Build the Dev Env setup

[On Linux](docs/ubuntu.md#2-build-the-dev-env-setup)

[On Windows](docs/windows.md#2-build-the-dev-env-setup-as-a-virtual-box)
