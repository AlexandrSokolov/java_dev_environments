# Ansible project to configure Ubuntu Dev (Java) Environment

### Notes:

#### We use standard GNOME desktop.

It is easier to configure. You just need to get used to it. It's pretty convenient with some configuration applied.

`Gnome Flashback (Metacity)` desktop is not used anymore in the configuration scripts.

#### Checking the packages when you go through them

If the package has a high importance and is used heavily, you might check its installation options. 
Probably it became part of the standard repository and its installation can be simplified.


### Supported options to configure environment for dev Ubuntu:

1. Install it locally on you box.

  [On Linux as local env](docs/ubuntu.md)

2. Use the dev Ubuntu environment on Windows inside a virtual machine - (virtual box env).  

  [todo running as virtual machine on Windows](docs/windows.md)  
  
  Note:
  - this option was not tested after new changes. you need to adopt it based [option for local env](docs/ubuntu.md)
    the 2nd option has very high system requirements and anyway, it is slower.

### Install appropriate drivers for your hardware

You might meet certain performance issue. As a result, it might help to [install appropriate drivers](docs/appropriate.drivers.md).

### Remove the current project

- Commit reasonable changes and push them.
- Delete the project locally as not needed anymore for this box.
    ```bash
    rm -rf ~/projects/private/tmp
    ```