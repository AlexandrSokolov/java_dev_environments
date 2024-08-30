### Configure OpenVPN

- Get ovpn file.
- Comment with `#` or with `;` symbols the line: `#route remote_host 255.255.255.255 net_gateway`
- Open `Settings -> Network -> VPN`. Before you configured vpn per wifi-connection. Now the `network` tab is per system. 
- Click `Import from file`
- Explicitly set user: `Identity -> User name` as `alexandr.sokolov`
- Apply vpn only for internal resources:  
  IPv4 Settings -> Routes -> Use this connection only for resources on its network.
- Check the configuration, make sure, that with enabled VPN you can access both protected resources
  and not-protected one.
- If dns does not work correctly, and ONLY public resources are available, configure dns records in `/etc/hosts`.

### Configure multiple git repositories

1. Generate rsa key, one key per git repository (github, gitlab):
    ```bash
    ssh-keygen -t rsa -b 4096 -C "${email}" -f /home/${user}/.ssh/id_rsa_gitlab 
    ls -al ~/.ssh
    -rw-------  1 ${user} ${user} 3243 Nov 11 13:00 id_rsa_gitlab
    -rw-r--r--  1 ${user} ${user}  747 Nov 11 13:00 id_rsa_gitlab.pub
    ```
   Example for `${user}=alex`:
    ```bash
    ssh-keygen -t rsa -b 4096 -C "alexandr.sokolov@uptempo.io" -f /home/alex/.ssh/id_rsa_gitlab
    ssh-keygen -t rsa -b 4096 -C "sav.public@yandex.com" -f /home/alex/.ssh/id_rsa_github
    ls -al ~/.ssh
    ...
    -rw-------  1 alex alex 3389 Aug 29 20:46 id_rsa_github
    -rw-r--r--  1 alex alex  747 Aug 29 20:46 id_rsa_github.pub
    -rw-------  1 alex alex 3389 Aug 29 20:46 id_rsa_gitlab
    -rw-r--r--  1 alex alex  753 Aug 29 20:46 id_rsa_gitlab.pub
    ```

2. Upload the generated rsa public keys to your git account configuration.

- [Login](https://gitlab.dev.brandmaker.com) with your gitlab account as `alexandr.sokolov` with your domain password and VPN enabled.
- Copy ssh key into buffer: `$ xclip -sel clip < ~/.ssh/id_rsa_gitlab.pub`
- Install the `id_rsa_gitlab.pub` public key into [SSH keys](https://gitlab.dev.brandmaker.com/-/profile/keys).
- Test the connection (pathphrase will be asked)
    ```bash
    ssh -T git@gitlab.dev.brandmaker.com
    Welcome to GitLab, Alexandr Sokolov!
    ```

- [Login](https://github.com/AlexandrSokolov?) with your private gitlab account.
- Copy ssh key into buffer: `$ xclip -sel clip < ~/.ssh/id_rsa_github.pub`
- Install the `id_rsa_github.pub` public key into [SSH keys](https://github.com/settings/keys).
- Test the connection (pathphrase will be asked)
    ```bash
    ssh -T git@github.com
    Hi AlexandrSokolov! You've successfully authenticated, but GitHub does not provide shell access.
    ``` 
3. Enable multple git repositories and git accounts support:

```bash
`./scripts/multipleGitReposConfig.sh`
```

This script copies [`git.config`](../roles/ubuntu_dev/files/git.config) file into `~/.ssh/config` with the content:
```
#asokolov private account on github.com
Host github.com
	HostName github.com
	User asokolov
	IdentityFile ~/.ssh/id_rsa_github

#asokolov BM account
Host gitlab.dev.brandmaker.com
	HostName gitlab.dev.brandmaker.com
	User asokolov
	IdentityFile ~/.ssh/id_rsa_gitlab
```

4. Clone git projects and configure its git `user.name` and `user.email` settings.

**DO NOT** set global settings like:
```bash
$ git config --global user.email "you@example.com" 
$ git config --global user.name "Your Name"
```

Example for a private project:
```bash
cd ~/projects/private
todo
git config user.name asokolov
git config user.email sav.public@yandex.com
git config --list
...
user.name=asokolov
user.email=sav.public@yandex.com
```

For BM git account:
```
$ git config user.name asokolov
$ git config user.email alexandr.sokolov@uptempo.io
```
