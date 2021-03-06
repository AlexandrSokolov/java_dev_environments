
### Prerequisites

```bash
sudo apt update
sudo apt install keepassxc
sudo apt install git-all
sudo apt install ansible
sudo apt install xclip
```

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

### Build the local environment

Run from within the `java_dev_environments` folder:

```bash
./scripts/localDevEnvironment.sh
```
