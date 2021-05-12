### Post installations, specific for local dev environment.

1. Install LibreOffice
```bash
sudo apt install libreoffice-gnome libreoffice
```

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