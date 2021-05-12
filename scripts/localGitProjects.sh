ansible localhost -v \
  --module-name include_role \
  --args "name=ubuntu_dev tasks_from=clone_git_projects" \
  --extra-vars "user=$USER"