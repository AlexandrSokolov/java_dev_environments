ansible localhost -v \
  --module-name include_role \
  --args "name=ubuntu_dev tasks_from=multiple_git_repos_config" \
  --extra-vars "user=$USER"