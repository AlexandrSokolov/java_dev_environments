ansible-playbook \
  -vvv \
  -i ../inventories/local \
  --extra-vars "user=$USER" \
  playbooks/cloneGitProjects.yml