Download the KeePassXC database. You can find `savDb.kdbx` file on the Cloud storage.

### Installation steps for my own environment.

#### 1. Configure Chrome Google account

- Visit: https://www.google.com
- Login with the private Google account
- Settings -> Sync On

#### 2. Configure Firefox Google account

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
  
#### 3 Configure OpenVPN

- Get ovpn file.
- Comment with `#` or with `;` symbols the line: `#route remote_host 255.255.255.255 net_gateway`
- Import the configuration from file into `Network connections`.
- Apply vpn only for internal resources:  
  IPv4 Settings -> Routes -> Use this connection only for resources on its network.
- Check the configuration, make sure, that with enabled VPN you can access both protected resources
  and not-protected one.
- If dns does not work correctly, and ONLY public resources are available, configure dns records in `/etc/hosts`.

#### 4 Configure access for [BM GitLab](gitlab.dev.brandmaker.com) account.

- Generate key:
```bash
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
  
#### 5 Clone git projects:

`./scripts/localGitProjects.sh`

#### 6.  Support of different git accounts

During the git projects cloning (the previous step), the `~/.ssh/config` file is copied:
```yaml
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

It allows you to use different accounts and ssh keys per a repository.


#### 7.  Configure git username and email per repository

When you work with different git repositories (private and work for instance),
then **DO NOT** set global settings like:
```bash
$ git config --global user.email "you@example.com" 
$ git config --global user.name "Your Name"
```

Set them per a repository instead.
The current configuration does not include `user.name` neither `user.email`:
```bash
$ git config --list
...
```
Set the settings and check the result:
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