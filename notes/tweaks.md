# Ubuntu tweaks notes

## RAM usage
Don't install gnome-software, really, never. Remove snapd (may be use flatpak). 

## _Sound settings_

Source: http://linuxoidblog.blogspot.com/2015/06/pulseaudio.html

```bash
sudo nano /etc/pulse/daemon.conf
```

Uncomment and edit ot append these raws:
```
resample-method = src-sinc-best-quality
default-sample-format = float32le
default-sample-rate = 44100
alternate-sample-rate = 48000
```

Restart pulseaudio:
```bash
pulseaudio -k
```

## _SSD Optimization_

Source: https://averagelinuxuser.com/15-things-to-do-after-installing-linux-mint/

### Trim

Check status of trim daemon

```bash
sudo systemctl status fstrim.timer
```

and if it is inactive, activate it

```bash
sudo systemctl enable fstrim.timer
sudo systemctl start fstrim.timer
```

### Reduce write cycles

```bash
sudo nano /etc/fstab
```

Find SSD partition and add **```noatime```** before the word **```errors```** for them.

The noatime option will disable write action when the system only reads files. This option is not enabled by default on Linux Mint, probably because this option has a small risk that some programs won’t work correctly. However, you can extend the life of your SSD drive with it.
