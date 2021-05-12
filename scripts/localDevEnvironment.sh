#ansible-playbook \
#  -v \
#  --ask-become-pass \
#  -i ../inventories/local \
#  --extra-vars "user=$USER" \
#  playbooks/installDevEnv.yml

ansible localhost -v \
  --become-user \
  --ask-become-pass \
  --module-name include_role \
  --args "name=ubuntu_dev tasks_from=local_dev" \
  --extra-vars "user=$USER"
