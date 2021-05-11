- readme, $ vagrant plugin install vagrant-disksize
- run local dev via vagrant
- only for local, not via vagrant env:
  - name: "LibreOffice - Linux alternative to MS Office"
    package: libreoffice
    - update readme when you do that

- extract java_dev_environment into a separate public repository
- automate IntelliJ Idea configueration:
    same as idea64.vmoptions, but in idea.properties
    https://www.jetbrains.com/help/objc/configuring-file-size-limit.html#file-size-limit
    include other configurations from: "IntelliJ_IDEA_Configuration"
    
    NOTE: instead of copying a an original file and change values in it,
    you can simplify it by copying files from ansible, 
    Reason: when we create new custom files,they are empty 
    as a result -we only need properties that we do wanot to overwrite
    
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