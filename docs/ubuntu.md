
#### 1.1 Required apps installation

```bash
sudo apt update
sudo apt install keepassxc
sudo apt install git-all
sudo apt install ansible
sudo apt install xclip
```

#### 1.2 Configure local system for [AlexandrSokolov github account](https://github.com/AlexandrSokolov/)

- Generating SSH key for [Private Github](https://github.com/AlexandrSokolov/) account.
  ```
  $ ssh-keygen -t rsa -b 4096 -C "${email}" -f /home/${user}/.ssh/id_rsa_github
  ```

For instance for `${user}` - `alex` and `${email}` - `sav.public@yandex.com`:
  ```      
  $ ssh-keygen -t rsa -b 4096 -C "sav.public@yandex.com" -f /home/alex/.ssh/id_rsa_github
  $ ls -al ~/.ssh
  -rw-------  1 alex alex 3243 Nov 11 13:00 id_rsa_github
  -rw-r--r--  1 alex alex  747 Nov 11 13:00 id_rsa_github.pub
  ```
- Login with `AlexandrSokolov` github account
  [AlexandrSokolov github account](https://github.com/AlexandrSokolov/)

- Copy ssh key into buffer:

  `xclip -sel clip < ~/.ssh/id_rsa_github.pub`

- Install the `id_rsa_github.pub` public key into your account:
  [GitHub SSH keys](https://github.com/settings/ssh)

- Test the connection to github (pathphrase will be asked)
  ```
  $ ssh -T git@github.com
  Hi AlexandrSokolov! You've successfully authenticated, but GitHub does not provide shell access.
  ```    

#### 2. Build the Dev Env setup

Change the working directory to the folder with the current project:

```bash
   $ cd ~/projects/private/java_dev_environments
   $ ls
   playbooks  roles  README.md  setGitProjects.sh  TODO.md  Vagrantfile
```  
Run from within the `java_dev_environments` folder:

`./scripts/localDevEnvironment.sh`  