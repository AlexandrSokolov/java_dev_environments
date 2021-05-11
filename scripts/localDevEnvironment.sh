ansible-playbook \
  -v \
  --ask-become-pass \
  -i ../inventories/local \
  --extra-vars "user=$USER" \
  playbooks/installDevEnv.yml