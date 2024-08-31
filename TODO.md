### Intelli Idea Code style settings

Save and export into file
Describe in GUI and with code examples

### not clear if still is needed:

- update-locale LANG=en_US.UTF-8
- update-locale LC_NUMERIC=de_DE.UTF-8
- update-locale LC_TIME=de_DE.UTF-8
- update-locale LC_MONETARY=de_DE.UTF-8
- update-locale LC_PAPER=de_DE.UTF-8
- update-locale LC_NAME=de_DE.UTF-8
- update-locale LC_ADDRESS=de_DE.UTF-8
- update-locale LC_TELEPHONE=de_DE.UTF-8
- update-locale LC_MEASUREMENT=de_DE.UTF-8
- update-locale LC_IDENTIFICATION=de_DE.UTF-8
- update-locale LANGUAGE=en_US

### 

- readme, $ vagrant plugin install vagrant-disksize
- run local dev via vagrant
- only for local, not via vagrant env:
  - name: "LibreOffice - Linux alternative to MS Office"
    package: libreoffice
    - update readme when you do that
- sublime, add subl link
- test docker installation
- you are forced to install docker-compose explicitely, consider how to do it via commands, automatically
- sublim configuration, set user permissions and create a file, not sure, how it works by default

```
$ ls -l ~/.config/sublime-text-3/Packages/User/Preferences.sublime-settings
-rw-r--r-- 1 alexandr alexandr 51 Dez 18 08:04 /home/alexandr/.config/sublime-text-3/Packages/User/Preferences.sublime-settings
cat ~/.config/sublime-text-3/Packages/User/Preferences.sublime-settings
{
	"font_size": 17,
	"remember_open_files": true
}
```
- fd