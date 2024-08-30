ansible localhost -v \
  -become \
  --ask-become-pass \
  --module-name include_role \
  --args "name=ubuntu_dev tasks_from=java_dev" \
  --extra-vars "user=$USER"
