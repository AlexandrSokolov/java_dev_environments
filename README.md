# Ansible project to configure Ubuntu Dev (Java) Environment 

#### Supported options:

1. You installed fresh Ubuntu and want to configure it for dev environment. (local env)
2. You want to use dev environment inside of virtual machine - (virtual box env). 

    Note: the 2nd option has very high system requirements.
    
#### Features:
1. [Prerequisites](#1-prerequisites)
2. [Build the Dev Env setup](#2-build-the-dev-env-setup)
3. [Build virtual Ubuntu Dev Env setup.](#build-virtual-ubuntu-dev-env-setup)
4. [Manual steps to finish installation.](#manual-steps-to-finish-installation)         
5. [Configure OpenVPN, clone git repositories](#configure-openvpn-clone-git-repositories)

#### 1. Prerequisites:

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

#### 2. Build the Dev Env setup

[On Linux](docs/ubuntu.md#2-build-the-dev-env-setup)
[On Windows](docs/windows.md#2-build-the-dev-env-setup-as-a-virtual-box)


#### Manual steps to finish installation. 
(see `01_Ubuntu_via_Vagrant_VirtualBox_Ansible_after_installation` in Google Docs)

1. Set desktop Gnome Flashback (Metacity)
   
   Before login to the Dev Box select `Gnome Flashback (Metacity) desktop as a default one

2. Initial configuration of Ubuntu
    - Livepatch, skip
    - Skip

    Note: not actual for local dev env

3. Configure `Gnome Flashback (Metacity) desktop

    - Configure the upper panel itself. 
      - Alt + right click  -> Properties, set width (usually 40px is enough)
      - On the left side: Menu Bar (A custom menu bar) (by default). The text “Application Places”
      - Add “Window List” after the previous “Menu Bar”
      - On the right side: “Indicator Applet Complete” (by default)
      - On the left from “Indicator Applet Complete” add “Notification Area” to get notifications from Skype and other programs
      
    - Configure the button panel (pannel where buttons of opened applications are displayed)
      - Alt + right click  -> Properties, set width (usually 40px is enough)
      - On the left side it must contain Show Desktop button (by default)
      - On the right side it must contain “Workspace Switcher” (by default)
      
      **Note**: you can actually move elements you've added to the panels. 
      Press "Alt" and mouse right click on the area, where element is located. 
      You should see: "Move" and "Remove From Panel" elements.
      
    - Move Trash icon to the right button corner    
  
4. Configure Keyboard/Input Sources
Run:

```
gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'de'), ('xkb', 'ru')]"
gsettings set org.gnome.desktop.wm.keybindings switch-input-source "['']"
gsettings set org.gnome.desktop.wm.keybindings switch-input-source-backward  "['']"
gsettings set org.freedesktop.ibus.general.hotkey triggers "['']"
gsettings set org.gnome.desktop.input-sources xkb-options "['grp:alt_shift_toggle']"
```

5. Increase font size via gnome-tweaks

```
gsettings set org.gnome.desktop.wm.preferences titlebar-font 'Ubuntu 13'
gsettings set org.gnome.desktop.interface font-name 'Ubuntu 13'
gsettings set org.gnome.desktop.interface document-font-name 'Sans 13'
gsettings set org.gnome.desktop.interface monospace-font-name 'Ubuntu Mono 15'
```

6. Transmission BitTorrent Client

    Disable uploading from your box. 
    - Run Transmission BitTorrent client: Applications -> Internet -> Transmission BitTorrent Client
    - Edit -> Preferences -> Speed
    - Set “Speed LImits” -> Upload = 0; “Alternative Speed Limits” -> Upload = 0
    - Set “Speed LImits” -> Download = 2000; “Alternative Speed Limits” -> Download = 2000

7. Configure Chrome Google account

    - Visit: https://www.google.com
    - Login with the private Google account
    - Settings -> Sync On

8. Configure Firefox Google account

    - Open menu button (the most right one on the top)
    - Sign in to sync
    - Login with your work account: a.sokolov.brandmaker@gmail.com
    - Apply Sync
    - Click the menu button -> Customize (not Preferences) -> Toolbars -> Bookmarks Toolbar -> Always Show
    - Remove the 'Getting started' bookmark.

    The following settings must be set automatically after sincing applying:

    - Click the menu button -> Preferences > Language, configure it if it is not English
    - Check language used for the search in the browser
        - Search text in the browser. 
        - If the result is in German, under the element for search text, you’ll find links like: 
        German: Alle, News, Videos, Bilder, … Einstellungen, Tools 
          In English: All, Maps, Videos, Images, …, Setting, Tools
        - Click Settings/Einstellungen, the 2nd element from the right
        - Choose Language/Sprachenlanguages
        - Choose English
        - Save/Speichern

9. Double check IntelliJ IDEA

    - Run idea via Alt + F2 quick search. 
    - Set license or activate via an existing account. You can find it in the `savDb.kdbx` file.
    - Enable/disable plugins and other options.
    - Create a new empty project. 
    - In the menu -> Help -> Edit Custom VM Options. It must open an existing file with the following attributes 
        (they are modified during installation and configuration via ansible):
    ```
    -Xms1024m
    -Xmx2048m
    -XX:ReservedCodeCacheSize=512m
    ```
    Note: If IntelliJIdea offers you to create a custom file, something went wrong.
    The reason is the full path to the `idea64.vmoptions` might change. 
    For instance in previous versions it was located under:
    
    `~/.config/JetBrains/{{ IntelliJIdeaFolder }}/config`

10. Check timezone
    ```
    $ ls -l /etc/localtime
    lrwxrwxrwx 1 root root 33 Jan 10 14:45 /etc/localtime -> /usr/share/zoneinfo/Europe/Berlin
    $ timedatectl
                          Local time: Fr 2020-01-10 14:45:56 CET
                      Universal time: Fr 2020-01-10 13:45:56 UTC
                            RTC time: Fr 2020-01-10 13:24:50
                           Time zone: Europe/Berlin (CET, +0100)
           System clock synchronized: no
    systemd-timesyncd.service active: yes
                     RTC in local TZ: no
    ``` 
    See [How to Change the Timezone on your Ubuntu System](https://vitux.com/how-to-change-the-timezone-on-your-ubuntu-system/)

11. Configure Kupfer

    Preferences -> General -> Start automatically on login
    
    Preferences -> Keyboard -> Show Main Interface
    
    Change `Ctrl + space` into `Ctrl + &` Actually it is a combination of `Ctrl + Shift + 6`

12. Install LibreOffice (only for local dev environment)
    ```
    sudo apt install libreoffice-gnome libreoffice
    ```

13. Install a proprietary driver for you GPU. 

    It depends on the type of the GPU you use. 
    Please read `GPU_Видеокарта` file on the Cloud.

14. Internet speed. 

    Check you internet speed in a browser. 
    If it is too slow - for instance several MBs only, 
    try to disable the 802.11n protocol:
    
    ```
    $ sudo su
    # echo "options iwlwifi 11n_disable=1" >> /etc/modprobe.d/iwlwifi.conf
    ```

14. 

#### Configure OpenVPN, clone git repositories

1. Git is installed by default on Linux box.

2. Install and configure VPN

    - Get ovpn file.
    - Comment with `#` or with `;` symbols the line: `#route remote_host 255.255.255.255 net_gateway`
    - Import the configuration from file into `Network connections`. 
    - Apply vpn only for internal resources:  
        IPv4 Settings -> Routes -> Use this connection only for resources on its network.
    - Check the configuration, make sure, that with enabled VPN you can access both protected resources 
        and not-protected one.
    - If dns does not work correctly, and ONLY public resources are available, configure dns records in `/etc/hosts`.
    
3. Configure access for [Private Github](https://github.com/AlexandrSokolov/) account.
    
    See description in [Clone Ansible Project](#3-clone-ansible-project)
    
    **Note**: it is alredy done, if you configure environment locally

4. Configure access for [BM GitLab](gitlab.dev.brandmaker.com) account.

    - Generate key:
        ```
        $ ssh-keygen -t rsa -b 4096 -C "alexandr.sokolov@brandmaker.com" -f /home/${user}/.ssh/id_rsa_gitlab 
        $ ls -al ~/.ssh
        -rw-------  1 ${user} ${user} 3243 Nov 11 13:00 id_rsa_gitlab
        -rw-r--r--  1 ${user} ${user}  747 Nov 11 13:00 id_rsa_gitlab.pub
        ```

    - [Login](https://gitlab.dev.brandmaker.com) with your gitlab account as `alexandr.sokolov` and your domain password. 
    
    - Copy ssh key into buffer: `$ xclip -sel clip < ~/.ssh/id_rsa_gitlab.pub`
    
    - Install the `id_rsa_github.pub` public key into [SSH keys](https://gitlab.dev.brandmaker.com/profile/keys).

    - Test the connection (pathphrase will be asked)
        ```
        $ ssh -T git@gitlab.dev.brandmaker.com
        Welcome to GitLab, Alexandr Sokolov!
        ```
      
5. Clone git projects:

    `./scripts/localGitProjects.sh`
      
6.  Support of different git accounts 

    During the git projects cloning (the previous step), the `config` file:
    ```
    #AlexandrSokolov private account on github.com
    Host github.com
    	HostName github.com
    	User AlexandrSokolov
    	IdentityFile ~/.ssh/id_rsa_github
    
    
    #alexandr.sokolov BrandMaker account
    Host gitlab.dev.brandmaker.com
    	HostName gitlab.dev.brandmaker.com
    	User alexandr.sokolov
    	IdentityFile ~/.ssh/id_rsa_gitlab
    ```
     
     will be copied into `~/.ssh` folder.   

7.  Configure git username and email per repository

    When you work with different git repositories (private and work for instance),
    then **DO NOT** set global settings like:
    ```
    $ git config --global user.email "you@example.com" 
    $ git config --global user.name "Your Name"
    ```
    
    Set them per a repository instead. 
    The current configuration does not include neither `user.name` no `user.email`:
    ```
    $ git config --list
    ...
    ```
    Set the settings and chech the result:
    ```
    $ git config user.name AlexandrSokolov
    $ git config user.email sav.public@yandex.com
    $ git config --list
    ...
    user.name=AlexandrSokolov
    user.email=sav.public@yandex.com
    ```
    The information is stored in the `.git/config` file in the current folder.
    
    For BM git account:
    ```
    $ git config user.name alexandr.sokolov
    $ git config user.email alexandr.sokolov@brandmaker.com
    ```
    You should configure it each time you get a message from git like:
    ```19:00:28: *** Please tell me who you are.```
8.