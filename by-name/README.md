
Create here for each amazon dash button a symlink to the ID symlink. The name of this symlink should be a uniqe alias name. This alias helps you to identify a dash button easier.

```
cd /path/to/by-name/
ln -s ../by-id/001/ radio-bath
```

Example:

```
amdash@iot:~/dash$ ls -lisa by-name
total 8
2752549 4 drwxr-xr-x 2 amdash amdash 4096 Jul 20 00:06 .
2752546 4 drwxr-xr-x 8 amdash amdash 4096 Jul 20 08:46 ..
2752551 0 lrwxrwxrwx 1 amdash amdash   13 Sep 22  2016 radio-bath -> ../by-id/001/
2752554 0 lrwxrwxrwx 1 amdash amdash   13 Sep 22  2016 radio-bed -> ../by-id/002/
2752532 0 lrwxrwxrwx 1 amdash amdash   13 Sep 23  2016 radio-livingroom -> ../by-id/008/
```

Now you can symlink shell scripts into a specific dash button folder.

On button press, all symlinks whose names start with `exec_` will be executed. Other symlinks will be ignored.

```
cd /path/to/by-name/radio-bath
ln -s ../../script/toggleradio.sh exec_radio
```

