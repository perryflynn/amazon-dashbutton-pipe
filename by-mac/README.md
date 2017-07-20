
Create here for each amazon dash button a subfolder with the MAC address of the amazon dash button as name.

Example:

```
amdash@iot:~/dash$ ls -lisah by-mac/
total 48K
2752545 4.0K drwxr-xr-x 12 amdash amdash 4.0K Apr  7 22:17 .
2752546 4.0K drwxr-xr-x  8 amdash amdash 4.0K Jul 20 08:46 ..
2752586 4.0K drwxr-xr-x  2 amdash amdash 4.0K Jul 20 00:06 0c:47:c9:87:ff:ff
2752552 4.0K drwxr-xr-x  2 amdash amdash 4.0K Sep 23  2016 50:f5:da:0c:ff:ff
2752587 4.0K drwxr-xr-x  2 amdash amdash 4.0K Nov 17  2016 50:f5:da:1f:ff:ff
```

Now you can symlink shell scripts into a specific dash button folder.

On button press, all symlinks whose names start with `exec_` will be executed. Other symlinks will be ignored.

```
cd /path/to/by-mac/0c:47:c9:87:ff:ff
ln -s ../../script/togglelight.sh exec_light
```

