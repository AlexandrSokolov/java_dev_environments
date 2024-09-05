### Steps:

* [Prerequisites](#prerequisites)
* [Clone the project](#clone-the-project)
* [Install system and generic packages, required in all environments]()

### Prerequisites

1. Install:
    ```bash
    sudo apt update
    sudo apt install keepassxc
    sudo apt install git-all
    sudo apt install ansible
    sudo apt install xclip
    ```
2. Download/prepare the KeePassXC database.
3. Download/prepare openvpn file for `gitlab` configuration

### Clone the project

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


### Install system and generic packages

These configuration is useful in all box environments.

1. Go through [the packages](../roles/ubuntu_dev/defaults/main/ubuntu.yml) to understand what is going to be installed.
  
2. Run from within the `java_dev_environments` folder:

    ```bash
    ./scripts/genericPackages.sh
    ```
3. Configure Keyboard/Input Sources

  See the current the current settings:
  ```bash
    gsettings get org.gnome.desktop.wm.keybindings switch-input-source
    gsettings get org.gnome.desktop.wm.keybindings switch-input-source-backward
   ```

   Switch input sources via: `Alt`+`Shift` combination.
  ```bash
    gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'de'), ('xkb', 'ru')]"
    gsettings set org.gnome.desktop.wm.keybindings switch-input-source "['<Shift>Alt_L']"
    gsettings set org.gnome.desktop.wm.keybindings switch-input-source-backward "['<Alt>Shift_L']"
    gsettings set org.freedesktop.ibus.general.hotkey triggers "['']"
    gsettings set org.gnome.desktop.input-sources xkb-options "['']"
  ```

  Trying to set switching layout via [`(GNOME) Tweaks`](https://askubuntu.com/a/967493/458132) or get the same result via command line:
  ```bash
    gsettings set org.gnome.desktop.wm.keybindings switch-input-source "['']"
    gsettings set org.gnome.desktop.wm.keybindings switch-input-source-backward  "['']"
    gsettings set org.gnome.desktop.input-sources xkb-options "['grp:alt_shift_toggle']"
  ```
  Does not function as expected. If you try to change language with `Alt`+`Shift`, the input source gets switched, 
  but in the language indicator, it is  not updated and it becomes more complicated to identify the current input source.
    
  [The solution that works](https://askubuntu.com/a/986629/458132) and described above.

### Configure browsers

1. Run `Chrome`, login with your private account and sync it.

2. Run `Firefox`, login with your private account for firefox and sync it.

   - Open menu button (the most right one on the top)
   - Sign in to sync
   - Login with your account for Firefox
   - Apply Sync. Some settings must be set automatically after syncing.

    Configure/double check:
   - Always show toolbar: press `Alt` to see the menu -> View -> Toolbars -> Bookmarks Toolbar -> Always Show
   - Additional customisation, if needed: press `Alt` to see the menu -> View -> Toolbars -> Customize Toolbar
   - Configure search language:
      - Search text in the browser.
      - If the result is in German, under the element for search text, you’ll find links like:
        German: Alle, News, Videos, Bilder, … Einstellungen, Tools
        In English: All, Maps, Videos, Images, …, Setting, Tools
      - Click Settings/Einstellungen, the 2nd element from the right
      - Choose Language/Sprachenlanguages
      - Choose English
      - Save/Speichern

### Check `kazam` record screen tool

If you get a black screen when try to record with kazam, try the following solutions:
1. In `/etc/gdm3/custom.conf` file comment out the following line:
    ```properties
    [daemon]
    # Uncomment the line below to force the login screen to use Xorg
    WaylandEnable=false
    ```
2. [Screencast only records a black box:](https://askubuntu.com/a/1177775/458132)
    - Save your files and log out of your account.
    - Go to log in normally, but do not click sign in. Instead, click the gear beside the sign in button.
    - Select either Ubuntu if you also see `Ubuntu on Wayland` as an option, or `Ubuntu on XORG.` 
   Note: in my case I switched to `Ubuntu on XORG.`

Alternative to `kazam` - `green-recorder`:
```bash
sudo add-apt-repository ppa:fossproject/ppa
sudo apt update
sudo apt install green-recorder
green-recorder
```

### Install LibreOffice (only locally, not on the virtual box)

```bash
sudo apt install libreoffice-gnome libreoffice
```

### Install media tools (only locally, not on the virtual box)

1. Go through [the packages](../roles/ubuntu_dev/defaults/main/ubuntu_media.yml) to understand what is going to be installed.

2. Run from within the `java_dev_environments` folder:

  ```bash
  ./scripts/mediaPackages.sh
  ```

### Install Virtual Box and Vagrant Dev Opts tools (only if you install Ubuntu on virtual box)

1. Go through [the packages](../roles/ubuntu_dev/defaults/main/dev_ops.yml) to understand what is going to be installed.

2. Run from within the `java_dev_environments` folder:

    ```bash
    ./scripts/devOpsPackages.sh
    ```

### Install dev tools

1. Go through [the packages](../roles/ubuntu_dev/defaults/main/dev_java.yml) to understand what is going to be installed.
2. Run from within the `java_dev_environments` folder:

```bash
./scripts/devEnvironment.sh
```

- Run IntelliJIdea
- Sign in or activate the license.
- Open `Menu -> Help -> Edit Custom VM Options`. It must open an existing file with the following attributes
  (they are modified during installation and configuration via ansible):
  ```
  -Xms1024m
  -Xmx4096m
  -XX:ReservedCodeCacheSize=512m
  ```
Note: If IntelliJIdea offers you to create a custom file, something went wrong.
The reason is the full path to the `idea64.vmoptions` might change.
For instance in previous versions it was located under:

`~/.config/JetBrains/{{ IntelliJIdeaFolder }}/config` but not under `~/.config/JetBrains/{{ IntelliJIdeaFolder }}/`

Notes:
1. Do not install `maven` from the default packages, We need different versions, and they can be only downloaded and installed.
2. Do not install `git`. We install it as a prerequisite via `git-all` package.

### Install multiple maven versions

1. [Identify the existing Maven version and what is needed](https://maven.apache.org/docs/history.html)

  Currently, the last version: `3.9.9`. Also for old projects and Java 8 can be used: `3.6.3`

2. Download from [https://archive.apache.org/dist/maven/maven-3/](https://archive.apache.org/dist/maven/maven-3/) 
   via browser or with `wget` maven binary file in `tar.gz` format:

  ```bash
  wget https://archive.apache.org/dist/maven/maven-3/3.9.9/binaries/apache-maven-3.9.9-bin.tar.gz
  ```

3. Extract the archive in the `/opt` directory and check result: 
  ```bash
    sudo tar -xvf apache-maven-3.9.9-bin.tar.gz -C /opt
    ls -l /opt/apache-maven-3.9.9/
  ```

4. Configure `update-alternatives` with maven:

    ```bash
    update-alternatives --display mvn
    update-alternatives: error: no alternatives for mvn
    ```
    Install mvn versions/links:
    ```bash
    sudo update-alternatives --install /usr/bin/mvn mvn /opt/apache-maven-3.9.9/bin/mvn 399
    sudo update-alternatives --install /usr/bin/mvn mvn /opt/apache-maven-3.6.3/bin/mvn 363
    ```
    Check result:
    ```bash
    update-alternatives --display mvn
    mvn - auto mode
      link best version is /opt/apache-maven-3.9.9/bin/mvn
      link currently points to /opt/apache-maven-3.9.9/bin/mvn
      link mvn is /usr/bin/mvn
    /opt/apache-maven-3.6.3/bin/mvn - priority 363
    /opt/apache-maven-3.9.9/bin/mvn - priority 399
    ```
    
    Check current version:
    ```bash
    mvn --version
    Apache Maven 3.9.9 (8e8579a9e76f7d015ee5ec7bfcdc97d260186937)
    ```

5. To change mvn version:
    ```bash
    sudo update-alternatives --config mvn
    ```

### [Install Docker](https://docs.docker.com/engine/install/ubuntu/)

See also:
[Linux post-installation steps for Docker Engine](https://docs.docker.com/engine/install/linux-postinstall/)

Note: everything from official documentation is included into [`addDocker.sh`](../scripts/addDocker.sh)

To install docker, run:
```bash
./scripts/addDocker.sh
```

Check Docker installation:
```bash
docker run hello-world
```

### [Configure OpenVpn and multiple git repositories support](vpn.and.git.configuration.md)

### Clone git projects, if you haven't copied them from the old system

1. [Git projects for cloning](../roles/ubuntu_dev/defaults/main/git_projects.yml)
2. Run:
  ```bash
  ./scripts/checkoutGitProjects.sh
  ```
3. Clone the following projects manually (git history is too big, it takes very long):
```bash
cd ~/projects/bm
git clone git@gitlab.dev.brandmaker.com:mrm/dse.git
git clone git@gitlab.dev.brandmaker.com:mrm/dse-web.git
git clone git@gitlab.dev.brandmaker.com:maps/maps.git
```