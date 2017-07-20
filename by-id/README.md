
Create here for each amazon dash button a symlink to the MAC address folder. The name of this symlink should be a uniqe number. This numer helps you to identify a dash button easier.

```
cd /path/to/by-id/
ln -s ../by-mac/ac:63:be:e3:ff:ff/ 001
```

Example:

```
amdash@iot:~/dash$ ls -lisah by-id/
total 8.0K
2752561 4.0K drwxr-xr-x 2 amdash amdash 4.0K Apr  7 22:18 .
2752546 4.0K drwxr-xr-x 8 amdash amdash 4.0K Jul 20 08:46 ..
2752550    0 lrwxrwxrwx 1 amdash amdash   28 Sep 22  2016 001 -> ../by-mac/ac:63:be:e3:ff:ff/
2752553    0 lrwxrwxrwx 1 amdash amdash   28 Sep 22  2016 002 -> ../by-mac/50:f5:da:0c:ff:ff/
2752556    0 lrwxrwxrwx 1 amdash amdash   28 Sep 22  2016 004 -> ../by-mac/ac:63:be:1a:ff:ff/
```

Now you can symlink shell scripts into a specific dash button folder.

On button press, all symlinks whose names start with `exec_` will be executed. Other symlinks will be ignored.

```
cd /path/to/by-id/001/
ln -s ../../script/togglelight.sh exec_light
```

