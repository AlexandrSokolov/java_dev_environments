# Ansible project to configure Ubuntu Dev (Java) Environment 

#### Supported options:

1. You installed fresh Ubuntu and want to configure it for dev environment. (local env)
2. You want to use dev environment inside a virtual machine - (virtual box env). 
  
   Note: the 2nd option has very high system requirements.
    
### Setup

[On Linux as local env](docs/ubuntu.md)
[On Windows as Virtual Box env](docs/windows.md)

### Manual steps to finish installation

(see `01_Ubuntu_via_Vagrant_VirtualBox_Ansible_after_installation` in Google Docs)

##### 1. Set desktop Gnome Flashback (Metacity)

   Select `Gnome Flashback (Metacity)` desktop as a default one before login to the Dev Box 

##### 2. Initial configuration of Ubuntu
- Livepatch, skip
- Skip

Note: not actual for local dev env

##### 3. Configure `Gnome Flashback (Metacity) desktop

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

##### 4. Configure Keyboard/Input Sources
   Run:

```
gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'de'), ('xkb', 'ru')]"
gsettings set org.gnome.desktop.wm.keybindings switch-input-source "['']"
gsettings set org.gnome.desktop.wm.keybindings switch-input-source-backward  "['']"
gsettings set org.freedesktop.ibus.general.hotkey triggers "['']"
gsettings set org.gnome.desktop.input-sources xkb-options "['grp:alt_shift_toggle']"
```

##### 5. Increase font size via gnome-tweaks

```
gsettings set org.gnome.desktop.wm.preferences titlebar-font 'Ubuntu 13'
gsettings set org.gnome.desktop.interface font-name 'Ubuntu 13'
gsettings set org.gnome.desktop.interface document-font-name 'Sans 13'
gsettings set org.gnome.desktop.interface monospace-font-name 'Ubuntu Mono 15'
```

##### 6. Transmission BitTorrent Client

   Disable uploading from your box.
- Run Transmission BitTorrent client: Applications -> Internet -> Transmission BitTorrent Client
- Edit -> Preferences -> Speed
- Set “Speed LImits” -> Upload = 0; “Alternative Speed Limits” -> Upload = 0
- Set “Speed LImits” -> Download = 2000; “Alternative Speed Limits” -> Download = 2000


##### 7. Double check IntelliJ IDEA

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

##### 8. Check timezone
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

##### 9. Configure `Kupfer`

    Preferences -> General -> Start automatically on login

    Preferences -> Keyboard -> Show Main Interface

    Change `Ctrl + space` into `Ctrl + &` Actually it is a combination of `Ctrl + Shift + 6`

##### 10. Configure your system account for a ssh connection to your github.com account.

Make sure you have a login and password for your github.com account. 
Store them the KeePassXC database on the Cloud storage.

In this example I show how to configure `alex` system account for [AlexandrSokolov github account](https://github.com/AlexandrSokolov/)

- Generating SSH key for [Private Github](https://github.com/AlexandrSokolov/) account.
```bash
$ ssh-keygen -t rsa -b 4096 -C "${email}" -f /home/${user}/.ssh/id_rsa_github
```
   For instance for `${user}` - `alex` and `${email}` - `sav.public@yandex.com`:
```bash
$ ssh-keygen -t rsa -b 4096 -C "sav.public@yandex.com" -f /home/alex/.ssh/id_rsa_github
$ ls -al ~/.ssh
-rw-------  1 alex alex 3243 Nov 11 13:00 id_rsa_github
-rw-r--r--  1 alex alex  747 Nov 11 13:00 id_rsa_github.pub
```
- Login to [AlexandrSokolov github account](https://github.com/AlexandrSokolov/)

- Copy ssh key into buffer:

  `xclip -sel clip < ~/.ssh/id_rsa_github.pub`

- Install the `id_rsa_github.pub` public key into your account:
  [GitHub SSH keys](https://github.com/settings/ssh)

- Test the connection to github (pathphrase will be asked)
  ```
  $ ssh -T git@github.com
  Hi AlexandrSokolov! You've successfully authenticated, but GitHub does not provide shell access.
  ```    

### Installation steps, specific in case you install local dev environment

[Local dev env post installation](docs/local.specific.md)

### Private installation steps  

[Ignore it if you are not me:)](docs/private.md#installation-steps-for-my-own-environment)
