ansible localhost -v \
  --module-name include_role \
  --args "name=ubuntu_dev tasks_from=checkout_git_projects" \
  --extra-vars "user=$USER"