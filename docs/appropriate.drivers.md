TODO

### Manual steps to finish installation

(see `01_Ubuntu_via_Vagrant_VirtualBox_Ansible_after_installation` in Google Docs)


2. Install a proprietary driver for you GPU.

It depends on the type of the GPU you use.
Please read `GPU_Видеокарта` file on the Cloud.

3. Internet speed.

Check you internet speed in a browser.
If it is too slow - for instance several MBs only,
try to disable the 802.11n protocol:

```bash
$ sudo su echo "options iwlwifi 11n_disable=1" >> /etc/modprobe.d/iwlwifi.conf
```